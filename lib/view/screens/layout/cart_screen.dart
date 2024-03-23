import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoply/logic/controllers/cart_controller.dart';
import 'package:shoply/utils/color_manager.dart';
import 'package:shoply/utils/strings_manager.dart';
import 'package:shoply/utils/values_manager.dart';
import 'package:shoply/view/widgets/cart/cart_product_card.dart';
import 'package:shoply/view/widgets/cart/cart_total.dart';
import 'package:shoply/view/widgets/cart/empty_cart.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.colorScheme.background,
        appBar: AppBar(
          title: const Text(AppStrings.cartItems),
          elevation: AppSize.s0,
          backgroundColor: Get.isDarkMode
              ? ColorManager.pinkColor
              : ColorManager.mainColor,
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                controller.clearAllProducts();
              },
              icon: const Icon(Icons.backspace),
            ),
          ],
        ),
        body: Obx(
          () {
            if (controller.productsMap.isEmpty) {
              return const EmptyCart();
            } else {
              return Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / AppSize.s1_4,
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        return CartProductCard(
                          index: index,
                          productModels:
                              controller.productsMap.keys.toList()[index],
                          quantity:
                              controller.productsMap.values.toList()[index],
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: AppSize.s20),
                      itemCount: controller.productsMap.length,
                    ),
                  ),
                  CartTotal(),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
