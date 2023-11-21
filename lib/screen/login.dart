import 'package:anes/components/dialog_back.dart';
import 'package:anes/widgets/form_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/strings.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);

    // Future.delayed(const Duration(milliseconds: 500), () {});
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        validation(context, true);
        return Future.value(false);
      },
      child: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage(constAgroBackground),
            fit: BoxFit.fill,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Center(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 550.0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 46.0,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.4,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 12.0,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                constAgroLogo,
                                fit: BoxFit.fill,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Divider(
                        height: MediaQuery.of(context).size.height * 0.1,
                        color: Colors.transparent,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(bottom: 36.0),
                              child: LoginForm(),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  constUrbanLogo,
                                  height: 54,
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 5.0),
                                  child: Text(
                                    "Copyright 2024 - Sennova",
                                    style: TextStyle(
                                        color: Color(constSecondaryColorText)),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
