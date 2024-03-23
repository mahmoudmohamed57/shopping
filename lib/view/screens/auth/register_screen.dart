import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoply/logic/controllers/auth_controller.dart';
import 'package:shoply/utils/assets_manager.dart';
import 'package:shoply/utils/color_manager.dart';
import 'package:shoply/utils/font_manager.dart';
import 'package:shoply/utils/routes_manager.dart';
import 'package:shoply/utils/strings_manager.dart';
import 'package:shoply/utils/values_manager.dart';
import 'package:shoply/view/widgets/auth/auth_button.dart';
import 'package:shoply/view/widgets/auth/auth_text_from_field.dart';
import 'package:shoply/view/widgets/auth/check_widget.dart';
import 'package:shoply/view/widgets/auth/container_under.dart';
import 'package:shoply/view/functions/snackbar_utils.dart';
import 'package:shoply/view/widgets/base/text_utils.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final controller = Get.find<AuthController>();
  final fromKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.colorScheme.background,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / AppSize.s1_18,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: AppPadding.p20,
                    right: AppPadding.p20,
                    top: AppPadding.p40,
                  ),
                  child: Form(
                    key: fromKey,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            TextUtils(
                              fontSize: FontSizeManager.s30,
                              fontWeight: FontWeightManager.semiBold,
                              text: AppStrings.sign,
                              color: Get.isDarkMode
                                  ? ColorManager.pinkColor
                                  : ColorManager.mainColor,
                              underLine: TextDecoration.none,
                            ),
                            const SizedBox(width: AppSize.s5),
                            TextUtils(
                              fontSize: FontSizeManager.s30,
                              fontWeight: FontWeightManager.semiBold,
                              text: AppStrings.up_,
                              color: Get.isDarkMode
                                  ? ColorManager.white
                                  : ColorManager.black,
                              underLine: TextDecoration.none,
                            ),
                          ],
                        ),
                        const SizedBox(height: AppSize.s40),
                        AuthTextFromField(
                          controller: nameController,
                          obscureText: false,
                          validator: (value) {
                            if (value.toString().length <= AppSize.s2 ||
                                !RegExp(AppStrings.validationName)
                                    .hasMatch(value)) {
                              return 'Enter valid name';
                            } else {
                              return null;
                            }
                          },
                          prefixIcon: Get.isDarkMode
                              ? Icon(
                                  Icons.person,
                                  color: ColorManager.pinkColor,
                                  size: AppSize.s30,
                                )
                              : Image.asset(ImageAssets.userLogo),
                          suffixIcon: const Text(""),
                          hintText: AppStrings.userName,
                        ),
                        const SizedBox(height: AppSize.s20),
                        AuthTextFromField(
                          controller: emailController,
                          obscureText: false,
                          validator: (value) {
                            if (!RegExp(AppStrings.validationEmail)
                                .hasMatch(value)) {
                              return 'Invalid email';
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
                        const SizedBox(height: AppSize.s20),
                        GetBuilder<AuthController>(
                          builder: (_) {
                            return AuthTextFromField(
                              controller: passwordController,
                              obscureText:
                                  controller.isVisibility ? false : true,
                              validator: (value) {
                                if (value.toString().length < AppSize.s8) {
                                  return 'Password should be longer or equal to 6 characters';
                                } else {
                                  return null;
                                }
                              },
                              prefixIcon: Get.isDarkMode
                                  ? Icon(
                                      Icons.lock,
                                      color: ColorManager.pinkColor,
                                      size: AppSize.s30,
                                    )
                                  : Image.asset(ImageAssets.lockLogo),
                              hintText: AppStrings.password,
                              suffixIcon: IconButton(
                                onPressed: () {
                                  controller.changeVisibility();
                                },
                                icon: controller.isVisibility
                                    ? Icon(
                                        Icons.visibility_off,
                                        color: ColorManager.black,
                                      )
                                    : Icon(
                                        Icons.visibility,
                                        color: ColorManager.black,
                                      ),
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: AppSize.s20),
                        CheckWidget(),
                        const SizedBox(height: AppSize.s30),
                        GetBuilder<AuthController>(
                          builder: (_) {
                            return AuthButton(
                              onPressed: () {
                                if (controller.isCheckBox == false) {
                                  snackBarUtils(
                                    AppStrings.attention,
                                    AppStrings.pleaseAcceptTermsAndConditions,
                                  );
                                } else if (fromKey.currentState!.validate()) {
                                  String name = nameController.text.trim();
                                  String email = emailController.text.trim();
                                  String password = passwordController.text;
                                  controller.signUpUsingFirebase(
                                    name: name,
                                    email: email,
                                    password: password,
                                  );
                                  controller.isCheckBox = true;
                                }
                              },
                              text: AppStrings.sign + AppStrings.up_,
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
              ContainerUnder(
                text: AppStrings.alreadyHaveAnAccount,
                textType: AppStrings.signIn,
                onPressed: () {
                  Get.offNamed(Routes.loginRoute);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
