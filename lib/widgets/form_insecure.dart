import 'dart:io' as io;

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../components/dangers_drop_down.dart';
import '../components/dialog_back.dart';
import '../components/image_loader.dart';
import '../components/input.dart';
import '../components/snack_message.dart';
import '../components/submit_button.dart';
import '../constants/strings.dart';
import '../data/http_service.dart';
import '../models/action_model.dart';
import '../models/dangers_model.dart';
import '../models/risk_model.dart';
import '../models/work_model.dart';

class InsecureForm extends StatefulWidget {
  const InsecureForm({super.key});

  @override
  InsecureFormState createState() => InsecureFormState();
}

class InsecureFormState extends State<InsecureForm> {
  final _formKey = GlobalKey<FormState>();
  final HttpService httpService = HttpService();
  TextEditingController placeController = TextEditingController();
  TextEditingController dangerController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  final ImagePicker picker = ImagePicker();
  io.File? imageFile;

  // ignore: prefer_typing_uninitialized_variables
  var dangerSelected;
  List<DangerClass> dangerTypeOptions = [];

  Future<void> getData() async {
    try {
      List<DangerClass> dangerClasses = await httpService.getDangerClasses();
      if (dangerClasses.isNotEmpty) {
        setState(() {
          dangerTypeOptions = dangerClasses;
        });
      }
    } catch (error) {
      if (kDebugMode) {
        print('Error obteniendo datos del servidor: $error');
      }
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          cameraLoader(
            context: context,
            picker: picker,
            updateImageFile: (file) {
              setState(() {
                imageFile = file;
              });
            },
            imageFile: imageFile,
          ),
          const Gap(20),
          inputForm(
            borderColor: constAgroColorLightGreen,
            svgIconPrefix: constUrbanIconUser,
            hintText: 'Lugar especifico',
            controller: placeController,
          ),
          const Gap(14),
          Row(
            children: [
              Expanded(
                child: DropDownDangers(
                  dangerController: dangerController,
                  dangerOptions: dangerTypeOptions,
                  dangerSelected: dangerSelected,
                  onDangerSelectedChanged: (opt) => setState(
                    () {
                      dangerSelected = opt;
                      dangerController.text =
                          opt?.name ?? ''; // Actualiza el texto del controller
                    },
                  ),
                ),
              ),
              TextButton(
                onPressed: () => dangerAlert(context),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color(constAgroColorGreen),
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(6),
                    child: Icon(
                      Icons.question_mark_sharp,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Gap(14),
          inputForm(
            borderColor: constAgroColorLightGreen,
            hintText: 'Descripción del resporte ...',
            controller: descriptionController,
            maxLine: 5,
            borderRadius: 30.0,
            iconSpace: false,
            contentPadding: 15,
          ),
          const Gap(14),
          buttonSubmit(
            constAgroColorGreen,
            'Registrar',
            context,
            () => _validateForm(context, _formKey),
          ),
        ],
      ),
    );
  }

  Future _validateForm(context, GlobalKey<FormState> form) async {
    final plugin = DeviceInfoPlugin();
    final android = await plugin.androidInfo;
    PermissionStatus photoStatus = android.version.sdkInt < 33
        ? await Permission.camera.request()
        : PermissionStatus.granted;

    if (imageFile == null) {
      return ScaffoldMessenger.of(context).showSnackBar(
        snackMessage(
          title: constSnackMessageDialogs['errorPhoto']!['title'],
          description: constSnackMessageDialogs['errorPhoto']!['description'],
          primaryColor:
              constSnackMessageDialogs['errorPhoto']!['primary_color'],
          secondaryColor:
              constSnackMessageDialogs['errorPhoto']!['secondary_color'],
          image: constSnackMessageDialogs['errorPhoto']!['icon'],
        ),
      );
    }

    if (placeController.text.isNotEmpty &&
        dangerController.text.isNotEmpty &&
        descriptionController.text.isNotEmpty &&
        form.currentState!.validate()) {
      if (photoStatus.isPermanentlyDenied || photoStatus.isDenied) {
        return validation(
          context,
          false,
          acceptText: 'Permitir',
          deniedText: 'Cerrar',
          openSettings: true,
        );
      } else {
        if (kDebugMode) {
          print(placeController.text);
          print(dangerController.text);
          print(descriptionController.text);
          print(dangerSelected.id);
          print(dangerSelected.name);
        }
        sendData();
      }
    } else {
      return ScaffoldMessenger.of(context).showSnackBar(
        snackMessage(
          title: constSnackMessageDialogs['warningForm']!['title'],
          description: constSnackMessageDialogs['warningForm']!['description'],
          primaryColor:
              constSnackMessageDialogs['warningForm']!['primary_color'],
          secondaryColor:
              constSnackMessageDialogs['warningForm']!['secondary_color'],
          image: constSnackMessageDialogs['warningForm']!['icon'],
        ),
      );
    }
  }

  void sendData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var workData = WorkModel(
        process: '',
        place: placeController.text,
        routines: true,
        activities: 'activities',
        sources: 'sources',
        description: descriptionController.text,
        individual: 'individual',
        poss_effect: 'poss_effect',
        user: prefs.getInt('userId'),
        danger_class: [dangerSelected.id]);

    httpService.createWork(data: workData.toMap()).then(
      (work) {
        var actionData = ActionModel(
          removes: 'N/a',
          substitutions: 'N/a',
          engineering_ctrls: 'N/a',
          administrative_ctrls: 'N/a',
          epp: 'N/a',
          no_exposed: 1,
          wors_result: 'N/a',
          state: 1,
        );
        httpService.createAction(data: actionData.toMap()).then((action) {
          var riskData = RiskEvaluation(
            deficiency_lvl: 0,
            exposure_lvl: 0,
            probability_lvl: 0,
            interpretation_probability_lvl: 'N/a',
            consequence_lvl: 0,
            risk_lvl: 0,
            interpretation_risk_lvl: 'N/a',
            risk_accept: 'NO CALIFICADO',
            action: action.id,
            work: work.id,
            state: 1,
          );
          httpService.createRisk(data: riskData.toMap(), img: imageFile);
        });

        if (work.toString().isNotEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            snackMessage(
              title: constSnackMessageDialogs['successReport']!['title'],
              description:
                  constSnackMessageDialogs['successReport']!['description'],
              primaryColor:
                  constSnackMessageDialogs['successReport']!['primary_color'],
              secondaryColor:
                  constSnackMessageDialogs['successReport']!['secondary_color'],
              image: constSnackMessageDialogs['successReport']!['icon'],
            ),
          );

          Future.delayed(const Duration(milliseconds: 500), () {
            Navigator.of(context).pop(true);
          });
        }
      },
    );
  }

  Future dangerAlert(context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Tipos de Peligro'),
          ],
        ),
        content: const SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Biológico',
                style:
                    TextStyle(fontSize: 20, color: Color(constAgroColorGreen)),
              ),
              Gap(5),
              Text(
                  'Posible exposición a microorganismos que puedan dar lugar a enfermedades, motivada por la actividad laboral.'),
              SizedBox(
                height: 10,
              ),
              Gap(15),
              Text(
                'Físico',
                style:
                    TextStyle(fontSize: 20, color: Color(constAgroColorGreen)),
              ),
              Gap(5),
              Text(
                  'Los riesgos físicos incluyen radiación, temperaturas (calor y frío), riesgos de vibración y riesgos de ruido.'),
              Gap(15),
              SizedBox(
                height: 10,
              ),
              Gap(5),
              Text(
                'Psicosocial',
                style:
                    TextStyle(fontSize: 20, color: Color(constAgroColorGreen)),
              ),
              Gap(5),
              Text(
                  'Condiciones presentes en una situación laboral directamente relacionadas con la organización del trabajo, el contenido del trabajo y la realización de la tarea, y que se presentan con capacidad para afectar el desarrollo del trabajo y la salud del trabajador'),
              Gap(15),
              SizedBox(
                height: 10,
              ),
              Gap(5),
              Text(
                'Biomecanico o Ergonómico',
                style:
                    TextStyle(fontSize: 20, color: Color(constAgroColorGreen)),
              ),
              Gap(15),
              Text(
                  'Son los de riesgo que involucran objetos, puestos de trabajo, maquinas y equipos. Estos son: sobreesfuerzo físico, manejo de cargas, posturas, entorno del trabajo, diseño de sillas, comandos, superficies y relaciones de trabajo.'),
              Gap(5),
              SizedBox(
                height: 10,
              ),
              Gap(15),
              Text(
                'Condiciones de seguridad',
                style:
                    TextStyle(fontSize: 20, color: Color(constAgroColorGreen)),
              ),
              Gap(5),
              Text(
                  'Se define como aquellas condiciones o elementos en el trabajo que pueden dar lugar a accidentes o incidente de trabajo, tales como los equipos, la materia prima, las herramientas, las máquinas, las instalaciones o el medio ambiente.'),
              Gap(15),
              SizedBox(
                height: 10,
              ),
              Gap(5),
              Text(
                'Fenomenos naturales',
                style:
                    TextStyle(fontSize: 20, color: Color(constAgroColorGreen)),
              ),
              Gap(15),
              Text(
                  'Son aquellos que tienen sus origen en fenómenos naturales (factores geográficos y meteorológicos), siendo los accidentes que provocan múltiples y variados. Dado su origen, la presencia de esta clase de riesgos está condicionada cuantitativamente por las características particulares de cada región.'),
              Gap(5),
              SizedBox(
                height: 10,
              ),
              Gap(15),
              Text(
                'Quimico',
                style:
                    TextStyle(fontSize: 20, color: Color(constAgroColorGreen)),
              ),
              Gap(5),
              Text(
                  'Combinación de la probabilidad de que ocurra un(os) evento(s) o exposición(es) peligroso(s), y la severidad de lesión o enfermedad, que puede ser causado por el (los) evento(s) o la(s) exposición(es)'),
              Gap(15),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith(
                    (states) => const Color(constAgroColorGreen))),
            child: const Text(
              'ok',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
