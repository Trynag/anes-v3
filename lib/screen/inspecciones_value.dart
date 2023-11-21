import 'package:anes/components/inspection_list.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../components/app_bar.dart';
import '../components/dialog_back.dart';
import '../constants/strings.dart';

class InspectionValue extends StatefulWidget {
  final dynamic user;
  final dynamic title;
  final dynamic icon;

  const InspectionValue({
    this.user,
    super.key,
    this.title,
    this.icon,
  });

  @override
  InspectionValueState createState() => InspectionValueState();
}

class InspectionValueState extends State<InspectionValue> {
  String get getIcon => widget.icon;
  String get getTitle => widget.title;

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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(constInspectionWhiteIcon),
                    const Gap(12),
                    Text(
                      getTitle,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
                Container(
                  constraints: const BoxConstraints(maxWidth: 550.0),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 46.0),
                    child: inspectionsItems(context),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
