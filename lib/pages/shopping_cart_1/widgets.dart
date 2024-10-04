import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:pagger/library/library.dart';

import 'controller.dart';
import 'model.dart';
import 'style.dart';

class DecrementButton extends StatelessWidget {
  DecrementButton({super.key, required this.cart});

  final Cart cart;
  final ThemeData theme = Style.theme();
  final ShoppingCartController controller = Get.put(ShoppingCartController());

  @override
  Widget build(BuildContext context) {
    final bool canRemove = cart.canRemove();
    return IconButton(
        padding: EdgeInsets.zero,
        visualDensity: VisualDensity.compact,
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(canRemove ? theme.colorScheme.error : theme.colorScheme.primary),
          overlayColor: WidgetStatePropertyAll(canRemove ? theme.colorScheme.onError.withAlpha(60) : theme.colorScheme.onPrimary.withAlpha(60)),
        ),
        onPressed: () => controller.decreaseQuantity(cart),
        icon: Icon(canRemove ? Symbols.delete_rounded : Symbols.remove_rounded,
            color: canRemove ? theme.colorScheme.onError : theme.colorScheme.onPrimary, size: 14));
  }
}

class IncrementButton extends StatelessWidget {
  IncrementButton({super.key, required this.cart});

  final Cart cart;
  final ThemeData theme = Style.theme();
  final ShoppingCartController controller = Get.put(ShoppingCartController());

  @override
  Widget build(BuildContext context) {
    final bool canIncrease = cart.canIncrease();
    return IconButton(
        padding: EdgeInsets.zero,
        visualDensity: VisualDensity.compact,
        disabledColor: theme.disabledColor,
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(canIncrease ? theme.colorScheme.primary : theme.disabledColor),
          overlayColor: WidgetStatePropertyAll(canIncrease ? theme.colorScheme.onPrimary.withAlpha(28) : theme.colorScheme.onSurface.withAlpha(28)),
        ),
        onPressed: canIncrease ? () => controller.increaseQuantity(cart) : null,
        icon: Icon(Symbols.add_rounded, color: canIncrease ? theme.colorScheme.onPrimary : theme.colorScheme.onSurface, size: 14));
  }
}

class CartWidget extends StatelessWidget {
  CartWidget({super.key, required this.cart});

  final Cart cart;
  final ThemeData theme = Style.theme();
  final ShoppingCartController controller = Get.put(ShoppingCartController());

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => controller.goToProductDetail(),
      borderRadius: BorderRadius.circular(12),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              cart.image,
              fit: BoxFit.cover,
              height: 140,
              width: 100,
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              height: 140,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(cart.name, style: theme.textTheme.titleSmall),
                  Text("₹${cart.price}", style: theme.textTheme.labelLarge),
                  Text(cart.description, maxLines: 2, style: theme.textTheme.bodySmall?.copyWith(height: 1.2)),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      DecrementButton(cart: cart),
                      SizedBox(width: 28, child: Center(child: Text('${cart.quantity}', style: theme.textTheme.bodyLarge))),
                      IncrementButton(cart: cart),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CartList extends StatelessWidget {
  CartList({super.key});

  final ThemeData theme = Style.theme();
  final ShoppingCartController controller = Get.put(ShoppingCartController());

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: controller.carts.length,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      itemBuilder: (context, index) {
        return CartWidget(cart: controller.carts[index]);
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: 20);
      },
    );
  }
}

class PaymentSummeryCard extends StatelessWidget {
  PaymentSummeryCard({super.key});

  final ThemeData theme = Style.theme();
  final ShoppingCartController controller = Get.put(ShoppingCartController());

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                const Icon(Symbols.payments_rounded, size: 22),
                const SizedBox(width: 12),
                Text("Payment Summary", style: theme.textTheme.titleSmall),
              ],
            ),
          ),
          const Divider(height: 0),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Wrap(
              runSpacing: 12,
              children: [
                Row(children: [
                  const Icon(
                    Symbols.checklist_rounded,
                    size: 20,
                  ),
                  const SizedBox(width: 12),
                  const Text("Sub Total"),
                  const Spacer(),
                  Text("\$${ParseHelper.numberAsCurrency(controller.order)}")
                ]),
                const Row(children: [Icon(Symbols.local_shipping, size: 20), SizedBox(width: 12), Text("Delivery"), Spacer(), Text("Free")]),
                Row(children: [
                  Icon(Symbols.text_snippet_rounded, size: 20, color: theme.colorScheme.error),
                  const SizedBox(width: 12),
                  Text("Tax", style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.error)),
                  const Spacer(),
                  Text("+ \$${ParseHelper.numberAsCurrency(controller.tax)}", style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.error))
                ]),
                Row(children: [
                  const Icon(Symbols.local_offer_rounded, size: 20, color: Colors.green),
                  const SizedBox(width: 12),
                  Text("Offer", style: theme.textTheme.bodyMedium?.copyWith(color: Colors.green)),
                  const Spacer(),
                  Text("- \$${ParseHelper.numberAsCurrency(controller.offer)}", style: theme.textTheme.bodyMedium?.copyWith(color: Colors.green))
                ]),
              ],
            ),
          ),
          const Divider(height: 0),
          Padding(
              padding: const EdgeInsets.all(16),
              child: Row(children: [
                const Icon(Symbols.paid_rounded, size: 20),
                const SizedBox(width: 12),
                Text("Total", style: theme.textTheme.titleSmall),
                const Spacer(),
                Text("\$${ParseHelper.numberAsCurrency(controller.total)}", style: theme.textTheme.titleSmall)
              ]))
        ],
      ),
    );
  }
}
