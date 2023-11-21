import 'package:anes/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class RememberPassword extends StatefulWidget {
  TextEditingController userController;
  late final TextEditingController passwordController;

  RememberPassword({
    super.key,
    required this.userController,
    required this.passwordController,
  });

  set setUserController(TextEditingController controller) {
    userController = controller;
  }

  @override
  State<StatefulWidget> createState() => StateRememberPassword();
}

class StateRememberPassword extends State<RememberPassword> {
  bool _value = false;

  TextEditingController get getUserController => widget.userController;
  TextEditingController get getPasswordController => widget.passwordController;

  @override
  void initState() {
    super.initState();
  }

  void setUserControllerText(String newText) {
    setState(() {
      widget.setUserController = TextEditingController(text: newText);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: ListTileTheme(
            horizontalTitleGap: -6.0,
            contentPadding: const EdgeInsets.all(0),
            child: CheckboxListTile(
              side: const BorderSide(
                color: Color(constAgroColorLightGreen),
                width: 2.0,
              ),
              activeColor: const Color(constAgroColorLightGreen),
              checkColor: const Color(constAgroColorLightGreen),
              controlAffinity: ListTileControlAffinity.leading,
              title: const Text(
                "Recuerdame",
                style: TextStyle(
                  color: Color(0xD3707070),
                ),
              ),
              value: _value,
              onChanged: (check) {
                setState(() {
                  _value = check!;
                });

                if (check!) {
                  setUserPrefs(
                    userTextController: getUserController.text,
                    passwordTextController: getPasswordController.text,
                  );
                } else {
                  clearUserPrefs();
                }
              },
            ),
          ),
        ),
        const Text(
          'Olvidé mi contraseña',
          style: TextStyle(
            fontSize: 15.0,
            color: Color(constAgroColorLightGreen),
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }

  void setUserPrefs({
    required String userTextController,
    required String passwordTextController,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('user', userTextController);
    prefs.setString('pass', passwordTextController);
    prefs.setBool('check', true);
  }

  void clearUserPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    const String userKey = 'user';
    const String passKey = 'pass';

    prefs.remove(userKey);
    prefs.remove(passKey);
    prefs.setBool('check', false);
  }

  void loadDataPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      var user = prefs.getString('user');
      var pass = prefs.getString('pass');
      widget.userController = TextEditingController(text: user);
      widget.passwordController = TextEditingController(text: pass);
      if (user != '') {
        _value = true;
      } else {
        _value = false;
      }
    });
  }
}
