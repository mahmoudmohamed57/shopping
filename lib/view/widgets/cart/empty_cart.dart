import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoply/utils/color_manager.dart';
import 'package:shoply/utils/font_manager.dart';
import 'package:shoply/utils/routes_manager.dart';
import 'package:shoply/utils/strings_manager.dart';
import 'package:shoply/utils/values_manager.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_cart,
            size: AppSize.s160,
            color: Get.isDarkMode ? ColorManager.white : ColorManager.black,
          ),
          const SizedBox(height: AppSize.s40),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: AppStrings.yourCartIs,
                  style: TextStyle(
                    color: Get.isDarkMode
                        ? ColorManager.white
                        : ColorManager.black,
                    fontSize: FontSizeManager.s30,
                    fontWeight: FontWeightManager.bold,
                  ),
                ),
                TextSpan(
                  text: AppStrings.empty,
                  style: TextStyle(
                    color: Get.isDarkMode
                        ? ColorManager.pinkColor
                        : ColorManager.mainColor,
                    fontSize: FontSizeManager.s30,
                    fontWeight: FontWeightManager.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSize.s10),
          Text(
            AppStrings.addItemsToGetStarted,
            style: TextStyle(
              color: Get.isDarkMode ? ColorManager.white : ColorManager.black,
              fontSize: FontSizeManager.s16,
              fontWeight: FontWeightManager.bold,
            ),
          ),
          const SizedBox(height: AppSize.s50),
          SizedBox(
            height: AppSize.s50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                backgroundColor: Get.isDarkMode
                    ? ColorManager.pinkColor
                    : ColorManager.mainColor,
                elevation: AppSize.s0,
              ),
              onPressed: () {
                Get.toNamed(Routes.mainRoute);
              },
              child: Text(
                AppStrings.goToHome,
                style: TextStyle(
                  fontSize: FontSizeManager.s20,
                  color: ColorManager.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
