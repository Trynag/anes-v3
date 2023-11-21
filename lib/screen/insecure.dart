import 'package:anes/components/app_bar.dart';
import 'package:anes/components/dialog_back.dart';
import 'package:anes/widgets/form_insecure.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../constants/strings.dart';
import '../data/http_service.dart';

class Insecure extends StatefulWidget {
  final dynamic title;
  final dynamic icon;
  const Insecure({
    super.key,
    this.title,
    this.icon,
  });

  @override
  InsecureState createState() => InsecureState();
}

class InsecureState extends State<Insecure> {
  String get tittle => widget.title;
  String get icon => widget.icon;

  final HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        validation(context, true);
        return Future.value(true);
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
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Gap(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(icon),
                      const Gap(12),
                      Text(
                        tittle,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                  const Gap(50),
                  Container(
                    constraints: const BoxConstraints(maxWidth: 550.0),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 46.0),
                      child: InsecureForm(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // bottomNavigationBar: Container(
          //   decoration: BoxDecoration(
          //     boxShadow: [
          //       BoxShadow(
          //         color: Colors.black.withOpacity(0.3),
          //         spreadRadius: 2,
          //         blurRadius: 10,
          //         offset: Offset(
          //             0, -2), // Ajusta la posición de la sombra en el eje Y
          //       ),
          //     ],
          //   ),
          //   child: BottomNavigationBar(
          //     showSelectedLabels: false,
          //     showUnselectedLabels: false,
          //     items: [
          //       BottomNavigationBarItem(
          //         icon: Image.asset(
          //           constInsecureActionOrangeIcon,
          //           height: 50,
          //         ),
          //         label: '',
          //       ),
          //       BottomNavigationBarItem(
          //         icon: Image.asset(
          //           constInsecureConditionOrangeIcon,
          //           height: 50,
          //         ),
          //         label: '',
          //       ),
          //       const BottomNavigationBarItem(
          //         backgroundColor: Colors.black12,
          //         icon: Icon(
          //           Icons.home_filled,
          //           color: Colors.deepOrangeAccent,
          //           size: 50,
          //         ),
          //         label: '',
          //       ),
          //       BottomNavigationBarItem(
          //         icon: Image.asset(
          //           constInspectionOrangeIcon,
          //           height: 50,
          //         ),
          //         label: '',
          //       ),
          //       BottomNavigationBarItem(
          //         icon: Image.asset(
          //           constPauseOrangeIcon,
          //           height: 50,
          //         ),
          //         label: '',
          //       ),
          //     ],
          //   ),
          // ),
        ),
      ),
    );
  }
}

// CustomSnackBar.show(
// context: context,
// title: 'probe',
// description: 'probe',
// primaryColor: constSnackAlertPrimaryColor,
// secondaryColor: constSnackAlertSecondaryColor,
// image: constSnackAlertIcon,
// );
