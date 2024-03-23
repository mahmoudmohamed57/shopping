import 'package:flutter/material.dart';
import 'package:shoply/utils/assets_manager.dart';
import 'package:shoply/utils/color_manager.dart';
import 'package:shoply/utils/font_manager.dart';
import 'package:shoply/utils/routes_manager.dart';
import 'package:shoply/utils/strings_manager.dart';
import 'package:shoply/utils/values_manager.dart';
import 'package:shoply/view/widgets/base/text_utils.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(ImageAssets.onboardingLogo, fit: BoxFit.cover),
            ),
            Container(
              color: Colors.black.withOpacity(AppSize.s_3),
              width: double.infinity,
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: AppSize.s100),
                  Container(
                    height: AppSize.s50,
                    width: AppSize.s200,
                    decoration: BoxDecoration(
                      color: ColorManager.black.withOpacity(AppSize.s_3),
                      borderRadius: BorderRadius.circular(AppSize.s5),
                    ),
                    child: Center(
                      child: TextUtils(
                        fontSize: AppSize.s35,
                        fontWeight: FontWeightManager.bold,
                        text: AppStrings.onBoardingTitle1,
                        color: ColorManager.white,
                        underLine: TextDecoration.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: AppSize.s10),
                  Container(
                    height: AppSize.s50,
                    width: AppSize.s250,
                    decoration: BoxDecoration(
                      color: ColorManager.black.withOpacity(AppSize.s_3),
                      borderRadius: BorderRadius.circular(AppSize.s5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextUtils(
                          fontSize: AppSize.s35,
                          fontWeight: FontWeightManager.bold,
                          text: AppStrings.onBoardingTitle2,
                          color: ColorManager.mainColor,
                          underLine: TextDecoration.none,
                        ),
                        const SizedBox(width: AppSize.s10),
                        TextUtils(
                          fontSize: AppSize.s35,
                          fontWeight: FontWeightManager.bold,
                          text: AppStrings.onBoardingTitle3,
                          color: ColorManager.white,
                          underLine: TextDecoration.none,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: AppSize.s250),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorManager.mainColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppSize.s10),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppPadding.p40,
                        vertical: AppPadding.p10,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                        context,
                        Routes.loginRoute,
                      );
                    },
                    child: TextUtils(
                      fontSize: FontSizeManager.s25,
                      fontWeight: FontWeightManager.bold,
                      text: AppStrings.getStart,
                      color: ColorManager.white,
                      underLine: TextDecoration.none,
                    ),
                  ),
                  const SizedBox(height: AppSize.s30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextUtils(
                        fontSize: FontSizeManager.s20,
                        fontWeight: FontWeightManager.regular,
                        text: AppStrings.doNotHaveAnAccount,
                        color: ColorManager.white,
                        underLine: TextDecoration.none,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                            context,
                            Routes.registerRoute,
                          );
                        },
                        child: TextUtils(
                          text: AppStrings.signUp,
                          color: ColorManager.white,
                          fontSize: FontSizeManager.s20,
                          fontWeight: FontWeightManager.regular,
                          underLine: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
