import 'package:anes/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget inputForm({
  required int borderColor,
  required String hintText,
  required TextEditingController controller,
  bool isObscure = false,
  int? maxLine,
  String? svgIconPrefix,
  double? borderRadius,
  bool? iconSpace = true,
  double? contentPadding,
}) {
  Widget? prefixIconWidget;

  if (iconSpace == true) {
    prefixIconWidget = Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 8.0,
      ),
      child: SvgPicture.asset(
        svgIconPrefix.toString(),
        colorFilter: ColorFilter.mode(
          Color(borderColor),
          BlendMode.srcIn,
        ),
      ),
    );
  }

  return TextFormField(
    maxLines: maxLine ?? 1,
    controller: controller,
    validator: (String? value) {
      if (value == null || value.isEmpty) {
        return 'Campo Vacio';
      }
      return null;
    },
    obscureText: isObscure,
    cursorColor: const Color(constAgroColorLightGreen),
    decoration: InputDecoration(
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          width: 2,
          color: Color(constAgroColorLightGreen),
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(borderRadius ?? 40.0),
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 2,
          color: Color(borderColor),
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(borderRadius ?? 40.0),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 2,
          color: Color(borderColor),
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(borderRadius ?? 40.0),
        ),
      ),
      contentPadding: EdgeInsets.all(contentPadding ?? 8.0),
      prefixIcon: prefixIconWidget,
      hintText: hintText,
      hintStyle: const TextStyle(
        color: Color(0xD3707070),
      ),
      fillColor: Colors.white,
      filled: true,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(borderRadius ?? 40.0),
        ),
        borderSide: BorderSide(
          color: Color(borderColor),
          width: 2,
        ),
      ),
    ),
  );
}
