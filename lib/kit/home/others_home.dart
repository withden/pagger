import 'package:flutter/material.dart';
import 'package:pagger/kit/style.dart';
import 'package:pagger/library/library.dart';
import 'package:provider/provider.dart';

class OthersHome extends StatefulWidget {
  const OthersHome({super.key});

  @override
  State<OthersHome> createState() => _OthersHomeState();
}

class _OthersHomeState extends State<OthersHome> {
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
                child: Text("Other Widgets are coming soon...",
                    style: theme.textTheme.bodyLarge!.copyWith(color: theme.colorScheme.onPrimaryContainer, fontWeight: FontWeight.w600))),
          ),
        ],
      );
    });
  }
}
