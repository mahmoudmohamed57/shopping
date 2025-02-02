import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoply/logic/controllers/cart_controller.dart';
import 'package:shoply/model/product_models.dart';
import 'package:shoply/utils/color_manager.dart';
import 'package:shoply/view/widgets/base/text_utils.dart';


class AddCart extends StatelessWidget {
  final double price;
  final ProductModels productModels;
   AddCart({
    required this.price,
    required this.productModels,
    super.key,
  });
  final controller = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextUtils(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                text: "Price",
                color: Colors.grey,
                underLine: TextDecoration.none,
              ),
              Text(
                "\$$price",
                style: TextStyle(
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  height: 1.5,
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: SizedBox(
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ), backgroundColor: Get.isDarkMode ? ColorManager.pinkColor : ColorManager.mainColor,
                  elevation: 0,
                ),
                onPressed: () {
                  controller.addProductToCart(productModels);
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Add to Cart",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.shopping_cart_outlined,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}