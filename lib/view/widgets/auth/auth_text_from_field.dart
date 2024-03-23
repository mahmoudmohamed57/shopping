import 'package:flutter/material.dart';
import 'package:shoply/utils/color_manager.dart';
import 'package:shoply/utils/font_manager.dart';
import 'package:shoply/utils/values_manager.dart';

class AuthTextFromField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final Function validator;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final String hintText;

  const AuthTextFromField({
    required this.controller,
    required this.obscureText,
    required this.validator,
    required this.prefixIcon,
    required this.suffixIcon,
    required this.hintText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      cursorColor: ColorManager.black,
      keyboardType: TextInputType.text,
      validator: (value) => validator(value),
      style: TextStyle(color: ColorManager.black),
      decoration: InputDecoration(
        fillColor: ColorManager.grey,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: TextStyle(
          color: ColorManager.black,
          fontSize: AppSize.s16,
          fontWeight: FontWeightManager.semiBold,
        ),
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.white),
          borderRadius: BorderRadius.circular(AppSize.s10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.white),
          borderRadius: BorderRadius.circular(AppSize.s10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.white),
          borderRadius: BorderRadius.circular(AppSize.s10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.white),
          borderRadius: BorderRadius.circular(AppSize.s10),
        ),
      ),
    );
  }
}
