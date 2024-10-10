// Base
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

// Need for specific page
import 'controller.dart';
import 'model.dart';
import 'style.dart';

class SearchTextField extends StatelessWidget {
  SearchTextField({super.key});

  final ThemeData theme = Style.theme();
  final ShoppingExploreController controller = Get.put(ShoppingExploreController());

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller.searchTextEditingController,
      onChanged: controller.searchProduct,
      autofocus: true,
      decoration: InputDecoration(
        hintText: "Search across products",
        hintStyle: theme.textTheme.bodyMedium,
        border: InputBorder.none,
        suffixIcon: IconButton(
          visualDensity: VisualDensity.compact,
          icon: const Icon(Symbols.close_rounded, size: 18),
          onPressed: controller.clearSearchField,
        ),
        prefixIcon:
            IconButton(onPressed: controller.toggleShowTextField, visualDensity: VisualDensity.compact, icon: const Icon(Symbols.arrow_back_rounded, size: 18)),
        contentPadding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
      ),
    );
  }
}

class CategoryWidget extends StatelessWidget {
  CategoryWidget({super.key, required this.category});

  final Category category;
  final ThemeData theme = Style.theme();
  final ShoppingExploreController controller = Get.put(ShoppingExploreController());

  @override
  Widget build(BuildContext context) {
    final bool isSelected = controller.selectedCategoryId == category.id;
    return Column(
      children: [
        InkWell(
            onTap: () => controller.selectCategory(category),
            splashColor: theme.colorScheme.onSurface.withOpacity(0.1),
            customBorder: const CircleBorder(),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected ? theme.colorScheme.onSurface.withOpacity(0.1) : theme.colorScheme.surfaceContainer,
              ),
              child: Image.asset(category.image, height: 32, fit: BoxFit.cover),
            )),
        const SizedBox(height: 4),
        Text(category.name, style: theme.textTheme.bodySmall?.copyWith(fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500))
      ],
    );
  }
}

class CategoryList extends StatelessWidget {
  CategoryList({super.key});

  final ThemeData theme = Style.theme();
  final ShoppingExploreController controller = Get.put(ShoppingExploreController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 84,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              children: [
                InkWell(
                    onTap: () => controller.selectCategory(null),
                    splashColor: theme.colorScheme.onSurface.withOpacity(0.1),
                    customBorder: const CircleBorder(),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: controller.selectedCategoryId == null ? theme.colorScheme.onSurface.withOpacity(0.1) : theme.colorScheme.surfaceContainer),
                      child: Image.asset("assets/images/shopping/categories/all.png", height: 32, fit: BoxFit.cover),
                    )),
                const SizedBox(height: 4),
                Text("All", style: theme.textTheme.bodySmall?.copyWith(fontWeight: controller.selectedCategoryId == null ? FontWeight.w600 : FontWeight.w500))
              ],
            ),
            const SizedBox(width: 12),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              scrollDirection: Axis.horizontal,
              itemCount: controller.categories.length,
              itemBuilder: (_, index) {
                return CategoryWidget(category: controller.categories[index]);
              },
              separatorBuilder: (BuildContext _, int index) {
                return const SizedBox(width: 12);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ProductWidget extends StatelessWidget {
  ProductWidget({super.key, required this.product});

  final Product product;
  final ThemeData theme = Style.theme();
  final ShoppingExploreController controller = Get.put(ShoppingExploreController());

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () => controller.viewProduct(product),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(product.image, fit: BoxFit.cover, height: 200),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.name, style: theme.textTheme.titleSmall),
                    const SizedBox(height: 2),
                    Text(
                      "\$${product.price}",
                      style: theme.textTheme.bodySmall,
                    ),
                  ],
                ),
                IconButton(
                    onPressed: () => controller.toggleFavoriteProduct(product),
                    padding: EdgeInsets.zero,
                    highlightColor: theme.colorScheme.error.withOpacity(0.1),
                    visualDensity: VisualDensity.compact,
                    icon: Icon(
                      Symbols.favorite_border_rounded,
                      size: 20,
                      fill: product.isFavorite ? 1 : 0,
                      color: product.isFavorite ? theme.colorScheme.error : null,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProductGrid extends StatelessWidget {
  ProductGrid({super.key});

  final ThemeData theme = Style.theme();
  final ShoppingExploreController controller = Get.put(ShoppingExploreController());

  @override
  Widget build(BuildContext context) {
    return controller.filteredProducts.isEmpty
        ? Center(
            child: Image.asset('assets/images/empty.png', height: MediaQuery.of(context).size.height / 3),
          )
        : GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 12, crossAxisSpacing: 16, childAspectRatio: controller.findAspectRatio()),
            shrinkWrap: true,
            itemCount: controller.filteredProducts.length,
            itemBuilder: (_, index) {
              return ProductWidget(product: controller.filteredProducts[index]);
            });
  }
}
