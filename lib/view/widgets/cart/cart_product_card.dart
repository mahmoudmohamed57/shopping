import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoply/logic/controllers/cart_controller.dart';
import 'package:shoply/model/product_models.dart';
import 'package:shoply/utils/color_manager.dart';
import 'package:shoply/utils/font_manager.dart';
import 'package:shoply/utils/values_manager.dart';

class CartProductCard extends StatelessWidget {
  final ProductModels productModels;
  final int index;
  final int quantity;

  CartProductCard({
    required this.productModels,
    required this.index,
    required this.quantity,
    super.key,
  });

  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: AppPadding.p20,
        right: AppPadding.p20,
        top: AppPadding.p8,
      ),
      height: AppSize.s130,
      width: AppSize.s100,
      decoration: BoxDecoration(
        color: Get.isDarkMode
            ? ColorManager.pinkColor.withOpacity(0.7)
            : ColorManager.mainColor.withOpacity(0.4),
        borderRadius: BorderRadius.circular(AppSize.s20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: AppSize.s120,
            width: AppSize.s100,
            margin: const EdgeInsets.only(left: AppMargin.m14),
            decoration: BoxDecoration(
              color: ColorManager.white,
              borderRadius: BorderRadius.circular(AppSize.s20),
              image: DecorationImage(
                image: NetworkImage(productModels.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: AppSize.s20),
          Expanded(
            flex: AppSize.s15,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productModels.title,
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    color: Get.isDarkMode ? ColorManager.white : ColorManager.black,
                    fontSize: FontSizeManager.s14,
                    fontWeight: FontWeightManager.bold,
                  ),
                ),
                const SizedBox(height: AppSize.s20),
                Text(
                  "\$${controller.productSubTotal[index].toStringAsFixed(AppSize.s2)}",
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    color: Get.isDarkMode ? ColorManager.white : ColorManager.black,
                    fontSize: FontSizeManager.s16,
                    fontWeight: FontWeightManager.bold,
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      controller.removeProductsFarmCart(productModels);
                    },
                    icon: Icon(
                      Icons.remove_circle,
                      color: Get.isDarkMode ? ColorManager.white : ColorManager.black,
                    ),
                  ),
                  Text(
                    "$quantity",
                    style:  TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: ColorManager.black,
                      fontSize: FontSizeManager.s16,
                      fontWeight: FontWeightManager.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      controller.addProductToCart(productModels);
                    },
                    icon: Icon(
                      Icons.add_circle,
                      color: Get.isDarkMode ? ColorManager.white : ColorManager.black,
                    ),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {
                  controller.removeOneProduct(productModels);
                },
                icon: Icon(
                  Icons.delete,
                  size: AppSize.s20,
                  color: Get.isDarkMode ? ColorManager.black : ColorManager.pinkColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
