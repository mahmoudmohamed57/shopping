import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoply/utils/color_manager.dart';
import 'package:shoply/utils/font_manager.dart';
import 'package:shoply/utils/values_manager.dart';
import 'package:shoply/view/widgets/base/text_utils.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final Function() onPressed;

  const AuthButton({
    required this.onPressed,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor:
            Get.isDarkMode ? ColorManager.pinkColor : ColorManager.mainColor,
        minimumSize: const Size(AppSize.s350, AppSize.s50),
      ),
      child: TextUtils(
        color: ColorManager.white,
        text: text,
        fontSize: FontSizeManager.s18,
        fontWeight: FontWeightManager.bold,
        underLine: TextDecoration.none,
      ),
    );
  }
}
