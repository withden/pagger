import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:pagger/kit/style.dart';
import 'package:pagger/library/library.dart';
import 'package:provider/provider.dart';

class SettingWidget extends StatefulWidget {
  const SettingWidget({super.key});

  @override
  State<SettingWidget> createState() => _SettingWidgetState();
}

class _SettingWidgetState extends State<SettingWidget> {
  ThemeData theme = Style.theme();
  bool isDark = false;
  TextDirection textDirection = TextDirection.ltr;

  void changeDirection() {}

  void changeTheme() {
    if (AppTheme.themeType == ThemeMode.light) {
      AppTheme.changeTheme(ThemeMode.dark);
    } else {
      AppTheme.changeTheme(ThemeMode.light);
    }
    setState(() {});
  }

  void launchDocumentation() {}

  void launchGithub() {}

  @override
  Widget build(BuildContext context) {
    return Consumer<AppNotifier>(builder: (BuildContext context, AppNotifier value, Widget? child) {
      theme = Style.theme();
      isDark = AppTheme.themeType == ThemeMode.dark;
      return Theme(
        data: theme,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "User Interface",
                  style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurface.withAlpha(180), fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(height: 4),
              ListTile(
                onTap: () => changeTheme(),
                dense: true,
                minTileHeight: 36,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                leading: Icon(
                  isDark ? Symbols.dark_mode_rounded : Symbols.sunny_rounded,
                  size: 18,
                ),
                title: RichText(
                  text: TextSpan(children: [
                    TextSpan(text: "Mode: ", style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600)),
                    TextSpan(text: isDark ? "Light" : "Dark")
                  ], style: theme.textTheme.bodyMedium),
                ),
              ),
              ListTile(
                dense: true,
                minTileHeight: 36,
                onTap: () => changeDirection(),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                leading: const Icon(
                  Symbols.format_textdirection_l_to_r,
                  size: 18,
                ),
                title: RichText(
                  text: TextSpan(children: [
                    TextSpan(text: "Direction: ", style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600)),
                    const TextSpan(text: "Left to Right")
                  ], style: theme.textTheme.bodyMedium),
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "Links",
                  style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurface.withAlpha(180), fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(height: 4),
              ListTile(
                dense: true,
                minTileHeight: 36,
                onTap: launchGithub,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                leading: const Icon(
                  Symbols.code_rounded,
                  size: 18,
                ),
                trailing: const Icon(
                  Symbols.arrow_outward_rounded,
                  size: 14,
                ),
                title: const Text("Github (Source)"),
              ),
              ListTile(
                dense: true,
                minTileHeight: 36,
                onTap: launchDocumentation,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                leading: const Icon(
                  Symbols.article_rounded,
                  size: 18,
                ),
                trailing: const Icon(
                  Symbols.arrow_outward_rounded,
                  size: 14,
                ),
                title: const Text("Documentation"),
              ),
            ],
          ),
        ),
      );
    });
  }
}

class AppSettingScreen extends StatefulWidget {
  const AppSettingScreen({super.key});

  @override
  State<AppSettingScreen> createState() => _AppSettingScreenState();
}

class _AppSettingScreenState extends State<AppSettingScreen> {
  ThemeData theme = Style.theme();

  @override
  Widget build(BuildContext context) {
    return Consumer<AppNotifier>(
      builder: (BuildContext context, AppNotifier value, Widget? child) {
        theme = Style.theme();
        return Theme(
          data: theme,
          child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(Symbols.chevron_left_rounded)),
              elevation: 0,
              title: Text("Settings", style: theme.textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w600)),
            ),
            body: const SettingWidget(),
          ),
        );
      },
    );
  }
}
