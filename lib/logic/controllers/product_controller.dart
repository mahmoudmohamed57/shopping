import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shoply/model/product_models.dart';
import 'package:shoply/services/product_services.dart';
import 'package:shoply/utils/storage_manager.dart';

class ProductController extends GetxController {
  var productList = <ProductModels>[].obs;
  var favouritesList = <ProductModels>[].obs;
  var isLoading = true.obs;
  final AppStorage _appStorage = AppStorage(GetStorage());
  var searchList = <ProductModels>[].obs;
  TextEditingController searchTextController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    getProducts();
    List storedFavourites = _appStorage.getFavoritesFromBox();
    if (storedFavourites.isNotEmpty) {
      favouritesList = storedFavourites
          .map((element) => ProductModels.fromJson(element))
          .toList()
          .obs;
    }
  }

  void getProducts() async {
    var products = await ProductServices.getProduct();
    try {
      isLoading(true);
      if (products.isNotEmpty) {
        productList.addAll(products);
      }
    } finally {
      isLoading(false);
    }
  }

  void manageFavourites(int productId) async {
    var existingIndex =
        favouritesList.indexWhere((element) => element.id == productId);
    if (existingIndex >= 0) {
      _appStorage.removeFavoritesFromBox();
      favouritesList.removeAt(existingIndex);
      _appStorage.setFavoritesInBox(favouritesList);
    } else {
      favouritesList
          .add(productList.firstWhere((element) => element.id == productId));
      _appStorage.setFavoritesInBox(favouritesList);
    }
  }

  bool isFavourite(int productId) {
    return favouritesList.any((element) => element.id == productId);
  }

  void addSearchToList(String searchName) {
    searchName = searchName.toLowerCase();
    searchList.value = productList.where((search) {
      var searchTitle = search.title.toLowerCase();
      var searchPrice = search.price.toString().toLowerCase();
      return searchTitle.contains(searchName) ||
          searchPrice.toString().contains(searchName);
    }).toList();
    update();
  }

  void clearSearch() {
    searchTextController.clear();
    addSearchToList("");
  }
}
