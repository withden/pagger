import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:pagger/kit/home/setting_screen.dart';
import 'package:pagger/kit/style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  int selectedIndex = 0;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  ThemeData theme = Style.theme();

  final List<Widget> bottomBarPages = [
    const Center(
      child: Text("Apps"),
    ),
    const Center(
      child: Text("Widgets"),
    ),
    const Center(
      child: Text("Other"),
    )
  ];

  void onChangeIndex(int index) {
    selectedIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: theme,
      child: Scaffold(
          key: scaffoldKey,
          drawer: Drawer(
              width: 275,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 20),
                  Text(
                    "Pagger",
                    style: theme.textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  const SettingWidget()
                ],
              )),
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  scaffoldKey.currentState?.openDrawer();
                },
                icon: const Icon(
                  Symbols.menu_rounded,
                  weight: 600,
                  size: 22,
                )),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const AppSettingScreen()));
                },
                icon: const Icon(
                  Symbols.page_info_rounded,
                  size: 22,
                  weight: 600,
                ),
              ),
              const SizedBox(
                width: 16,
              )
            ],
          ),
          body: bottomBarPages[selectedIndex],
          bottomNavigationBar: NavigationBar(
            selectedIndex: selectedIndex,
            onDestinationSelected: (value) => onChangeIndex(value),
            indicatorColor: theme.colorScheme.primaryContainer,
            backgroundColor: theme.colorScheme.surface,
            destinations: [
              NavigationDestination(
                  selectedIcon: Icon(
                    Symbols.browse_rounded,
                    color: theme.colorScheme.onPrimaryContainer,
                    size: 22,
                  ),
                  icon: Icon(
                    Symbols.browse_rounded,
                    color: theme.colorScheme.onPrimaryContainer,
                    size: 20,
                  ),
                  label: 'Apps'),
              NavigationDestination(
                  selectedIcon: Icon(
                    Symbols.widgets_rounded,
                    color: theme.colorScheme.onPrimaryContainer,
                    size: 22,
                  ),
                  icon: Icon(
                    Symbols.widgets_rounded,
                    color: theme.colorScheme.onPrimaryContainer,
                    size: 20,
                  ),
                  label: 'Widget'),
              NavigationDestination(
                  selectedIcon: Icon(
                    Symbols.interests_rounded,
                    color: theme.colorScheme.onPrimaryContainer,
                    size: 22,
                  ),
                  icon: Icon(
                    Symbols.interests_rounded,
                    color: theme.colorScheme.onPrimaryContainer,
                    size: 20,
                  ),
                  label: 'Other'),
            ],
          )),
    );
  }
}
