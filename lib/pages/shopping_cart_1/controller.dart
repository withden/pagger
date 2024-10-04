import 'package:get/get.dart';

import 'api.dart';
import 'model.dart';

class ShoppingCartController extends GetxController {
  // Fetched from API
  List<Cart> carts = [];

  double order = 0;
  double tax = 20;
  double offer = 40;
  double total = 0;

  @override
  void onInit() {
    CartAPI.getCarts().then((value) {
      carts = value;
      calculateBilling();
      update();
    });
    super.onInit();
  }

  // Quantity Increment
  void increaseQuantity(Cart cart) {
    if (!cart.canIncrease()) return;
    cart.quantity++;
    calculateBilling();
    update();
  }

  // Quantity Decrement
  void decreaseQuantity(Cart cart) {
    if (cart.canRemove()) {
      carts.remove(cart);
    } else if (cart.canDecrease()) {
      cart.quantity--;
    }

    calculateBilling();
    update();
  }

  // All Cart Price Calculation
  void calculateBilling() {
    order = 0;
    for (final Cart cart in carts) {
      order += cart.price * cart.quantity;
    }
    total = order + tax - offer;
  }

  void goToCheckout() {
    // Go to Checkout
  }

  void goBack() {
    Get.back();
  }

  void goToProductDetail() {
    // Go to Product Detail
  }
}
