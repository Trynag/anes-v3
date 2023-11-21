import 'package:anes/screen/activity.dart';
import 'package:anes/screen/insecure.dart';
import 'package:anes/screen/inspecciones_value.dart';
import 'package:anes/screen/splash.dart';
import 'package:flutter/material.dart';

import '../screen/activity_breaks.dart';
import '../screen/login.dart';

const String splashPage = 'splashPage';
const String loginPage = 'login';
const String activityPage = 'activityPage';
const String inspectionPage = 'InspectionPage';
const String breakPage = 'breakPage';
const String unsafePage = 'unsafePage';
const String listPage = 'listPage';
const String itemsPage = 'itemsPage';
const String criteriasPage = 'criteriasPage';

Route activityRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const Activity(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

class AppRouter2 {
  static MaterialPageRoute generateRoute(Route settings) {
    // final routeMap = {loginPage: (context) => activityRoute()};

    return MaterialPageRoute(builder: (context) => const Login());
  }
}

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final routesMap = {
      splashPage: MaterialPageRoute(builder: (_) => const SplashANES()),
      loginPage: MaterialPageRoute(builder: (_) => const Login()),
      activityPage: MaterialPageRoute(builder: (_) => const Activity()),
      unsafePage: MaterialPageRoute(
        builder: (_) =>
            Insecure(title: settings.arguments, icon: settings.arguments),
      ),
      inspectionPage: MaterialPageRoute(
        builder: (_) => const InspectionValue(),
      ),
      breakPage: MaterialPageRoute(
        builder: (_) => const ActivityBreaks(),
      ),
      // listPage: (context) => ListPage(user: settings.arguments),
      //Pausas Activas
      // breakPage: (context) => const BreakPage(),

      // Carga de vista de reportes a evaluar
      // itemsPage: (context) => ItemsPage(reports: settings.arguments),
      // Cards a lo tinder
      // criteriasPage: (context) => CriteriasPage(
      //       reports: (settings.arguments as Map)['reportes'],
      //       article: (settings.arguments as Map)['articulo'],
      //       criterias: (settings.arguments as Map)['criterias'],
      //     ),
    };

    return routesMap[settings.name] ?? _buildPageRoute(const Login());
  }

  static MaterialPageRoute _buildPageRoute(Widget page) {
    return MaterialPageRoute(builder: (_) => page);
  }
}

// import 'package:flutter/material.dart';
//
// import '../screen/activity.dart';
// import '../screen/insecure.dart';
// import '../screen/login.dart';
// import '../screen/splash.dart';
//
// const String splashPage = '/splashPage';
// const String loginPage = '/login';
// const String activityPage = '/activityPage';
// const String unsafePage = '/unsafePage';
//
// class AppRouter {
//   static Route<dynamic> generateRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case splashPage:
//         return MaterialPageRoute(builder: (_) => const SplashANES());
//       case loginPage:
//         return MaterialPageRoute(builder: (_) => const Login());
//       case activityPage:
//         return MaterialPageRoute(
//             builder: (_) => Activity(user: settings.arguments));
//       case unsafePage:
//         return MaterialPageRoute(
//             builder: (_) => Insecure(tittle: settings.arguments));
//       default:
//         return MaterialPageRoute(builder: (_) => const Login());
//     }
//   }
// }
//
// import 'package:flutter/material.dart';
//
// import '../screen/activity.dart';
// import '../screen/insecure.dart';
// import '../screen/login.dart';
// import '../screen/splash.dart';
//
// const String splashPage = 'splashPage';
// const String loginPage = 'login';
// const String activityPage = 'activityPage';
// const String unsafePage = 'unsafePage';
// const String listPage = 'listPage';
// const String itemsPage = 'itemsPage';
// const String criteriasPage = 'criteriasPage';
//
// class AppRouter {
//   static Route<dynamic> generateRoute(RouteSettings settings) {
//     final routesMap = {
//       splashPage: _buildPageRoute(const SplashANES()),
//       loginPage: _buildPageRoute(const Login()),
//       activityPage: _buildPageRoute(Activity(user: settings.arguments)),
//       unsafePage: _buildPageRoute(Insecure(tittle: settings.arguments)),
//       // listPage: _buildPageRoute(ListPage(user: settings.arguments as UserType)),
//       //Pausas Activas
//       // breakPage: (context) => const BreakPage(),
//       // Carga de vista de reportes a evaluar
//       // itemsPage: _buildPageRoute(ItemsPage(reports: settings.arguments as ReportType)),
//       // Cards a lo tinder
//       // criteriasPage: _buildPageRoute(CriteriasPage(
//       //       reports: (settings.arguments as Map)['reportes'],
//       //       article: (settings.arguments as Map)['articulo'],
//       //       criterias: (settings.arguments as Map)['criterias'],
//       //     )),
//     };
//
//     return routesMap[settings.name] ?? _buildPageRoute(const Login());
//   }
//
//   static MaterialPageRoute _buildPageRoute(Widget page) {
//     return MaterialPageRoute(builder: (_) => page);
//   }
// }
//
// // Agrega definiciones de tipos según sea necesario
// class UserType {
//   final String? name;
//   final Image icon;
//
//   UserType(this.icon, {required this.name});
// }
//
// class ReportType {}
