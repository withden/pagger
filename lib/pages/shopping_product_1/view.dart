// Base
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

// Need for specific page
import 'controller.dart';
import 'style.dart';
import 'widgets.dart';

class ShoppingProductView extends StatefulWidget {
  const ShoppingProductView({super.key});

  @override
  State<ShoppingProductView> createState() => _ShoppingProductViewState();
}

class _ShoppingProductViewState extends State<ShoppingProductView> {
  final ThemeData theme = Style.theme();
  ShoppingProductController controller = Get.put(ShoppingProductController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: controller,
      tag: 'shopping_product_1',
      builder: (controller) {
        return Theme(
          data: theme,
          child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(Symbols.chevron_left_rounded),
                onPressed: controller.goBack,
              ),
              title: Text("UniQ Dress", style: theme.textTheme.titleMedium),
              actions: [
                IconButton(
                    onPressed: controller.toggleFavorite,
                    icon: Icon(Symbols.favorite_rounded, fill: controller.isFavourite ? 1 : 0, color: controller.isFavourite ? Colors.red : null, size: 20)),
                const SizedBox(
                  width: 8,
                )
              ],
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            floatingActionButton: Padding(
              padding: const EdgeInsets.only(bottom: 12, right: 16, left: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: FilledButton(
                        onPressed: () => controller.addToCart(),
                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(theme.colorScheme.secondaryContainer),
                          shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Symbols.add_shopping_cart_rounded, color: theme.colorScheme.onSecondaryContainer, size: 20),
                            const SizedBox(width: 12),
                            Text("Add to cart", style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSecondaryContainer))
                          ],
                        )),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: FilledButton(
                        onPressed: () => controller.buyNow(),
                        style: ButtonStyle(
                          shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Symbols.shopping_bag_rounded, color: theme.colorScheme.onPrimary, size: 20),
                            const SizedBox(width: 12),
                            Text("Buy Now", style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onPrimary))
                          ],
                        )),
                  ),
                ],
              ),
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 64, left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductImage(),
                  const SizedBox(height: 16),
                  Images(),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("\$99.99", style: theme.textTheme.titleLarge),
                      Row(
                        children: [
                          IconButton.filled(
                              onPressed: () => controller.quantityIncrement(),
                              visualDensity: VisualDensity.compact,
                              icon: const Icon(Symbols.add_rounded, size: 16)),
                          const SizedBox(width: 8),
                          Text(controller.quantity.toString(), style: theme.textTheme.bodyMedium),
                          const SizedBox(width: 8),
                          IconButton.filled(
                              onPressed: () => controller.quantityDecrement(),
                              visualDensity: VisualDensity.compact,
                              icon: const Icon(Symbols.remove_rounded, size: 16)),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text("UniQ Dress", style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600, height: .8)),
                  const SizedBox(height: 16),
                  Text("Size Chart", style: theme.textTheme.titleSmall),
                  const SizedBox(height: 12),
                  SizeChart(),
                  const SizedBox(height: 16),
                  Text("Colors", style: theme.textTheme.titleSmall),
                  const SizedBox(height: 12),
                  ColorList(),
                  const SizedBox(height: 16),
                  Text("Description", style: theme.textTheme.titleSmall),
                  const SizedBox(height: 4),
                  Text("Case size: 44mm; Band size: 22mm; quartz movement with 3-hand analog display; mineral crystal face", style: theme.textTheme.bodySmall),
                  const SizedBox(height: 4),
                  Text("Black plated stainless steel bracelet with 2 pusher foldover clasp closure; interchangeable with Fossil 22mm watch straps",
                      style: theme.textTheme.bodySmall),
                  const SizedBox(height: 4),
                  Text(
                      "Water resistant to 165 feet (50 M): suitable for short periods of exposure to water i.e washing hands or showering/bathing. Not suitable for recreational swimming, diving or snorkeling. Circumference - 200+/- 5MM",
                      style: theme.textTheme.bodySmall),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
