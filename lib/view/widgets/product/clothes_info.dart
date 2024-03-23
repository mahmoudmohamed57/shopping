import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'package:shoply/logic/controllers/product_controller.dart';
import 'package:shoply/utils/color_manager.dart';
import 'package:shoply/view/widgets/base/text_utils.dart';

class ClothesInfo extends StatelessWidget {
  final String title;
  final int productId;
  final double rate;
  final String description;

  ClothesInfo({
    required this.title,
    required this.productId,
    required this.rate,
    required this.description,
    super.key,
  });

  final controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
              ),
              Obx(
                () => Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Get.isDarkMode
                        ? Colors.white.withOpacity(0.9)
                        : Colors.grey.withOpacity(0.4),
                    shape: BoxShape.circle,
                  ),
                  child: InkWell(
                    onTap: () {
                      controller.manageFavourites(productId);
                    },
                    child: controller.isFavourite(productId)
                        ? Icon(
                            Icons.favorite,
                            color: Get.isDarkMode
                                ? ColorManager.pinkColor
                                : ColorManager.mainColor,
                            size: 20,
                          )
                        : const Icon(
                            Icons.favorite_outline,
                            color: Colors.black,
                            size: 20,
                          ),
                  ),
                ),
              ),
            ],
          ),
          ReadMoreText(
            description,
            trimLines: 3,
            textAlign: TextAlign.justify,
            trimMode: TrimMode.Line,
            trimCollapsedText: " Show More ",
            trimExpandedText: " Show Less ",
            lessStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode
                  ? ColorManager.pinkColor
                  : ColorManager.mainColor,
            ),
            moreStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode
                  ? ColorManager.pinkColor
                  : ColorManager.mainColor,
            ),
            style: TextStyle(
              fontSize: 16,
              height: 2,
              color: Get.isDarkMode ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
