// Base
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

// Need for specific page
import 'controller.dart';
import 'style.dart';

class ShoppingCheckoutView extends StatefulWidget {
  const ShoppingCheckoutView({super.key});

  @override
  State<ShoppingCheckoutView> createState() => _ShoppingCheckoutViewState();
}

class _ShoppingCheckoutViewState extends State<ShoppingCheckoutView> {
  final ThemeData theme = Style.theme();
  ShoppingCheckoutController controller = Get.put(ShoppingCheckoutController());

  late final OutlineInputBorder outlineInputBorder =
      OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide(color: theme.colorScheme.surfaceContainerHighest, width: 1.3));

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: controller,
      tag: 'shopping_checkout_1',
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Symbols.chevron_left_rounded),
              onPressed: controller.goBack,
            ),
            title: Text("Checkout", style: theme.textTheme.titleMedium),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          body: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                'assets/images/shopping/products/products_1.jpg',
                                fit: BoxFit.cover,
                                height: 100,
                                width: 70,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: SizedBox(
                                height: 95,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Floral Dress", style: theme.textTheme.titleMedium),
                                    Text("\$ 49.99", style: theme.textTheme.titleSmall),
                                    Text(
                                        "A charming floral dress perfect for spring and summer. Featuring a lightweight fabric and a flattering fit, this dress is ideal for casual outings or special occasions.",
                                        style: theme.textTheme.bodySmall?.copyWith(height: 1.15),
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                'assets/images/shopping/products/products_2.jpg',
                                fit: BoxFit.cover,
                                height: 100,
                                width: 70,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: SizedBox(
                                height: 95,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Casual Jacket", style: theme.textTheme.titleMedium),
                                    Text("\$ 19.99", style: theme.textTheme.titleSmall),
                                    Text(
                                        "A versatile casual jacket designed for everyday wear. Made from durable material, it offers a comfortable fit and is perfect for layering over your favorite outfits.",
                                        style: theme.textTheme.bodySmall?.copyWith(height: 1.15),
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 20),
                        const Divider(height: 0),
                        const SizedBox(height: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Delivery to", style: theme.textTheme.titleMedium?.copyWith(height: 1.1)),
                            const SizedBox(height: 4),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Saffet Street 13", style: theme.textTheme.bodyMedium?.copyWith(height: 1.1)),
                                    const SizedBox(height: 6),
                                    Text("1276 Pluto. Cyber Arm", style: theme.textTheme.bodySmall?.copyWith(height: 1)),
                                  ],
                                ),
                                TextButton(
                                  onPressed: () => controller.changeAddress(),
                                  style: const ButtonStyle(
                                      visualDensity: VisualDensity.compact,
                                      minimumSize: WidgetStatePropertyAll(Size(120, 48)),
                                      maximumSize: WidgetStatePropertyAll(Size(120, 48))),
                                  child: Text("Changer Address", style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.primary)),
                                )
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        const Divider(height: 0),
                        const SizedBox(height: 20),
                        Text("Enter Voucher Code", style: theme.textTheme.titleMedium?.copyWith(height: 1.1)),
                        const SizedBox(height: 20),
                        TextField(
                          style: theme.textTheme.bodyMedium,
                          maxLength: 8,
                          controller: TextEditingController(text: 'GH56SU6S'),
                          decoration: InputDecoration(
                              counterText: '',
                              border: outlineInputBorder,
                              enabledBorder: outlineInputBorder,
                              focusedErrorBorder: outlineInputBorder,
                              focusedBorder: outlineInputBorder,
                              errorBorder: outlineInputBorder,
                              disabledBorder: outlineInputBorder,
                              hintText: "G6JHX64",
                              hintStyle: theme.textTheme.bodyMedium,
                              isCollapsed: true,
                              isDense: true,
                              contentPadding: const EdgeInsets.all(12)),
                        ),
                        const SizedBox(height: 20),
                        Card(
                          margin: EdgeInsets.zero,
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Payment Summary", style: theme.textTheme.titleMedium?.copyWith(height: 1.1)),
                                const SizedBox(height: 12),
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Sub total", style: theme.textTheme.bodyMedium),
                                        Text("\$69.98", style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600)),
                                      ],
                                    ),
                                    const SizedBox(height: 12),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Free And Delivery", style: theme.textTheme.bodyMedium),
                                        Text("\$10", style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600)),
                                      ],
                                    ),
                                    const SizedBox(height: 12),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Total", style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600)),
                                        Text("\$79.98", style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600)),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.zero,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Total Pay', style: theme.textTheme.bodySmall),
                          Text('\$79.98', style: theme.textTheme.titleMedium),
                        ],
                      ),
                      FilledButton(
                        onPressed: controller.next,
                        child: Text("Next", style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onPrimary)),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
