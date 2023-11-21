import 'package:anes/constants/routes.dart';
import 'package:anes/constants/strings.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'ANES',
      debugShowCheckedModeBanner: false, // used by the OS task switcher
      initialRoute: splashPage,
      onGenerateRoute: AppRouter.generateRoute,
      theme: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.white.withOpacity(0.0),
        useMaterial3: true,
        fontFamily: 'OpenSansRegular',
        colorSchemeSeed: const Color(constAgroColorLightGreen),
        checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateProperty.resolveWith(
            (states) {
              if (!states.contains(MaterialState.selected)) {
                return Colors.white;
              }
              return const Color(constAgroColorLightGreen);
            },
          ),
          checkColor: MaterialStateColor.resolveWith(
            (states) {
              return const Color(constAgroColorLightGreen);
            },
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100.0),
          ),
        ),
      ),
    ),
  );
}
