import 'package:flutter/material.dart';
import 'package:pagger/kit/style.dart';
import 'package:pagger/library/library.dart';
import 'package:provider/provider.dart';

class MaterialWidgetsHome extends StatefulWidget {
  const MaterialWidgetsHome({super.key});

  @override
  State<MaterialWidgetsHome> createState() => _MaterialWidgetsHomeState();
}

class _MaterialWidgetsHomeState extends State<MaterialWidgetsHome> {
  ThemeData theme = Style.theme();

  @override
  Widget build(BuildContext context) {
    return Consumer<AppNotifier>(builder: (BuildContext context, AppNotifier value, Widget? child) {
      theme = Style.theme();

      return ListView(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 80),
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: theme.colorScheme.primaryContainer,
            ),
            child: Center(
                child: Text("Material Widgets are coming soon...",
                    style: theme.textTheme.bodyLarge!.copyWith(color: theme.colorScheme.onPrimaryContainer, fontWeight: FontWeight.w600))),
          ),
        ],
      );
    });
  }
}
