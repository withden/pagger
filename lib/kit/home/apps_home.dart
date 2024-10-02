import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:pagger/kit/style.dart';
import 'package:pagger/library/library.dart';
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
                                  DemoNavigationItem(title: "Home", navigation: () => const Center(child: Text("Ecommerce Home Screen"))),
                                ]),
                          )),
                ]),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: theme.colorScheme.primary.withOpacity(.2),
              ),
              child: Center(
                  child: Text("More Apps are coming soon...",
                      style: theme.textTheme.bodyMedium!.copyWith(color: theme.colorScheme.primary, fontWeight: FontWeight.w600))),
            ),
          ],
        );
      },
    );
  }
}
