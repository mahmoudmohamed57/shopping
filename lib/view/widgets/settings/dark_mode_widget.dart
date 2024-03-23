import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoply/logic/controllers/settings_controller.dart';
import 'package:shoply/logic/controllers/theme_controller.dart';
import 'package:shoply/utils/color_manager.dart';
import 'package:shoply/utils/font_manager.dart';
import 'package:shoply/utils/strings_manager.dart';
import 'package:shoply/utils/values_manager.dart';
import 'package:shoply/view/widgets/base/text_utils.dart';

class DarkModeWidget extends StatelessWidget {
  DarkModeWidget({super.key});

  final controller = Get.find<SettingController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildIconWidget(),
          Switch(
            activeTrackColor: ColorManager.grey,
            inactiveTrackColor: ColorManager.grey,
            activeColor: Get.isDarkMode
                ? ColorManager.pinkColor
                : ColorManager.mainColor,
            inactiveThumbColor: Get.isDarkMode
                ? ColorManager.pinkColor
                : ColorManager.mainColor,
            value: controller.switchValue.value,
            onChanged: (value) {
              ThemeController().changesTheme();
              controller.switchValue.value = value;
            },
          ),
        ],
      ),
    );
  }

  Widget buildIconWidget() {
    return Material(
      color: Colors.transparent,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(AppPadding.p8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: ColorManager.darkSettings,
            ),
            child: Icon(Icons.dark_mode, color: ColorManager.white),
          ),
          const SizedBox(width: AppSize.s20),
          TextUtils(
            fontSize: FontSizeManager.s22,
            fontWeight: FontWeightManager.bold,
            text: AppStrings.darkMode,
            color: Get.isDarkMode ? ColorManager.white : ColorManager.black,
            underLine: TextDecoration.none,
          ),
        ],
      ),
    );
  }
}
