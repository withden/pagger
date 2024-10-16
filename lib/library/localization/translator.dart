// ::Import 1
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

// Internal Shared Library
import '../notifier/app.dart';

class AppTranslator {
  static TextDirection textDirection = TextDirection.rtl;
  static Locale? locale;

  static AppLocalizations get() {
    return AppLocalizations.of(Get.context!)!;
  }

  static bool changeDirection(TextDirection direction, {bool notify = true}) {
    textDirection = direction;
    if (notify) {
      Provider.of<AppNotifier>(Get.context!, listen: false).notify();
    }
    return true;
  }

  static bool changeLocale(Locale iLocale, {bool notify = true}) {
    locale = iLocale;
    if (iLocale.languageCode == 'ar') {
      changeDirection(TextDirection.rtl, notify: false);
    } else {
      changeDirection(TextDirection.ltr, notify: false);
    }
    if (notify) {
      Provider.of<AppNotifier>(Get.context!, listen: false).notify();
    }
    return true;
  }
}
