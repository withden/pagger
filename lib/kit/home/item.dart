import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:pagger/kit/style.dart';

class DemoNavigationItem extends StatelessWidget {
  final String title;
  final Widget Function() navigation;
  final IconData? iconData;
  final String? badge;

  const DemoNavigationItem({super.key, required this.title, required this.navigation, this.iconData, this.badge});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Style.theme();

    return InkWell(
        onTap: () async {
          await Navigator.push(context, MaterialPageRoute(builder: (context) => navigation()));
        },
        borderRadius: BorderRadius.circular(8),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: theme.colorScheme.surfaceContainerHighest,
                  )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  if (iconData != null) Icon(iconData, size: 28),
                  if (iconData != null)
                    const SizedBox(
                      height: 8,
                    ),
                  Text(title, style: theme.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w600))
                ],
              ),
            ),
            if (badge != null)
              Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
                    decoration: BoxDecoration(color: theme.colorScheme.tertiaryContainer, borderRadius: BorderRadius.circular(2)),
                    child: Text(
                      badge!,
                      style: theme.textTheme.labelMedium?.copyWith(color: theme.colorScheme.onTertiaryContainer, fontWeight: FontWeight.w600),
                    ),
                  ))
          ],
        ));
  }
}

class DemoNavigationPage extends StatelessWidget {
  final String title;
  final Widget body;

  const DemoNavigationPage({super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Style.theme();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: theme.textTheme.titleMedium,
        ),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Symbols.chevron_left_rounded,
            )),
      ),
      body: body,
    );
  }
}
