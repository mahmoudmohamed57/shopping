import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoply/model/product_models.dart';
import 'package:shoply/utils/color_manager.dart';
import 'package:shoply/utils/font_manager.dart';
import 'package:shoply/utils/routes_manager.dart';
import 'package:shoply/utils/strings_manager.dart';
import 'package:shoply/utils/values_manager.dart';

class CartController extends GetxController {
  var productsMap = {}.obs;

  void addProductToCart(ProductModels productModels) {
    if (productsMap.containsKey(productModels)) {
      productsMap[productModels] += AppSize.s1_;
    } else {
      productsMap[productModels] = AppSize.s1_;
    }
  }

  void removeProductsFarmCart(ProductModels productModels) {
    if (productsMap.containsKey(productModels) &&
        productsMap[productModels] == AppSize.s1_) {
      productsMap.removeWhere((key, value) => key == productModels);
    } else {
      productsMap[productModels] -= AppSize.s1_;
    }
  }

  void removeOneProduct(ProductModels productModels) {
    productsMap.removeWhere((key, value) => key == productModels);
  }

  void clearAllProducts() {
    Get.defaultDialog(
      title: AppStrings.cleanProducts,
      titleStyle: TextStyle(
        fontSize: FontSizeManager.s18,
        color: ColorManager.black,
        fontWeight: FontWeightManager.bold,
      ),
      middleText: AppStrings.areYouSureYouNeedClearProducts,
      middleTextStyle: TextStyle(
        fontSize: FontSizeManager.s18,
        color: ColorManager.black,
        fontWeight: FontWeightManager.bold,
      ),
      backgroundColor: ColorManager.grey,
      radius: AppSize.s10,
      textCancel: AppStrings.no,
      cancelTextColor: ColorManager.white,
      textConfirm: AppStrings.yes,
      confirmTextColor: ColorManager.white,
      onCancel: () {
        Get.toNamed(Routes.cartRoute);
      },
      onConfirm: () {
        productsMap.clear();
        Get.back();
      },
      buttonColor:
          Get.isDarkMode ? ColorManager.pinkColor : ColorManager.mainColor,
    );
  }

  get productSubTotal => productsMap.entries
      .map((element) => element.key.price * element.value)
      .toList();

  get total => productsMap.entries
      .map((element) => element.key.price * element.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(AppSize.s2);

  int quantity() {
    if (productsMap.isEmpty) {
      return 0;
    } else {
      return productsMap.entries
          .map((e) => e.value)
          .toList()
          .reduce((value, element) => value + element);
    }
  }
}
