import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:pagger/kit/style.dart';
import 'package:pagger/routes.dart';
import 'package:provider/provider.dart';

import 'kit/home/home_screen.dart';
import 'library/library.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppTheme.init();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(ChangeNotifierProvider<AppNotifier>(
    create: (context) => AppNotifier(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppNotifier>(builder: (BuildContext context, AppNotifier value, Widget? child) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: const HomeScreen(),
        getPages: getRoutes(),
        builder: (context, child) {
          return Directionality(
            textDirection: AppTranslator.textDirection,
            child: child ?? const SizedBox(),
          );
        },
        theme: Style.lightTheme,
        darkTheme: Style.darkTheme,
        themeMode: AppTheme.themeType,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
      );
    });
  }
}
