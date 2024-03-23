import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoply/logic/controllers/cart_controller.dart';
import 'package:shoply/utils/color_manager.dart';
import 'package:shoply/utils/font_manager.dart';
import 'package:shoply/utils/strings_manager.dart';
import 'package:shoply/utils/values_manager.dart';
import 'package:shoply/view/widgets/base/text_utils.dart';

class CartTotal extends StatelessWidget {
  CartTotal({super.key});

  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: const EdgeInsets.all(AppPadding.p20),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 TextUtils(
                  fontSize: FontSizeManager.s16,
                  fontWeight: FontWeightManager.bold,
                  text: AppStrings.total,
                  color: ColorManager.grey,
                  underLine: TextDecoration.none,
                ),
                Text(
                  "\$${controller.total}",
                  style: TextStyle(
                    color: Get.isDarkMode ? ColorManager.white : ColorManager.black,
                    fontSize: FontSizeManager.s20,
                    fontWeight: FontWeightManager.bold,
                    height: AppSize.s1_5,
                  ),
                ),
              ],
            ),
            const SizedBox(width: AppSize.s20),
            Expanded(
              child: SizedBox(
                height: AppSize.s60,
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
                  onPressed: () {},
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppStrings.checkOut,
                        style: TextStyle(
                          fontSize: FontSizeManager.s20,
                          color: ColorManager.white,
                        ),
                      ),
                      const SizedBox(width: AppSize.s10),
                      const Icon(Icons.shopping_cart),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
