// Base
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

// Need for specific page
import 'controller.dart';
import 'style.dart';

class ImageSelectionBottomSheet extends StatelessWidget {
  ImageSelectionBottomSheet({super.key});

  final ThemeData theme = Style.theme();
  final ShoppingProfileController controller = Get.put(ShoppingProfileController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: InkWell(
              onTap: () => controller.getImageFromCamera(),
              borderRadius: BorderRadius.circular(8),
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: theme.colorScheme.surfaceContainer,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Symbols.camera_alt_rounded, color: theme.colorScheme.onSurface),
                    const SizedBox(height: 12),
                    Text("Camera", style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurface)),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: InkWell(
              onTap: () => controller.getImageFromGallery(),
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: theme.colorScheme.surfaceContainer,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Symbols.image_rounded, color: theme.colorScheme.onSurface),
                    const SizedBox(height: 12),
                    Text("Gallery", style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurface)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Future<void> showImageSelectionBottomSheet(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    clipBehavior: Clip.antiAliasWithSaveLayer,
    showDragHandle: true,
    builder: (BuildContext context) {
      return ImageSelectionBottomSheet();
    },
  );
}
