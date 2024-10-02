import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppNotifier extends ChangeNotifier {
  AppNotifier();

  void notify() {
    return notifyListeners();
  }
}
