import 'dart:io' as io;

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../constants/strings.dart';
import 'card.dart';
import 'dialog_back.dart';

Widget cameraLoader({
  required BuildContext context,
  required ImagePicker picker,
  required Function(io.File) updateImageFile,
  io.File? imageFile,
}) {
  return GestureDetector(
    onTap: () => selectDialog(
        context: context, picker: picker, updateImageFile: updateImageFile),
    child: card(
      borderColor: constAgroColorLightGreen,
      childContent: Container(
        clipBehavior: Clip.none,
        constraints: const BoxConstraints(minHeight: 226, maxHeight: 250),
        child: imageFile != null
            ? Padding(
                padding: const EdgeInsets.all(10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.file(imageFile, fit: BoxFit.cover),
                ),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 92.5,
                ),
                child: SvgPicture.asset(
                  constCamera,
                  colorFilter: const ColorFilter.mode(
                    Color(constAgroColorGreen),
                    BlendMode.srcIn,
                  ),
                ),
              ),
      ),
      isShadow: true,
    ),
  );
}

Future selectDialog(
    {required ImagePicker picker,
    required Function(io.File) updateImageFile,
    required BuildContext context}) async {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (_) => AlertDialog(
      content: Builder(
        builder: (context) => SizedBox(
          width: 300.0,
          height: 240.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: Text(
                  'Selecciona un metodo para subir tu imagen',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const Divider(),
              Expanded(
                child: ListView(
                  children: <Widget>[
                    ListTile(
                      onTap: () => openCamera(context, picker, updateImageFile),
                      contentPadding: const EdgeInsets.only(left: 0),
                      leading: const Icon(
                        Icons.camera_alt_rounded,
                        color: Color(constAgroColorGreen),
                      ),
                      title: const Text(
                        'Camara',
                        style: TextStyle(
                          color: Color(constSecondaryColorText),
                        ),
                      ),
                    ),
                    ListTile(
                      onTap: () =>
                          openGallery(context, picker, updateImageFile),
                      contentPadding: const EdgeInsets.only(left: 0),
                      leading: const Icon(
                        Icons.photo,
                        color: Color(constAgroColorGreen),
                      ),
                      title: const Text(
                        'Galeria',
                        style: TextStyle(
                          color: Color(constSecondaryColorText),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(constAgroColorGreen),
                      ),
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        const EdgeInsets.symmetric(
                          horizontal: 30.0,
                        ),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14.0),
                          side: const BorderSide(
                            color: Color(constAgroColorGreen),
                            width: 2.0,
                          ),
                        ),
                      ),
                    ),
                    child: const Text(
                      'Cancelar',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ),
  );
}

Future<dynamic> openCamera(
  BuildContext context,
  ImagePicker picker,
  Function(io.File) updateImageFile,
) async {
  final plugin = DeviceInfoPlugin();
  final android = await plugin.androidInfo;
  PermissionStatus cameraStatus = android.version.sdkInt < 33
      ? await Permission.camera.request()
      : PermissionStatus.granted;

  if (context.mounted) {
    if (cameraStatus.isDenied || cameraStatus.isPermanentlyDenied) {
      validation(
        context,
        false,
        acceptText: 'Permitir',
        deniedText: 'Cerrar',
        openSettings: true,
      );
    }

    var picture = await picker.pickImage(source: ImageSource.camera);
    var file = io.File(picture!.path);

    if (kDebugMode) {
      print(file);
    }

    if (context.mounted) {
      updateImageFile(file);
      Navigator.of(context).pop();
    }
  }
}

Future<dynamic> openGallery(
  BuildContext context,
  ImagePicker picker,
  Function(io.File) updateImageFile,
) async {
  var picture = await picker.pickImage(source: ImageSource.gallery);
  var file = io.File(picture!.path);
  if (context.mounted) {
    updateImageFile(file);
    Navigator.of(context).pop();
  }
}
