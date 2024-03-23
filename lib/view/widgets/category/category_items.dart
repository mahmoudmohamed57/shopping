import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoply/logic/controllers/cart_controller.dart';
import 'package:shoply/logic/controllers/category_controller.dart';
import 'package:shoply/logic/controllers/product_controller.dart';
import 'package:shoply/model/product_models.dart';
import 'package:shoply/utils/color_manager.dart';
import 'package:shoply/view/screens/layout/product_details_screen.dart';
import 'package:shoply/view/widgets/base/text_utils.dart';

class CategoryItems extends StatelessWidget {
  final String categoryTitle;

  CategoryItems({
    required this.categoryTitle,
    super.key,
  });

  final controller = Get.find<ProductController>();

  final cartController = Get.find<CartController>();

  final categoryController = Get.find<CategoryController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.colorScheme.background,
      appBar: AppBar(
        title: Text(categoryTitle),
        centerTitle: true,
        backgroundColor:
            Get.isDarkMode ? ColorManager.pinkColor : ColorManager.mainColor,
      ),
      body: Obx(() {
        if (categoryController.isAllCategory.value) {
          return Center(
            child: CircularProgressIndicator(
              color: Get.isDarkMode
                  ? ColorManager.pinkColor
                  : ColorManager.mainColor,
            ),
          );
        } else {
          return GridView.builder(
            itemCount: categoryController.categoryList.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              childAspectRatio: 0.8,
              mainAxisSpacing: 9.0,
              crossAxisSpacing: 6.0,
              maxCrossAxisExtent: 200,
            ),
            itemBuilder: (context, index) {
              return buildCardItems(
                  image: categoryController.categoryList[index].image,
                  price: categoryController.categoryList[index].price,
                  rate: categoryController.categoryList[index].rating.rate,
                  productId: categoryController.categoryList[index].id,
                  productModels: categoryController.categoryList[index],
                  onTap: () {
                    Get.to(() => ProductDetailsScreen(
                          productModels: categoryController.categoryList[index],
                        ));
                  });
            },
          );
        }
      }),
    );
  }

  Widget buildCardItems({
    required String image,
    required double price,
    required double rate,
    required int productId,
    required ProductModels productModels,
    required Function() onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3.0,
                blurRadius: 5.0,
              ),
            ],
          ),
          child: Column(
            children: [
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        controller.manageFavourites(productId);
                      },
                      icon: controller.isFavourite(productId)
                          ?  Icon(
                              Icons.favorite,
                              color: Get.isDarkMode
                                  ? ColorManager.pinkColor
                                  : ColorManager.mainColor,
                            )
                          : const Icon(
                              Icons.favorite_outline,
                              color: Colors.black,
                            ),
                    ),
                    IconButton(
                      onPressed: () {
                        cartController.addProductToCart(productModels);
                      },
                      icon: const Icon(
                        Icons.shopping_cart,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 140,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.network(
                  image,
                  fit: BoxFit.fitHeight,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$ $price",
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      height: 20,
                      width: 45,
                      decoration: BoxDecoration(
                        color: Get.isDarkMode
                            ? ColorManager.pinkColor
                            : ColorManager.mainColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 3, right: 2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextUtils(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              text: "$rate",
                              color: Colors.white,
                              underLine: TextDecoration.none,
                            ),
                            const Icon(
                              Icons.star,
                              size: 13,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
