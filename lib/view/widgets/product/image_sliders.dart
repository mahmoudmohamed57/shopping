import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoply/utils/color_manager.dart';
import 'package:shoply/view/widgets/product/color_picker.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageSliders extends StatefulWidget {
  final String imageUrl;

  const ImageSliders({
    required this.imageUrl,
    super.key,
  });

  @override
  ImageSlidersState createState() => ImageSlidersState();
}

class ImageSlidersState extends State<ImageSliders> {
  CarouselController carouselController = CarouselController();

  // final cartController = Get.find<CartController>();

  final List<Color> colorSelected = [
    ColorManager.kColor1,
    ColorManager.kColor2,
    ColorManager.kColor3,
    ColorManager.kColor4,
    ColorManager.kColor5,
    ColorManager.kColor2,
    ColorManager.kColor3,
    ColorManager.kColor4,
  ];
  int currentPage = 0;
  int currentColor = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider.builder(
          itemCount: 3,
          carouselController: carouselController,
          options: CarouselOptions(
              height: 500,
              autoPlay: true,
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
              autoPlayInterval: const Duration(seconds: 2),
              viewportFraction: 1,
              onPageChanged: (index, reson) {
                setState(() {
                  currentPage = index;
                });
              }),
          itemBuilder: (context, index, realIndex) {
            return Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.imageUrl),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(25),
              ),
            );
          },
        ),
        Positioned(
          bottom: 30,
          left: 180,
          child: AnimatedSmoothIndicator(
            activeIndex: currentPage,
            count: 3,
            effect: ExpandingDotsEffect(
              dotHeight: 10,
              dotWidth: 10,
              activeDotColor: Get.isDarkMode ? ColorManager.pinkColor : ColorManager.mainColor,
              dotColor: Colors.black,
            ),
          ),
        ),
        Positioned(
          bottom: 30,
          right: 30,
          child: Container(
            height: 200,
            width: 50,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
              borderRadius: BorderRadius.circular(30),
            ),
            child: ListView.separated(
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      currentColor = index;
                    });
                  },
                  child: ColorPicker(
                    color: colorSelected[index],
                    outerBorder: currentColor == index,
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 3),
              itemCount: colorSelected.length,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(
            top: 20,
            left: 25,
            right: 25,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Get.isDarkMode
                        ? ColorManager.pinkColor.withOpacity(0.8)
                        : ColorManager.mainColor.withOpacity(0.8),
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Get.isDarkMode ? Colors.black : Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
              // Obx(
              //   () => Badge(
              //     position: BadgePosition.topEnd(top: -10, end: -10),
              //     animationDuration: const Duration(milliseconds: 300),
              //     animationType: BadgeAnimationType.slide,
              //     badgeContent: Text(
              //       cartController.quantity().toString(),
              //       style: const TextStyle(color: Colors.white),
              //     ),
              //     child: InkWell(
              //       onTap: () {
              //         Get.toNamed(Routes.cartScreen);
              //       },
              //       child: Container(
              //         padding: const EdgeInsets.all(8),
              //         decoration: BoxDecoration(
              //           color: Get.isDarkMode
              //               ? pinkClr.withOpacity(0.8)
              //               : mainColor.withOpacity(0.8),
              //           shape: BoxShape.circle,
              //         ),
              //         child: Icon(
              //           Icons.shopping_cart,
              //           color: Get.isDarkMode ? Colors.black : Colors.white,
              //           size: 20,
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ],
    );
  }
}
