import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoply/utils/color_manager.dart';
import 'package:shoply/utils/font_manager.dart';
import 'package:shoply/utils/strings_manager.dart';
import 'package:shoply/utils/values_manager.dart';
import 'package:shoply/view/widgets/home/card_items.dart';
import 'package:shoply/view/widgets/home/search_text_form.dart';
import 'package:shoply/view/widgets/base/text_utils.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.colorScheme.background,
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: AppSize.s190,
              decoration: BoxDecoration(
                color: Get.isDarkMode
                    ? ColorManager.pinkColor
                    : ColorManager.mainColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(AppSize.s20),
                  bottomRight: Radius.circular(AppSize.s20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: AppPadding.p20, right: AppPadding.p20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     TextUtils(
                      fontSize: FontSizeManager.s25,
                      fontWeight: FontWeightManager.bold,
                      text: AppStrings.findYour,
                      color: ColorManager.white,
                      underLine: TextDecoration.none,
                    ),
                    const SizedBox(height: AppSize.s5),
                     TextUtils(
                      fontSize: FontSizeManager.s25,
                      fontWeight: FontWeightManager.bold,
                      text: AppStrings.inspiration,
                      color: ColorManager.white,
                      underLine: TextDecoration.none,
                    ),
                    const SizedBox(height: AppSize.s20),
                    SearchFormText(),
                  ],
                ),
              ),
            ),
            const SizedBox(height: AppSize.s10),
            Padding(
              padding: const EdgeInsets.only(left: AppPadding.p20),
              child: Align(
                alignment: Alignment.topLeft,
                child: TextUtils(
                  fontSize: FontSizeManager.s20,
                  fontWeight: FontWeightManager.semiBold,
                  text: AppStrings.categories,
                  color: Get.isDarkMode ? ColorManager.white : ColorManager.black,
                  underLine: TextDecoration.none,
                ),
              ),
            ),
            const SizedBox(height: AppSize.s30),
            CardItems(),
          ],
        ),
      ),
    );
  }
}
