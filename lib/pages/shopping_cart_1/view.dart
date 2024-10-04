import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

import 'controller.dart';
import 'style.dart';
import 'widgets.dart';

class ShoppingCartView extends StatefulWidget {
  const ShoppingCartView({super.key});

  @override
  State<ShoppingCartView> createState() => _ShoppingCartViewState();
}

class _ShoppingCartViewState extends State<ShoppingCartView> {
  final ThemeData theme = Style.theme();
  final ShoppingCartController controller = Get.put(ShoppingCartController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: controller,
      tag: 'shopping_cart_1',
      builder: (controller) {
        return Theme(
          data: theme,
          child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  icon: const Icon(
                    Symbols.chevron_left_rounded,
                  ),
                  onPressed: controller.goBack),
              title: Text("Shopping Cart", style: theme.textTheme.titleMedium),
            ),
            body: controller.carts.isNotEmpty
                ? SingleChildScrollView(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Column(
                      children: [
                        CartList(),
                        const SizedBox(height: 20),
                        PaymentSummeryCard(),
                        const SizedBox(height: 20),
                        FilledButton.icon(
                          onPressed: controller.goToCheckout,
                          style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(theme.colorScheme.primary)),
                          icon: const Icon(Symbols.shopping_cart_checkout_rounded, size: 18),
                          label: Text(
                            "Checkout",
                            style: theme.textTheme.labelLarge?.copyWith(color: theme.colorScheme.onPrimary),
                          ),
                        )
                      ],
                    ),
                  )
                : Center(child: Image.asset("assets/images/empty.png", height: 300)),
          ),
        );
      },
    );
  }
}
