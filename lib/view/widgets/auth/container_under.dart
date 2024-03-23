import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoply/utils/color_manager.dart';
import 'package:shoply/utils/font_manager.dart';
import 'package:shoply/utils/values_manager.dart';
import 'package:shoply/view/widgets/base/text_utils.dart';

class ContainerUnder extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final String textType;

  const ContainerUnder({
    required this.text,
    required this.onPressed,
    required this.textType,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: AppSize.s80,
      decoration: BoxDecoration(
        color: Get.isDarkMode ? ColorManager.pinkColor : ColorManager.mainColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(AppSize.s20),
          topRight: Radius.circular(AppSize.s20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextUtils(
            fontSize: FontSizeManager.s20,
            fontWeight: FontWeightManager.bold,
            text: text,
            color: ColorManager.white,
            underLine: TextDecoration.none,
          ),
          TextButton(
            onPressed: onPressed,
            child: TextUtils(
              fontSize: FontSizeManager.s20,
              fontWeight: FontWeightManager.bold,
              text: textType,
              color: ColorManager.white,
              underLine: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );
  }
}
