// Base
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

// Need for specific page
import 'controller.dart';
import 'style.dart';
import 'widgets.dart';

class ShoppingExploreView extends StatefulWidget {
  const ShoppingExploreView({super.key});

  @override
  State<ShoppingExploreView> createState() => _ShoppingExploreViewState();
}

class _ShoppingExploreViewState extends State<ShoppingExploreView> {
  final ThemeData theme = Style.theme();
  ShoppingExploreController controller = Get.put(ShoppingExploreController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: controller,
      tag: 'shopping_explore_1',
      builder: (controller) {
        return Theme(
          data: theme,
          child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              leading: controller.isSearchTextFieldShowing
                  ? null
                  : IconButton(
                      icon: const Icon(
                        Symbols.chevron_left_rounded,
                      ),
                      onPressed: controller.isSearchTextFieldShowing ? controller.toggleShowTextField : controller.goBack),
              title: controller.isSearchTextFieldShowing ? SearchTextField() : Text("Explore", style: theme.textTheme.titleMedium),
              actions: [
                if (!controller.isSearchTextFieldShowing)
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: IconButton(onPressed: () => controller.toggleShowTextField(), icon: const Icon(Symbols.search_rounded, size: 20)),
                  )
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (!controller.isSearchTextFieldShowing) CategoryList(),
                  if (controller.isSearchTextFieldShowing)
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                      child: Text("You're results are...", style: theme.textTheme.titleSmall),
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
