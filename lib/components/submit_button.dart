import 'package:flutter/material.dart';

String report = '12';

Widget buttonSubmit(
  int background,
  String text,
  BuildContext context,
  callback,
) {
  return TextButton(
    style: TextButton.styleFrom(
      backgroundColor: Color(background),
      foregroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(40),
        ),
      ),
    ),
    onPressed: () {
      callback();
    },
    child: Text(
      text,
      style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
    ),
  );
}
