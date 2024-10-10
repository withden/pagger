// Base
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Need for specific page
import 'api.dart';
import 'model.dart';

class ShoppingExploreController extends GetxController {
  // Fetched from api
  List<Product> products = [];
  List<Category> categories = [];

  // Filtered And Search product list
  List<Product> filteredProducts = [];

  // Selected category id
  int? selectedCategoryId;

  // Show TextField
  bool isSearchTextFieldShowing = false;

  // Search Controller
  TextEditingController searchTextEditingController = TextEditingController();

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

  void toggleShowTextField() {
    isSearchTextFieldShowing = !isSearchTextFieldShowing;
    searchTextEditingController.clear();
    filteredProducts = products;
    update();
  }

  void clearSearchField() {
    if (searchTextEditingController.value.text.isEmpty) {
      isSearchTextFieldShowing = !isSearchTextFieldShowing;
      update();
      return;
    }
    searchTextEditingController.clear();
    filteredProducts = products;
    update();
  }

  void selectCategory(Category? category) {
    final int? id = category?.id;
    selectedCategoryId = id;
    if (id == null) {
      filteredProducts = products;
    } else {
      filteredProducts = products.where((product) => product.categoryId == id).toList();
    }
    update();
  }

  void searchProduct(String query) {
    filteredProducts = products.where((product) {
      final productName = product.name.toLowerCase();
      return productName.contains(query.toLowerCase());
    }).toList();
    update();
  }

  void viewProduct(Product product) {
    // View Product
  }

  void toggleFavoriteProduct(Product product) {
    product.isFavorite = !product.isFavorite;
    update();
  }

  double findAspectRatio() {
    final width = MediaQuery.of(Get.context!).size.width;
    const extraSpacing = 16 * 3;
    const gridCount = 2;
    const fixHeight = 258;
    return ((width - extraSpacing) / gridCount) / fixHeight;
  }

  void goBack() {
    Get.back();
  }
}
