// Base
import 'package:get/get.dart';

class HealthScheduleController extends GetxController {
  // Selected date
  late DateTime selectedDate = dates[0];

  List<DateTime> dates = [
    DateTime.now(),
    DateTime.now().add(const Duration(days: 1)),
    DateTime.now().add(const Duration(days: 2)),
    DateTime.now().add(const Duration(days: 3)),
    DateTime.now().add(const Duration(days: 4)),
    DateTime.now().add(const Duration(days: 5)),
  ];

  void goBack() {
    Get.back();
  }

  void onSelectDate(DateTime date) {
    selectedDate = date;
    update();
  }
}
