import 'package:get/instance_manager.dart';
import 'package:shoply/logic/controllers/cart_controller.dart';
import 'package:shoply/logic/controllers/category_controller.dart';
import 'package:shoply/logic/controllers/product_controller.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProductController());
    Get.lazyPut(() => CartController());
    Get.put(CategoryController());
  }
}
