// Base
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

// Need for specific page
import 'controller.dart';
import 'style.dart';
import 'widgets.dart';

class ShoppingProfileView extends StatefulWidget {
  const ShoppingProfileView({super.key});

  @override
  State<ShoppingProfileView> createState() => _ShoppingProfileViewState();
}

class _ShoppingProfileViewState extends State<ShoppingProfileView> {
  final ThemeData theme = Style.theme();

  ShoppingProfileController controller = Get.put(ShoppingProfileController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: controller,
      tag: 'shopping_profile_1',
      builder: (controller) {
        return Theme(
          data: theme,
          child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(
                  Symbols.chevron_left_rounded,
                ),
                onPressed: controller.goBack,
              ),
              title: Text("Profile", style: theme.textTheme.titleMedium),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Center(
                        child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        ClipOval(
                          child: controller.pickImage == null
                              ? Image.asset('assets/avatars/avatar-1.jpg', fit: BoxFit.cover, height: 100, width: 100)
                              : Image.file(controller.pickImage!, fit: BoxFit.cover, height: 100, width: 100),
                        ),
                        Positioned(
                          bottom: -4,
                          right: -4,
                          child: IconButton(
                            onPressed: () => showImageSelectionBottomSheet(context),
                            visualDensity: VisualDensity.compact,
                            style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(theme.colorScheme.primaryContainer)),
                            icon: Icon(Symbols.camera_rounded, size: 18, color: theme.colorScheme.onPrimaryContainer),
                          ),
                        )
                      ],
                    )),
                    const SizedBox(height: 16),
                    Text("Jack William", style: theme.textTheme.titleMedium),
                    const SizedBox(height: 4),
                    Text("jackwilliam8392@gmail.com", style: theme.textTheme.bodyMedium),
                    const SizedBox(height: 16),
                    GridView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, childAspectRatio: controller.getAspectRatio(), crossAxisSpacing: 16, mainAxisSpacing: 16),
                      children: [
                        InkWell(
                          onTap: () => controller.orderHistory(),
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: theme.colorScheme.surfaceContainer,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Symbols.package_rounded, size: 22, color: theme.colorScheme.onSurface),
                                const SizedBox(width: 8),
                                Text("Orders", style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurface)),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () => controller.onWishlist(),
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: theme.colorScheme.surfaceContainer,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Symbols.favorite_rounded, size: 22, color: theme.colorScheme.onSurface),
                                const SizedBox(width: 8),
                                Text("Wishlist", style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurface)),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () => controller.coupons(),
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: theme.colorScheme.surfaceContainer),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Symbols.featured_seasonal_and_gifts_rounded, size: 22, color: theme.colorScheme.onSurface),
                                const SizedBox(width: 8),
                                Text("Coupons", style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurface)),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () => controller.helpCenter(),
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: theme.colorScheme.surfaceContainer),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Symbols.help_rounded, size: 22, color: theme.colorScheme.onSurface),
                                const SizedBox(width: 8),
                                Text("Help Center", style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurface)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    ListTile(
                        focusColor: theme.colorScheme.surfaceContainer,
                        splashColor: theme.colorScheme.surfaceContainer,
                        selectedTileColor: theme.colorScheme.surfaceContainer,
                        title: Text("Edit Profile", style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurface)),
                        leading: Icon(Symbols.person_edit_rounded, size: 22, color: theme.colorScheme.onSurface),
                        trailing: Icon(Symbols.chevron_right, size: 22, color: theme.colorScheme.onSurface),
                        onTap: () => controller.editProfile(),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        selected: true,
                        visualDensity: VisualDensity.compact),
                    const SizedBox(height: 16),
                    ListTile(
                        focusColor: theme.colorScheme.surfaceContainer,
                        splashColor: theme.colorScheme.surfaceContainer,
                        selectedTileColor: theme.colorScheme.surfaceContainer,
                        title: Text("Payment Method", style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurface)),
                        leading: Icon(Symbols.account_balance_wallet_rounded, size: 22, color: theme.colorScheme.onSurface),
                        trailing: Icon(Symbols.chevron_right_rounded, size: 22, color: theme.colorScheme.onSurface),
                        onTap: () => controller.paymentMethod(),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        selected: true,
                        visualDensity: VisualDensity.compact),
                    const SizedBox(height: 16),
                    ListTile(
                        focusColor: theme.colorScheme.surfaceContainer,
                        splashColor: theme.colorScheme.surfaceContainer,
                        selectedTileColor: theme.colorScheme.surfaceContainer,
                        title: Text("Language", style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurface)),
                        leading: Icon(Symbols.language_rounded, size: 22, color: theme.colorScheme.onSurface),
                        trailing: Icon(Symbols.chevron_right_rounded, size: 22, color: theme.colorScheme.onSurface),
                        onTap: () => controller.language(),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        selected: true,
                        visualDensity: VisualDensity.compact),
                    const SizedBox(height: 16),
                    ListTile(
                        focusColor: theme.colorScheme.surfaceContainer,
                        splashColor: theme.colorScheme.surfaceContainer,
                        selectedTileColor: theme.colorScheme.surfaceContainer,
                        title: Text("Invite Friend", style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurface)),
                        leading: Icon(Symbols.person_add_rounded, size: 22, color: theme.colorScheme.onSurface),
                        trailing: Icon(Symbols.chevron_right_rounded, size: 22, color: theme.colorScheme.onSurface),
                        onTap: () => controller.inviteFriend(),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        selected: true,
                        visualDensity: VisualDensity.compact),
                    const SizedBox(height: 16),
                    FilledButton(
                      onPressed: () => controller.logOut(),
                      style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(theme.colorScheme.errorContainer),
                          shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)))),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Symbols.logout_rounded, color: theme.colorScheme.onErrorContainer, size: 18),
                          const SizedBox(width: 12),
                          Text("Log Out", style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onErrorContainer)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
