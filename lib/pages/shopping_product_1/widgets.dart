// Base
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_symbols_icons/symbols.dart';

// Need for specific page
import 'controller.dart';
import 'style.dart';

class ProductImage extends StatelessWidget {
  ProductImage({super.key});

  final ThemeData theme = Style.theme();
  final ShoppingProductController controller = Get.put(ShoppingProductController());

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(controller.selectImage, fit: BoxFit.cover, width: double.infinity, height: 250),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
          decoration: BoxDecoration(
              color: theme.colorScheme.tertiary, borderRadius: const BorderRadius.only(topLeft: Radius.circular(8), bottomRight: Radius.circular(12))),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Text("Sale", style: theme.textTheme.bodyMedium!.copyWith(color: theme.colorScheme.onTertiary)),
        )
      ],
    );
  }
}

class Images extends StatelessWidget {
  Images({super.key});

  final ThemeData theme = Style.theme();
  final ShoppingProductController controller = Get.put(ShoppingProductController());

  @override
  Widget build(BuildContext context) {
    return Wrap(
        runSpacing: 16,
        spacing: 16,
        children: controller.productImages
            .map((image) => InkWell(
                  onTap: () => controller.onChangeSelectImage(image),
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    decoration: BoxDecoration(
                        border: image == controller.selectImage
                            ? Border.all(width: 1.5, strokeAlign: BorderSide.strokeAlignOutside, color: theme.colorScheme.primary)
                            : null,
                        borderRadius: BorderRadius.circular(8)),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Image.asset(image, fit: BoxFit.cover, height: 48, width: 48),
                  ),
                ))
            .toList());
  }
}

class SizeChart extends StatelessWidget {
  SizeChart({super.key});

  final ThemeData theme = Style.theme();
  final ShoppingProductController controller = Get.put(ShoppingProductController());

  @override
  Widget build(BuildContext context) {
    return Wrap(
        spacing: 12,
        runSpacing: 12,
        children: controller.sizes.map((size) {
          final bool isSelected = controller.selectedSize == size;
          return InkWell(
            onTap: () => controller.onSelectSize(size),
            borderRadius: BorderRadius.circular(8),
            child: Container(
              height: 32,
              width: 32,
              decoration: BoxDecoration(
                color: isSelected ? theme.colorScheme.secondary : theme.colorScheme.surfaceContainer,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  size,
                  style: theme.textTheme.bodySmall!.copyWith(
                      fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                      color: isSelected ? theme.colorScheme.onSecondary : theme.colorScheme.onSurface),
                ),
              ),
            ),
          );
        }).toList());
  }
}

class ColorList extends StatelessWidget {
  ColorList({super.key});

  final ThemeData theme = Style.theme();
  final ShoppingProductController controller = Get.put(ShoppingProductController());

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: controller.colorVariations.map((color) {
        final bool isSelect = controller.selectedColor == color;
        return InkWell(
          onTap: () => controller.onSelectColorVariation(color),
          child: Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(8)),
            child: isSelect ? const Icon(Symbols.check_rounded, size: 20, color: Colors.white) : null,
          ),
        );
      }).toList(),
    );
  }
}
