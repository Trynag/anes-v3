import 'package:anes/constants/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:permission_handler/permission_handler.dart';

import '../constants/strings.dart';

Future validation(BuildContext context, bool off,
    {String acceptText = 'Mantenerse',
    String deniedText = 'Cerrar',
    bool openSettings = false}) async {
  final result = await showDialog(
    barrierDismissible: false,
    context: context,
    builder: (_) => AlertDialog(
      content: Builder(
        builder: (context) => Container(
          constraints: const BoxConstraints(
            maxHeight: 280,
            maxWidth: 400,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                off ? constMessageBackTitle : constMessageCloseTitle,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 28.0,
                ),
              ),
              const Divider(),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      off ? constMessageBackContent : constMessageCloseContent,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 18.0,
                        color: Color(constSecondaryColorText),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(constAgroColorGreen),
                      ),
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        const EdgeInsets.symmetric(
                          horizontal: 30.0,
                          vertical: 10.0,
                        ),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: const BorderSide(
                            color: Color(constAgroColorGreen),
                            width: 2.0,
                          ),
                        ),
                      ),
                    ),
                    child: Text(
                      acceptText,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                    onPressed: () {
                      if (openSettings) {
                        openAppSettings();
                      } else {
                        Navigator.of(context).pop(false);
                      }
                    },
                  ),
                  const Gap(20.0),
                  TextButton(
                    child: Text(
                      deniedText,
                      style: const TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    onPressed: () {
                      if (openSettings) {
                        return Navigator.of(context).pop(false);
                      } else if (off) {
                        SystemNavigator.pop();
                      }
                      Navigator.of(context).pop(true);
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ),
  );

  if (context.mounted) {
    if (result && off) {
      Navigator.pushNamedAndRemoveUntil(
          context, activityPage, (routes) => false);
    } else if (result) {
      Navigator.pushNamedAndRemoveUntil(context, loginPage, (route) => false);
    }
  }
}
