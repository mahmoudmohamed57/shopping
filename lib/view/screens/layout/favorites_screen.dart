import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoply/logic/controllers/product_controller.dart';
import 'package:shoply/utils/assets_manager.dart';
import 'package:shoply/utils/color_manager.dart';
import 'package:shoply/utils/font_manager.dart';
import 'package:shoply/utils/strings_manager.dart';
import 'package:shoply/utils/values_manager.dart';

class FavoritesScreen extends StatelessWidget {
  FavoritesScreen({super.key});

  final controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.colorScheme.background,
      body: Obx(
        () {
          if (controller.favouritesList.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: AppSize.s100,
                    width: AppSize.s100,
                    child: Image.asset(ImageAssets.heart),
                  ),
                  const SizedBox(height: AppSize.s20),
                  Text(
                    AppStrings.pleaseAddYourFavoritesProducts,
                    style: TextStyle(
                      fontWeight: FontWeightManager.bold,
                      color: Get.isDarkMode
                          ? ColorManager.white
                          : ColorManager.black,
                      fontSize: FontSizeManager.s18,
                    ),
                  ),
                ],
              ),
            );
          } else {
            return ListView.separated(
              itemBuilder: (context, index) {
                return buildFavItems(
                  image: controller.favouritesList[index].image,
                  price: controller.favouritesList[index].price,
                  title: controller.favouritesList[index].title,
                  productId: controller.favouritesList[index].id,
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  color: ColorManager.grey,
                  thickness: AppSize.s1,
                );
              },
              itemCount: controller.favouritesList.length,
            );
          }
        },
      ),
    );
  }

  Widget buildFavItems({
    required String image,
    required double price,
    required String title,
    required int productId,
  }) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p10),
      child: SizedBox(
        width: double.infinity,
        height: AppSize.s100,
        child: Row(
          children: [
            SizedBox(
              child: Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSize.s10),
                ),
                child: AspectRatio(
                  aspectRatio: AppSize.s1,
                  child: Image.network(image, fit: BoxFit.cover),
                ),
              ),
            ),
            const SizedBox(width: AppSize.s14),
            Expanded(
              flex: AppSize.s10_,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Get.isDarkMode
                          ? ColorManager.white
                          : ColorManager.black,
                      fontSize: FontSizeManager.s16,
                      fontWeight: FontWeightManager.bold,
                    ),
                  ),
                  const SizedBox(height: AppSize.s10),
                  Text(
                    '\$ $price',
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Get.isDarkMode
                          ? ColorManager.white
                          : ColorManager.black,
                      fontSize: FontSizeManager.s16,
                      fontWeight: FontWeightManager.bold,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {
                controller.manageFavourites(productId);
              },
              icon: Icon(
                Icons.favorite,
                color: Get.isDarkMode ? ColorManager.pinkColor : ColorManager.mainColor,
                size: AppSize.s30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
