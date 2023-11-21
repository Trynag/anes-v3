import 'package:anes/components/input.dart';
import 'package:anes/components/remember_credential.dart';
import 'package:anes/components/submit_button.dart';
import 'package:anes/constants/routes.dart';
import 'package:anes/constants/strings.dart';
import 'package:anes/data/http_service.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../components/dialog_back.dart';
import '../components/snack_message.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  LoginFormState createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final HttpService httpService = HttpService();
  TextEditingController passwordController = TextEditingController();
  TextEditingController userController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadDataPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              bottom: 16.0,
            ),
            child: inputForm(
              borderColor: constAgroColorLightGreen,
              svgIconPrefix: constUrbanIconUser,
              hintText: constFormUserHintText,
              controller: userController,
            ),
          ),
          inputForm(
            borderColor: constAgroColorLightGreen,
            svgIconPrefix: constUrbanIconPassword,
            hintText: constFormPasswordHintText,
            controller: passwordController,
            isObscure: true,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: RememberPassword(
              userController: userController,
              passwordController: passwordController,
              // tokenUser: tokenUser,
              // idUser: idUser,
            ),
          ),
          Padding(
            padding: EdgeInsets.zero,
            child: buttonSubmit(
              constAgroColorGreen,
              'Ingresar',
              context,
              () => _validateLogin(context, _formKey),
            ),
          ),
        ],
      ),
    );
  }

  Future _validateLogin(context, GlobalKey<FormState> form) async {
    final plugin = DeviceInfoPlugin();
    final android = await plugin.androidInfo;
    PermissionStatus storageStatus = android.version.sdkInt < 33
        ? await Permission.storage.request()
        : PermissionStatus.granted;

    if (userController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        form.currentState!.validate()) {
      if (storageStatus.isPermanentlyDenied || storageStatus.isDenied) {
        return validation(
          context,
          false,
          acceptText: 'Permitir',
          deniedText: 'Cerrar',
          openSettings: true,
        );
      }

      login(
        user: userController.text.trim(),
        password: passwordController.text.trim(),
      );
    } else {
      return ScaffoldMessenger.of(context).showSnackBar(
        snackMessage(
          title: constSnackMessageDialogs['warningForm']!['title'],
          description: constSnackMessageDialogs['warningForm']!['description'],
          primaryColor:
              constSnackMessageDialogs['warningForm']!['primary_color'],
          secondaryColor:
              constSnackMessageDialogs['warningForm']!['secondary_color'],
          image: constSnackMessageDialogs['warningForm']!['icon'],
        ),
      );
    }
  }

  void login({
    required String user,
    required String password,
  }) async {
    try {
      final value = await httpService.login(user: user, password: password);

      if (value.token.isNotEmpty && value.rolName.isNotEmpty) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('token', value.token);
        prefs.setInt('userId', value.id);

        if (context.mounted) Navigator.of(context).push(activityRoute());
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          snackMessage(
            title: constSnackMessageDialogs['errorLogin']!['title'],
            description: constSnackMessageDialogs['errorLogin']!['description'],
            primaryColor:
                constSnackMessageDialogs['errorLogin']!['primary_color'],
            secondaryColor:
                constSnackMessageDialogs['errorLogin']!['secondary_color'],
            image: constSnackMessageDialogs['errorLogin']!['icon'],
          ),
        );
      }
    }
  }

  loadDataPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? user = prefs.getString('user');
    String? pass = prefs.getString('pass');
    bool? remember = prefs.getBool('check');

    if (remember!) {
      userController.text = user!;
      passwordController.text = pass!;
    }
  }
}
