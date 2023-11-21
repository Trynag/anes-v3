import 'package:anes/components/card.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components/app_bar.dart';
import '../components/dialog_back.dart';
import '../constants/strings.dart';

class Option {
  final String title;
  final String icon;
  final Uri route;

  Option({required this.title, required this.icon, required this.route});
}

Map<String, Option> options = {
  'Pausa Activa 1': Option(
    title: 'Pausa Activa 1',
    icon: constPauseEyeIcon,
    route: constPauseRouteEye,
  ),
  'Pausa Activa 2': Option(
    title: 'Pausa Activa 2',
    icon: constPauseNeckIcon,
    route: constPauseRouteNeck,
  ),
  'Pausa Activa 3': Option(
    title: 'Pausa Activa 3',
    icon: constPauseHandIcon,
    route: constPauseRouteHand,
  ),
  'Pausa Activa 4': Option(
    title: 'Pausa Activa 4',
    icon: constPauseShoulderIcon,
    route: constPauseRouteShoulder,
  ),
};

class ActivityBreaks extends StatefulWidget {
  const ActivityBreaks({super.key});

  @override
  ActivityBreaksState createState() => ActivityBreaksState();
}

class ActivityBreaksState extends State<ActivityBreaks> {
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
                    Image.asset(constPauseWhiteIcon),
                    const Gap(12),
                    const Text(
                      'Pausas Activas',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
                const Gap(12),
                GestureDetector(
                  onTap: () => launchUrl(constPauseRouteIntro),
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 550.0),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 46.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          card(
                            borderColor: constAgroColorLightGreen,
                            childContent: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    height: 62,
                                    width: 72,
                                    child: Image.asset(constPauseIntroIcon),
                                  ),
                                  const Text(
                                    'Intro',
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 46.0,
                  ),
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 458.0),
                    height: MediaQuery.of(context).size.height * 0.6,
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12.0,
                        mainAxisSpacing: 15,
                      ),
                      itemCount: options.length,
                      itemBuilder: (context, int index) {
                        final categoryKey = options.keys.toList()[index];
                        final category = options[categoryKey]!;

                        return GestureDetector(
                          onTap: () => category.route,
                          child: card(
                            borderColor: constAgroColorLightGreen,
                            childContent: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  height: 62,
                                  child: Image.asset(category.icon),
                                ),
                                Text(
                                  category.title,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
