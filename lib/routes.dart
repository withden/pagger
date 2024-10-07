import 'package:get/get.dart';

import 'pages/shopping_cart_1/view.dart' as shopping_cart_1;
import 'pages/shopping_checkout_1/view.dart' as shopping_checkout_1;
import 'pages/shopping_explore_1/view.dart' as shopping_search_1;
import 'pages/shopping_home_1/view.dart' as shopping_home_1;
import 'pages/shopping_orders_1/view.dart' as shopping_orders_1;
import 'pages/shopping_product_1/view.dart' as shopping_product_1;
import 'pages/shopping_profile_1/view.dart' as shopping_profile_1;

List<GetPage> getRoutes() {
  return [
    GetPage(name: '/shopping_home_1', page: () => const shopping_home_1.ShoppingHomeView()),
    GetPage(name: '/shopping_explore_1', page: () => const shopping_search_1.ShoppingExploreView()),
    GetPage(name: '/shopping_product_1', page: () => const shopping_product_1.ShoppingProductView()),
    GetPage(name: '/shopping_cart_1', page: () => const shopping_cart_1.ShoppingCartView()),
    GetPage(name: '/shopping_checkout_1', page: () => const shopping_checkout_1.ShoppingCheckoutView()),
    GetPage(name: '/shopping_orders_1', page: () => const shopping_orders_1.ShoppingOrdersView()),
    GetPage(name: '/shopping_profile_1', page: () => const shopping_profile_1.ShoppingProfileView()),
  ];
}
