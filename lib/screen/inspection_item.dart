import 'package:anes/components/card.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../components/app_bar.dart';
import '../components/dialog_back.dart';
import '../constants/strings.dart';

class InspectionsItemsValue extends StatefulWidget {
  const InspectionsItemsValue({
    super.key,
  });

  @override
  InspectionsItemsValueState createState() => InspectionsItemsValueState();
}

class InspectionsItemsValueState extends State<InspectionsItemsValue> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        validation(context, false);

        return Future.value(false);
      },
      child: Container(
        constraints: const BoxConstraints(maxWidth: 550.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage(constAgroBackground),
            fit: BoxFit.fill,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: const CustomAppBar(
            isOut: false,
          ),
          body: Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 550.0),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 46.0),
                child: ListView(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(constInspectionWhiteIcon),
                            const Gap(12),
                            const Text(
                              'Inspecciones',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 16.0,
                              ),
                            ),
                          ],
                        ),
                        const Gap(20),
                        const Text(
                          'Control de plagas',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            letterSpacing: 0.7,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const Gap(50),
                        Container(
                          child: card(
                            backgroundColor:
                                const Color(constSnackAlertSecondaryColor),
                            borderColor: constSnackErrorPrimaryColor,
                            childContent: const Padding(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Text(
                                    'Se tienen las conducciones de cables cerradas y limpias, estantes separados de la pared, eliminación de esquinas oscuras y retiro de equipos que no se usen.',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const Gap(30),
                        Container(
                          child: card(
                            backgroundColor: const Color(constAgroColorGreen),
                            borderColor: constAgroColorLightGreen,
                            childContent: const Padding(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Text(
                                    'Se tienen las conducciones de cables cerradas y limpias, estantes separados de la pared, eliminación de esquinas oscuras y retiro de equipos que no se usen.',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const Gap(30),
                        SizedBox(
                          child: card(
                            borderColor: constAgroColorLightGreen,
                            childContent: const Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Positioned(
                                  left: 60,
                                  bottom: -20, // La mitad fuera del contenedor
                                  height: 40,
                                  width: 40,
                                  child: CircleAvatar(
                                    radius: 16,
                                    backgroundColor: Colors.red,
                                    foregroundColor: Colors.white,
                                    child: Icon(
                                      Icons.close_rounded,
                                      size: 35,
                                      weight: 50,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 60,
                                  bottom: -20, // La mitad fuera del contenedor
                                  height: 40,
                                  width: 40,
                                  child: CircleAvatar(
                                    radius: 16,
                                    backgroundColor: Colors.green,
                                    foregroundColor: Colors.white,
                                    child: Icon(
                                      Icons.done_rounded,
                                      size: 35,
                                      weight: 700.0,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 19,
                                    right: 19,
                                    top: 30,
                                    bottom: 45,
                                  ),
                                  child: Text(
                                    'Se tienen las conducciones de cables cerradas y limpias, estantes separados de la pared, eliminación de esquinas oscuras y retiro de equipos que no se usen.',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(constSecondaryColorText),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Gap(50),
                        SizedBox(
                          child: card(
                            borderColor: constAgroColorLightGreen,
                            childContent: const Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Positioned(
                                  left: 60,
                                  bottom: -20, // La mitad fuera del contenedor
                                  height: 40,
                                  width: 40,
                                  child: CircleAvatar(
                                    radius: 16,
                                    backgroundColor: Colors.red,
                                    foregroundColor: Colors.white,
                                    child: Icon(
                                      Icons.close_rounded,
                                      size: 35,
                                      weight: 50,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 60,
                                  bottom: -20, // La mitad fuera del contenedor
                                  height: 40,
                                  width: 40,
                                  child: CircleAvatar(
                                    radius: 16,
                                    backgroundColor: Colors.green,
                                    foregroundColor: Colors.white,
                                    child: Icon(
                                      Icons.done_rounded,
                                      size: 35,
                                      weight: 700.0,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 19,
                                    right: 19,
                                    top: 30,
                                    bottom: 45,
                                  ),
                                  child: Text(
                                    'Se tienen las conducciones de cables cerradas y limpias, estantes separados de la pared, eliminación de esquinas oscuras y retiro de equipos que no se usen.',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(constSecondaryColorText),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Gap(50),
                        Container(
                          child: card(
                            backgroundColor:
                                const Color(constSnackAlertSecondaryColor),
                            borderColor: constSnackErrorPrimaryColor,
                            childContent: const Padding(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Text(
                                    'Se tienen las conducciones de cables cerradas y limpias, estantes separados de la pared, eliminación de esquinas oscuras y retiro de equipos que no se usen.',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const Gap(50),
                        SizedBox(
                          child: card(
                            borderColor: constAgroColorLightGreen,
                            childContent: const Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Positioned(
                                  left: 60,
                                  bottom: -20, // La mitad fuera del contenedor
                                  height: 40,
                                  width: 40,
                                  child: CircleAvatar(
                                    radius: 16,
                                    backgroundColor: Colors.red,
                                    foregroundColor: Colors.white,
                                    child: Icon(
                                      Icons.close_rounded,
                                      size: 35,
                                      weight: 50,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 60,
                                  bottom: -20, // La mitad fuera del contenedor
                                  height: 40,
                                  width: 40,
                                  child: CircleAvatar(
                                    radius: 16,
                                    backgroundColor: Colors.green,
                                    foregroundColor: Colors.white,
                                    child: Icon(
                                      Icons.done_rounded,
                                      size: 35,
                                      weight: 700.0,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 19,
                                    right: 19,
                                    top: 30,
                                    bottom: 45,
                                  ),
                                  child: Text(
                                    'Se tienen las conducciones de cables cerradas y limpias, estantes separados de la pared, eliminación de esquinas oscuras y retiro de equipos que no se usen.',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(constSecondaryColorText),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Gap(50),
                        SizedBox(
                          child: card(
                            borderColor: constAgroColorLightGreen,
                            childContent: const Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Positioned(
                                  left: 60,
                                  bottom: -20, // La mitad fuera del contenedor
                                  height: 40,
                                  width: 40,
                                  child: CircleAvatar(
                                    radius: 16,
                                    backgroundColor: Colors.red,
                                    foregroundColor: Colors.white,
                                    child: Icon(
                                      Icons.close_rounded,
                                      size: 35,
                                      weight: 50,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 60,
                                  bottom: -20, // La mitad fuera del contenedor
                                  height: 40,
                                  width: 40,
                                  child: CircleAvatar(
                                    radius: 16,
                                    backgroundColor: Colors.green,
                                    foregroundColor: Colors.white,
                                    child: Icon(
                                      Icons.done_rounded,
                                      size: 35,
                                      weight: 700.0,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 19,
                                    right: 19,
                                    top: 30,
                                    bottom: 45,
                                  ),
                                  child: Text(
                                    'Se tienen las conducciones de cables cerradas y limpias, estantes separados de la pared, eliminación de esquinas oscuras y retiro de equipos que no se usen.',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(constSecondaryColorText),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Gap(50),
                        Container(
                          child: card(
                            backgroundColor: const Color(constAgroColorGreen),
                            borderColor: constAgroColorLightGreen,
                            childContent: const Padding(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Text(
                                    'Se tienen las conducciones de cables cerradas y limpias, estantes separados de la pared, eliminación de esquinas oscuras y retiro de equipos que no se usen.',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const Gap(30),
                        SizedBox(
                          child: card(
                            borderColor: constAgroColorLightGreen,
                            childContent: const Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Positioned(
                                  left: 60,
                                  bottom: -20, // La mitad fuera del contenedor
                                  height: 40,
                                  width: 40,
                                  child: CircleAvatar(
                                    radius: 16,
                                    backgroundColor: Colors.red,
                                    foregroundColor: Colors.white,
                                    child: Icon(
                                      Icons.close_rounded,
                                      size: 35,
                                      weight: 50,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 60,
                                  bottom: -20, // La mitad fuera del contenedor
                                  height: 40,
                                  width: 40,
                                  child: CircleAvatar(
                                    radius: 16,
                                    backgroundColor: Colors.green,
                                    foregroundColor: Colors.white,
                                    child: Icon(
                                      Icons.done_rounded,
                                      size: 35,
                                      weight: 700.0,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 19,
                                    right: 19,
                                    top: 30,
                                    bottom: 45,
                                  ),
                                  child: Text(
                                    'Se tienen las conducciones de cables cerradas y limpias, estantes separados de la pared, eliminación de esquinas oscuras y retiro de equipos que no se usen.',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(constSecondaryColorText),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Gap(50),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
