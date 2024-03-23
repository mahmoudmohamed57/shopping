import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoply/logic/controllers/cart_controller.dart';
import 'package:shoply/logic/controllers/main_controller.dart';
import 'package:shoply/utils/assets_manager.dart';
import 'package:shoply/utils/color_manager.dart';
import 'package:shoply/utils/font_manager.dart';
import 'package:shoply/utils/routes_manager.dart';
import 'package:shoply/utils/values_manager.dart';

class MainLayout extends StatelessWidget {
  MainLayout({super.key});

  final controller = Get.find<MainController>();
  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () {
          return Scaffold(
            backgroundColor: context.theme.colorScheme.background,
            appBar: AppBar(
              elevation: AppSize.s0,
              leading: Container(),
              actions: [
                IconButton(
                  onPressed: () {
                    Get.toNamed(Routes.cartRoute);
                  },
                  icon: Image.asset(ImageAssets.shop),
                ),
              ],
              backgroundColor: Get.isDarkMode
                  ? ColorManager.pinkColor
                  : ColorManager.mainColor,
              title: Text(
                controller.title[controller.currentIndex.value],
                style: TextStyle(
                  fontSize: AppSize.s24,
                  fontWeight: FontWeightManager.semiBold,
                  color: ColorManager.white,
                ),
              ),
              centerTitle: true,
            ),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Get.isDarkMode
                  ? ColorManager.darkGreyColor
                  : ColorManager.white,
              currentIndex: controller.currentIndex.value,
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  activeIcon: Icon(
                    Icons.home,
                    color: Get.isDarkMode
                        ? ColorManager.pinkColor
                        : ColorManager.mainColor,
                  ),
                  icon: Icon(
                    Icons.home,
                    color: Get.isDarkMode
                        ? ColorManager.white
                        : ColorManager.black,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  activeIcon: Icon(
                    Icons.category,
                    color: Get.isDarkMode
                        ? ColorManager.pinkColor
                        : ColorManager.mainColor,
                  ),
                  icon: Icon(
                    Icons.category,
                    color: Get.isDarkMode
                        ? ColorManager.white
                        : ColorManager.black,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  activeIcon: Icon(
                    Icons.favorite,
                    color: Get.isDarkMode
                        ? ColorManager.pinkColor
                        : ColorManager.mainColor,
                  ),
                  icon: Icon(
                    Icons.favorite,
                    color: Get.isDarkMode
                        ? ColorManager.white
                        : ColorManager.black,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  activeIcon: Icon(
                    Icons.settings,
                    color: Get.isDarkMode
                        ? ColorManager.pinkColor
                        : ColorManager.mainColor,
                  ),
                  icon: Icon(
                    Icons.settings,
                    color: Get.isDarkMode
                        ? ColorManager.white
                        : ColorManager.black,
                  ),
                  label: '',
                ),
              ],
              onTap: (index) {
                controller.currentIndex.value = index;
              },
            ),
            body: IndexedStack(
              index: controller.currentIndex.value,
              children: controller.tabs,
            ),
          );
        },
      ),
    );
  }
}
