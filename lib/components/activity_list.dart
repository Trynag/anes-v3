import 'package:anes/screen/inspecciones_value.dart';
import 'package:flutter/material.dart';

import '../constants/strings.dart';
import '../screen/activity_breaks.dart';
import '../screen/insecure.dart';
import 'card.dart';

class Option {
  final String title;
  final String icon;
  final Widget? route;

  Option({
    required this.title,
    required this.icon,
    this.route,
  });
}

class OptionCategory {
  final String categoryName;
  final Option option;

  OptionCategory({
    required this.categoryName,
    required this.option,
  });
}

Map<String, OptionCategory> options = {
  'Actos': OptionCategory(
    categoryName: 'Actos Inseguros',
    option: Option(
      title: 'Actos Inseguros',
      icon: constInsecureActionOrangeIcon,
      route: const Insecure(
        title: 'Actos Inseguros',
        icon: constInsecureActionWhiteIcon,
      ),
    ),
  ),
  'Condiciones': OptionCategory(
    categoryName: 'Condiciones Inseguras',
    option: Option(
      title: 'Condiciones Inseguras',
      icon: constInsecureConditionOrangeIcon,
      route: const Insecure(
        title: 'Condiciones Inseguras',
        icon: constInsecureConditionWhiteIcon,
      ),
    ),
  ),
  'Inspecciones': OptionCategory(
    categoryName: 'Inspecciones',
    option: Option(
      title: 'Inspecciones',
      icon: constInspectionOrangeIcon,
      route: const InspectionValue(
        title: 'Inspecciones',
        icon: constInspectionOrangeIcon,
      ),
    ),
  ),
  'Pausas activas': OptionCategory(
    categoryName: 'Pausas activas',
    option: Option(
      title: 'Pausas activas',
      icon: constPauseOrangeIcon,
      route: const ActivityBreaks(),
    ),
  ),
};
// Asegúrate de importar el archivo donde definiste las clases Option y OptionCategory

List<Padding> actionOptions(BuildContext context) {
  final List<Padding> list = [];
  for (var category in options.keys) {
    Option currentOption = options[category]!.option;
    list.add(
      Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: GestureDetector(
          onTap: () {
            if (currentOption.route != null) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => currentOption.route!),
              );
            }
          },
          child: card(
            borderColor: constAgroColorLightGreen,
            childContent: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 14.0,
                horizontal: 8.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        height: 61,
                        width: 72,
                        child: Image.asset(currentOption.icon),
                      ),
                      Text(
                        currentOption.title,
                        style: const TextStyle(
                          color: Color(0xFFFF5D00),
                          fontWeight: FontWeight.w700,
                          fontSize: 16.0,
                          fontFamily: constOpenSansSemiBold,
                        ),
                      ),
                    ],
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    color: Color(constAgroColorLightGreen),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  return list;
}

Widget activityList(BuildContext context) {
  return Column(
    children: actionOptions(context),
  );
}
