import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoply/logic/controllers/auth_controller.dart';
import 'package:shoply/utils/color_manager.dart';
import 'package:shoply/utils/font_manager.dart';
import 'package:shoply/utils/strings_manager.dart';
import 'package:shoply/utils/values_manager.dart';
import 'package:shoply/view/widgets/base/text_utils.dart';

class LogOutWidget extends StatelessWidget {
  LogOutWidget({super.key});

  final controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (_) => Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Get.defaultDialog(
              title: AppStrings.logoutFromApp,
              titleStyle: TextStyle(
                fontSize: FontSizeManager.s18,
                color: ColorManager.black,
                fontWeight: FontWeightManager.bold,
              ),
              middleText: AppStrings.areYouSureYouNeedToLogout,
              middleTextStyle: TextStyle(
                fontSize: FontSizeManager.s18,
                color: ColorManager.black,
                fontWeight: FontWeightManager.bold,
              ),
              backgroundColor: ColorManager.grey,
              radius: 10,
              textCancel: AppStrings.no,
              cancelTextColor: ColorManager.white,
              textConfirm: AppStrings.yes,
              confirmTextColor: ColorManager.white,
              onCancel: () {
                Get.back();
              },
              onConfirm: () {
                controller.signOutFromApp();
              },
              buttonColor: Get.isDarkMode
                  ? ColorManager.pinkColor
                  : ColorManager.mainColor,
            );
          },
          splashColor:
              Get.isDarkMode ? ColorManager.pinkColor : ColorManager.mainColor,
          borderRadius: BorderRadius.circular(AppSize.s12),
          customBorder: const StadiumBorder(),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(AppPadding.p10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorManager.logOutSettings,
                ),
                child:  Icon(
                  Icons.logout,
                  color: ColorManager.white,
                ),
              ),
              const SizedBox(width: AppSize.s20),
              TextUtils(
                fontSize: FontSizeManager.s25,
                fontWeight: FontWeightManager.bold,
                text: AppStrings.logout,
                color: Get.isDarkMode ? ColorManager.white : ColorManager.black,
                underLine: TextDecoration.none,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
