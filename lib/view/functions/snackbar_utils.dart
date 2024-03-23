import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoply/utils/color_manager.dart';
import 'package:shoply/utils/font_manager.dart';
import 'package:shoply/utils/values_manager.dart';

SnackbarController snackBarUtils(String title, String message) {
  return Get.snackbar(
    '',
    '',
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor:
        Get.isDarkMode ? ColorManager.pinkColor : ColorManager.mainColor,
    colorText: Get.isDarkMode ? ColorManager.white : ColorManager.black,
    duration: const Duration(seconds: AppSize.s3),
    titleText: Text(
      title,
      style: TextStyle(
        fontSize: FontSizeManager.s18,
        color: ColorManager.white,
      ),
    ),
    messageText: Text(
      message,
      style: TextStyle(
        fontSize: FontSizeManager.s18,
        color: ColorManager.white,
      ),
    ),
  );
}
