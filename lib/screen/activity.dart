import 'package:anes/components/activity_list.dart';
import 'package:anes/components/app_bar.dart';
import 'package:anes/constants/strings.dart';
import 'package:flutter/material.dart';

import '../components/dialog_back.dart';

class Activity extends StatefulWidget {
  final dynamic user;
  const Activity({
    this.user,
    super.key,
  });

  @override
  ActivityState createState() => ActivityState();
}

class ActivityState extends State<Activity> {
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
            isOut: true,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  "Selecciona el proceso a realizar",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 16.0,
                  ),
                ),
                Container(
                  constraints: const BoxConstraints(maxWidth: 550.0),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 46.0),
                    child: activityList(context),
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

// return SingleChildScrollView(
//   child: Container(
//     constraints: const BoxConstraints.expand(),
//     decoration: BoxDecoration(
//       image: DecorationImage(
//         image: AssetImage(urbanBackground),
//         fit: BoxFit.fill,
//       ),
//     ),
//     child: Container(
//       constraints: const BoxConstraints(maxWidth: 550.0),
//       child: const Padding(
//         padding: EdgeInsets.symmetric(
//           horizontal: 46.0,
//         ),
//         child: Scaffold(
//           backgroundColor: Colors.transparent,
//           appBar: CustomAppBar(),
//           body: LoginForm(),
//         ),
//       ),
//     ),
//   ),
// );

Widget aa() {
  return Center(
    child: Container(
      constraints: const BoxConstraints(maxWidth: 550.0),
      alignment: Alignment.center,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 46.0,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 53.0,
                    left: 15.0,
                  ),
                  child: Image.asset(
                    constUrbanLogo,
                    height: 280.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
