import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoply/utils/color_manager.dart';
import 'package:shoply/utils/font_manager.dart';
import 'package:shoply/utils/strings_manager.dart';
import 'package:shoply/utils/values_manager.dart';
import 'package:shoply/view/widgets/settings/dark_mode_widget.dart';
import 'package:shoply/view/widgets/settings/logout_widget.dart';
import 'package:shoply/view/widgets/base/text_utils.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.colorScheme.background,
      body: ListView(
        padding: const EdgeInsets.all(AppPadding.p20),
        children: [
          const SizedBox(height: AppSize.s10),
          TextUtils(
            fontSize: FontSizeManager.s18,
            fontWeight: FontWeightManager.bold,
            text: AppStrings.generalSettings,
            color: Get.isDarkMode
                ? ColorManager.pinkColor
                : ColorManager.mainColor,
            underLine: TextDecoration.none,
          ),
          const SizedBox(height: AppSize.s10),
          Divider(
            color: Get.isDarkMode ? ColorManager.white : ColorManager.grey,
            thickness: AppSize.s1_5,
          ),
          const SizedBox(height: AppSize.s20),
          DarkModeWidget(),
          const SizedBox(height: AppSize.s20),
          LogOutWidget(),
        ],
      ),
    );
  }
}
