import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'api.dart';
import 'model.dart';

class ShoppingHomeController extends GetxController {
  // Fetched from api
  List<Product> products = [];
  List<Category> categories = [];

  // Filtered product list
  List<Product> filteredProducts = [];

  // Selected category id
  int? selectedCategoryId;

  @override
  void onInit() {
    ProductAPI.getProducts().then((value) {
      products = value;
      filteredProducts = value;
      update();
    });
    CategoryAPI.getCategories().then((value) {
      categories = value;
      update();
    });
    super.onInit();
  }

  void selectCategory(Category? category) {
    selectedCategoryId = category?.id;

    if (selectedCategoryId == null) {
      filteredProducts = products;
    } else {
      filteredProducts = products.where((product) => product.categoryId == selectedCategoryId).toList();
    }

    update();
  }

  void toggleFavoriteProduct(Product product) {
    product.isFavorite = !product.isFavorite;
    update();
  }

  double productGridAspectRatio() {
    final double width = MediaQuery.of(Get.context!).size.width;
    const int extraSpacing = 60;
    const int gridCount = 2;
    const int fixHeight = 258;
    return ((width - extraSpacing) / gridCount) / fixHeight;
  }

  // Navigation

  void viewCoupon() {
    // View Coupon
  }

  void viewProduct(Product product) {
    // View Product
  }

  void goBack() {
    Get.back();
  }
}
