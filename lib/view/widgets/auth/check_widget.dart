import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoply/logic/controllers/auth_controller.dart';
import 'package:shoply/utils/assets_manager.dart';
import 'package:shoply/utils/color_manager.dart';
import 'package:shoply/utils/font_manager.dart';
import 'package:shoply/utils/strings_manager.dart';
import 'package:shoply/utils/values_manager.dart';
import 'package:shoply/view/widgets/base/text_utils.dart';

class CheckWidget extends StatelessWidget {
  CheckWidget({super.key});

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (_) {
        return Row(
          children: [
            InkWell(
              onTap: () {
                controller.changeCheckBox();
              },
              child: Container(
                height: AppSize.s35,
                width: AppSize.s35,
                decoration: BoxDecoration(
                  color: ColorManager.grey,
                  borderRadius: BorderRadius.circular(AppSize.s10),
                ),
                child: controller.isCheckBox
                    ? Get.isDarkMode
                        ? Icon(
                            Icons.done,
                            color: ColorManager.pinkColor,
                          )
                        : Image.asset(ImageAssets.checkLogo)
                    : Container(),
              ),
            ),
            const SizedBox(width: AppSize.s10),
            Row(
              children: [
                TextUtils(
                  fontSize: FontSizeManager.s16,
                  fontWeight: FontWeightManager.semiBold,
                  text: AppStrings.iAccept,
                  color:
                      Get.isDarkMode ? ColorManager.white : ColorManager.black,
                  underLine: TextDecoration.none,
                ),
                const SizedBox(width: AppSize.s5),
                TextUtils(
                  fontSize: FontSizeManager.s16,
                  fontWeight: FontWeightManager.semiBold,
                  text: AppStrings.termsAndConditions,
                  color:
                      Get.isDarkMode ? ColorManager.white : ColorManager.black,
                  underLine: TextDecoration.underline,
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
