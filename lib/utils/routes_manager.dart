import 'package:get/get.dart';
import 'package:shoply/logic/bindings/auth_binding.dart';
import 'package:shoply/logic/bindings/main_binding.dart';
import 'package:shoply/logic/bindings/product_binding.dart';
import 'package:shoply/view/screens/auth/forgot_password_screen.dart';
import 'package:shoply/view/screens/auth/login_screen.dart';
import 'package:shoply/view/screens/auth/register_screen.dart';
import 'package:shoply/view/screens/layout/cart_screen.dart';
import 'package:shoply/view/screens/layout/main_screen.dart';
import 'package:shoply/view/screens/onboarding/onboarding_screen.dart';

class Routes {
  static const String onBoardingRoute = "/onBoarding";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String mainRoute = "/main";
  static const String cartRoute = '/cart';
}

class AppRoutes {
  static final routes = [
    GetPage(
      name: Routes.onBoardingRoute,
      page: () => const OnBoardingScreen(),
    ),
    GetPage(
      name: Routes.loginRoute,
      page: () => LoginScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.registerRoute,
      page: () => RegisterScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.forgotPasswordRoute,
      page: () => ForgotPasswordScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.forgotPasswordRoute,
      page: () => ForgotPasswordScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.mainRoute,
      page: () => MainLayout(),
      bindings: [
        AuthBinding(),
        MainBinding(),
        ProductBinding(),
      ],
    ),
    GetPage(
      name: Routes.cartRoute,
      page: () => CartScreen(),
      bindings: [
        AuthBinding(),
        ProductBinding(),
      ],
    ),
  ];
}
