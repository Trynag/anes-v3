import 'package:anes/components/card.dart';
import 'package:anes/screen/inspection_item.dart';
import 'package:flutter/material.dart';

import '../constants/strings.dart';

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
      title: 'Control de plagas',
      icon: constInsecureActionOrangeIcon,
    ),
  ),
  'Condiciones': OptionCategory(
    categoryName: 'Condiciones Inseguras',
    option: Option(
      title: 'Plan de sanamiento',
      icon: constInsecureConditionOrangeIcon,
    ),
  ),
  'Inspecciones': OptionCategory(
    categoryName: 'Inspecciones',
    option: Option(
      title: 'Equipos y utensillos',
      icon: constInspectionOrangeIcon,
    ),
  ),
  'Pausas activas': OptionCategory(
    categoryName: 'Pausas activas',
    option: Option(
      title: 'Instalaciones sanitarias',
      icon: constPauseOrangeIcon,
    ),
  ),
};

SizedBox inspectionsItems(BuildContext context) {
  return SizedBox(
    height: MediaQuery.of(context).size.height *
        0.6, // Ajusta la altura como desees
    child: GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 15,
      ),
      itemCount: options.length,
      itemBuilder: (context, int index) {
        final categoryKey = options.keys.toList()[index];
        final category = options[categoryKey]!;

        return GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const InspectionsItemsValue()),
          ),
          child: card(
            borderColor: constAgroColorLightGreen,
            childContent: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 62,
                  width: 72,
                  child: Image.asset(category.option.icon),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Text(
                    category.option.title,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ),
  );
}

// SizedBox inspectionsItems(BuildContext context) {
//   return SizedBox(
//     height: MediaQuery.of(context).size.height *
//         0.6, // Ajusta la altura como desees
//     child: GridView.builder(
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         crossAxisSpacing: 12.0,
//         mainAxisSpacing: 15,
//       ),
//       itemCount: 6,
//       itemBuilder: (context, int index) {
//         return card(
//           borderColor: constAgroColorLightGreen,
//           childContent: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               SizedBox(
//                 height: 61,
//                 width: 72,
//                 child: Image.asset(constPauseOrangeIcon),
//               ),
//               const Text('Control de plagas')
//             ],
//           ),
//         );
//       },
//     ),
//   );
// }
