import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoply/logic/controllers/auth_controller.dart';
import 'package:shoply/utils/assets_manager.dart';
import 'package:shoply/utils/color_manager.dart';
import 'package:shoply/utils/font_manager.dart';
import 'package:shoply/utils/strings_manager.dart';
import 'package:shoply/utils/values_manager.dart';
import 'package:shoply/view/widgets/auth/auth_button.dart';
import 'package:shoply/view/widgets/auth/auth_text_from_field.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});

  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.colorScheme.background,
        appBar: AppBar(
          backgroundColor:
              Get.isDarkMode ? ColorManager.darkGreyColor : ColorManager.white,
          centerTitle: true,
          elevation: AppSize.s0,
          title: Text(
            'Forgot Password',
            style: TextStyle(
              color: Get.isDarkMode
                  ? ColorManager.pinkColor
                  : ColorManager.mainColor,
            ),
          ),
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Get.isDarkMode ? ColorManager.white : ColorManager.black,
            ),
          ),
        ),
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
              child: Column(
                children: [
                  const SizedBox(height: AppSize.s50),
                  Text(
                    AppStrings.caption,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Get.isDarkMode
                          ? ColorManager.white
                          : ColorManager.black,
                      fontSize: FontSizeManager.s18,
                    ),
                  ),
                  const SizedBox(height: AppSize.s50),
                  Image.asset(ImageAssets.forgetPassword, width: AppSize.s200),
                  const SizedBox(
                    height: AppSize.s50,
                  ),
                  AuthTextFromField(
                    controller: emailController,
                    obscureText: false,
                    validator: (value) {
                      if (!RegExp(AppStrings.validationEmail).hasMatch(value)) {
                        return AppStrings.invalidEmail;
                      } else {
                        return null;
                      }
                    },
                    prefixIcon: Get.isDarkMode
                        ? Icon(
                            Icons.email,
                            color: ColorManager.pinkColor,
                            size: AppSize.s30,
                          )
                        : Image.asset(ImageAssets.emailLogo),
                    suffixIcon: const Text(""),
                    hintText: AppStrings.emailAddress,
                  ),
                  const SizedBox(
                    height: AppSize.s50,
                  ),
                  GetBuilder<AuthController>(
                    builder: (_) {
                      return AuthButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            String email = emailController.text.trim();
                            controller.resetPassword(email);
                          }
                        },
                        text: AppStrings.send,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
