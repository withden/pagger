// Base
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Need for specific page
import 'model.dart';

class HealthActivityController extends GetxController {
  // Fetched from Chart Data
  List<ChartData<num, num>>? heartData = [
    ChartData(x: 2005, y: 28),
    ChartData(x: 2006, y: 22),
    ChartData(x: 2007, y: 20),
    ChartData(x: 2008, y: 25),
    ChartData(x: 2009, y: 23),
    ChartData(x: 2010, y: 23),
    ChartData(x: 2011, y: 20)
  ];

  List<ChartData<String, num>> stepsData = [
    ChartData(x: 'Sun', y: 3),
    ChartData(x: 'Mon', y: 8),
    ChartData(x: 'Tue', y: 16),
    ChartData(x: 'Wed', y: 14),
    ChartData(x: 'Thu', y: 21),
    ChartData(x: 'Fri', y: 19),
    ChartData(x: 'Sat', y: 18),
  ];

  List<ChartData<String, num>> foodData = [ChartData(x: "Burned", y: 34)];

  List<ChartData<String, num>> exerciseData = [ChartData(x: "Completed", y: 86)];

  void goBack() {
    Get.back();
  }

  Future<void> openCalendar(BuildContext context) async {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020, 8),
      lastDate: DateTime(2101),
    );
  }
}
