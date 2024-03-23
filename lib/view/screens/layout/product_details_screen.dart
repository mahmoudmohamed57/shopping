import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoply/model/product_models.dart';
import 'package:shoply/view/widgets/product/add_cart.dart';
import 'package:shoply/view/widgets/product/clothes_info.dart';
import 'package:shoply/view/widgets/product/image_sliders.dart';
import 'package:shoply/view/widgets/product/size_list.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductModels productModels;

  const ProductDetailsScreen({required this.productModels, super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.colorScheme.background,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageSliders(imageUrl: productModels.image),
              ClothesInfo(
                title: productModels.title,
                productId: productModels.id,
                rate: productModels.rating.rate,
                description: productModels.description,
              ),
              const SizeList(),
              AddCart(price: productModels.price, productModels: productModels),
            ],
          ),
        ),
      ),
    );
  }
}
