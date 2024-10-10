import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

import 'controller.dart';
import 'style.dart';
import 'widgets.dart';

class ShoppingHomeView extends StatefulWidget {
  const ShoppingHomeView({super.key});

  @override
  State<ShoppingHomeView> createState() => _ShoppingHomeViewState();
}

class _ShoppingHomeViewState extends State<ShoppingHomeView> {
  final ThemeData theme = Style.theme();
  final ShoppingHomeController controller = Get.put(ShoppingHomeController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: controller,
      tag: 'shopping_home_1',
      builder: (controller) {
        return Theme(
          data: theme,
          child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(Symbols.chevron_left_rounded),
                onPressed: controller.goBack,
              ),
              title: Text("Shopping", style: theme.textTheme.titleMedium),
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AdPosterCard(),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text("Categories", style: theme.textTheme.titleSmall),
                  ),
                  const SizedBox(height: 12),
                  CategoryList(),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text("New Products", style: theme.textTheme.titleSmall),
                  ),
                  const SizedBox(height: 12),
                  ProductGrid(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
