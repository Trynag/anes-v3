import 'package:flutter/material.dart';

Future<void> messageDialog(
    BuildContext context, List<TextEditingController> text) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return SimpleDialog(
        title: Text(text[0].text),
        children: const [
          SimpleDialogOption(
            child: Text("La contraseña no es correcta. \n Compruébala."),
          )
        ],
      );
    },
  );
}
