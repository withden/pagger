import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:pagger/kit/style.dart';
import 'package:pagger/library/library.dart';
import 'package:pagger/pages/health_activity_1/view.dart' as health_activity_1;
import 'package:pagger/pages/health_home_1/view.dart' as health_home_1;
import 'package:pagger/pages/health_profile_1/view.dart' as health_profile_1;
import 'package:pagger/pages/health_schedule_1/view.dart' as health_schedule_1;
import 'package:pagger/pages/shopping_cart_1/view.dart' as shopping_cart_1;
import 'package:pagger/pages/shopping_checkout_1/view.dart' as shopping_checkout_1;
import 'package:pagger/pages/shopping_explore_1/view.dart' as shopping_explore_1;
import 'package:pagger/pages/shopping_home_1/view.dart' as shopping_home_1;
import 'package:pagger/pages/shopping_orders_1/view.dart' as shopping_orders_1;
import 'package:pagger/pages/shopping_product_1/view.dart' as shopping_product_1;
import 'package:pagger/pages/shopping_profile_1/view.dart' as shopping_profile_1;
import 'package:provider/provider.dart';

import 'item.dart';

class AppsHome extends StatefulWidget {
  const AppsHome({super.key});

  @override
  State<AppsHome> createState() => _AppsHomeState();
}

class _AppsHomeState extends State<AppsHome> {
  ThemeData theme = Style.theme();

  double mainGridAspectRatio() {
    final double width = MediaQuery.of(context).size.width;
    const int extraSpacing = 60;
    const int gridCount = 2;
    const int fixHeight = 93;
    return ((width - extraSpacing) / gridCount) / fixHeight;
  }

  double gridAspectRatio() {
    final double width = MediaQuery.of(context).size.width;
    const int extraSpacing = 60;
    const int gridCount = 2;
    const int fixHeight = 57;
    return ((width - extraSpacing) / gridCount) / fixHeight;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppNotifier>(
      builder: (BuildContext context, AppNotifier value, Widget? child) {
        theme = Style.theme();
        return ListView(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 30),
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          children: <Widget>[
            Text("Apps", style: theme.textTheme.titleMedium),
            const SizedBox(height: 16),
            GridView.count(
                crossAxisCount: 2,
                physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                mainAxisSpacing: 20,
                childAspectRatio: mainGridAspectRatio(),
                crossAxisSpacing: 20,
                children: [
                  DemoNavigationItem(
                      title: "Ecommerce 1",
                      iconData: Symbols.shopping_cart_rounded,
                      navigation: () => DemoNavigationPage(
                            title: 'Ecommerce',
                            body: GridView.count(
                                crossAxisCount: 2,
                                physics: const ClampingScrollPhysics(),
                                shrinkWrap: true,
                                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                                mainAxisSpacing: 20,
                                childAspectRatio: gridAspectRatio(),
                                crossAxisSpacing: 20,
                                children: [
                                  DemoNavigationItem(title: "Home", navigation: () => const shopping_home_1.ShoppingHomeView()),
                                  DemoNavigationItem(title: "Explore", navigation: () => const shopping_explore_1.ShoppingExploreView()),
                                  DemoNavigationItem(title: "Product", navigation: () => const shopping_product_1.ShoppingProductView()),
                                  DemoNavigationItem(title: "Cart", navigation: () => const shopping_cart_1.ShoppingCartView()),
                                  DemoNavigationItem(title: "Checkout", navigation: () => const shopping_checkout_1.ShoppingCheckoutView()),
                                  DemoNavigationItem(title: "Orders", navigation: () => const shopping_orders_1.ShoppingOrdersView()),
                                  DemoNavigationItem(title: "Profile", navigation: () => const shopping_profile_1.ShoppingProfileView()),
                                ]),
                          )),
                  DemoNavigationItem(
                      title: "Health 1",
                      iconData: Symbols.health_and_safety_rounded,
                      navigation: () => DemoNavigationPage(
                            title: 'Health',
                            body: GridView.count(
                                crossAxisCount: 2,
                                physics: const ClampingScrollPhysics(),
                                shrinkWrap: true,
                                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                                mainAxisSpacing: 20,
                                childAspectRatio: gridAspectRatio(),
                                crossAxisSpacing: 20,
                                children: [
                                  DemoNavigationItem(title: "Home", navigation: () => const health_home_1.HealthViewView()),
                                  DemoNavigationItem(title: "Activity", navigation: () => const health_activity_1.HealthActivityView()),
                                  DemoNavigationItem(title: "Schedule", navigation: () => const health_schedule_1.HealthScheduleView()),
                                  DemoNavigationItem(title: "Profile", navigation: () => const health_profile_1.HealthProfileView()),
                                ]),
                          )),
                ]),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: theme.colorScheme.primaryContainer,
              ),
              child: Center(
                  child: Text("More Apps are coming soon...",
                      style: theme.textTheme.bodyLarge!.copyWith(color: theme.colorScheme.onPrimaryContainer, fontWeight: FontWeight.w600))),
            ),
          ],
        );
      },
    );
  }
}
