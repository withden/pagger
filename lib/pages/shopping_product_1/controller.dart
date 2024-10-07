// Base
import 'dart:ui';

import 'package:get/get.dart';

class ShoppingProductController extends GetxController {
  bool isFavourite = false;

  // Quantity
  int quantity = 3;

  // Product Images
  List<String> productImages = [
    "assets/images/shopping/products/products_1.jpg",
    "assets/images/shopping/products/products_4.jpg",
    "assets/images/shopping/products/products_6.jpg",
    "assets/images/shopping/products/products_7.jpg",
  ];

  // Default Product Image
  late String selectImage = productImages[0];

  // Sizes
  List<String> sizes = ['S', 'M', 'L', 'XL', 'XXL'];

  // Default Size Select Index
  late String selectedSize = sizes[0];

  // Colors Variation
  List<Color> colorVariations = [const Color(0xff800080), const Color(0xff008000), const Color(0xff808000), const Color(0xffFFA500), const Color(0xff4566e8)];

  // Select Color
  late Color selectedColor = colorVariations[0];

  void onSelectColorVariation(Color color) {
    selectedColor = color;
    update();
  }

  void onSelectSize(String size) {
    selectedSize = size;
    update();
  }

  void onChangeFavouriteToggle() {
    isFavourite = !isFavourite;
    update();
  }

  void onChangeSelectImage(String image) {
    selectImage = image;
    update();
  }

  void quantityIncrement() {
    if (quantity < 8) quantity++;
    update();
  }

  void quantityDecrement() {
    if (quantity > 1) quantity--;
    update();
  }

  void goBack() {
    Get.back();
  }

  void addToCart() {
    // Navigation to:
  }

  void buyNow() {
    // Navigation to:
  }
}
