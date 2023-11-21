import 'package:flutter/material.dart';

Widget card({
  required int borderColor,
  bool isShadow = true,
  required Widget childContent,
  backgroundColor = Colors.white,
}) {
  return Container(
    decoration: BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(17.0),
      border: Border.all(color: Color(borderColor), width: 2.0),
      boxShadow: isShadow
          ? const [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(
                  4.0,
                  4.0,
                ),
                blurRadius: 10.0,
              ),
              BoxShadow(
                color: Colors.black12,
                offset: Offset(
                  -4.0,
                  -4.0,
                ),
                blurRadius: 10.0,
              )
            ]
          : null,
    ),
    child: childContent,
  );
}
