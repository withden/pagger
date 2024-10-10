// Base
import 'package:get/get.dart';

// Need for specific page
import 'model.dart';

enum WellnessDuration {
  year,
  month,
  week,
  day,
  hour,
}

class HealthHomeController extends GetxController {
  WellnessDuration wellnessDuration = WellnessDuration.day;

  // Fetched from Chart Data
  List<ChartData<num, num>> sleepData = [
    ChartData(x: 2010, y: 3.0),
    ChartData(x: 2011, y: 4.0),
    ChartData(x: 2012, y: 5.5),
    ChartData(x: 2013, y: 4.5),
    ChartData(x: 2014, y: 6.0),
    ChartData(x: 2015, y: 7.0),
    ChartData(x: 2016, y: 6.5),
    ChartData(x: 2017, y: 8.0),
    ChartData(x: 2018, y: 7.5),
  ];

  // Wellness Data
  List<ChartData<String, num>> wellnessData = [
    ChartData(x: 'Sun', y: 3),
    ChartData(x: 'Mon', y: 8),
    ChartData(x: 'Tue', y: 16),
    ChartData(x: 'Wed', y: 14),
    ChartData(x: 'Thu', y: 21),
    ChartData(x: 'Fri', y: 19),
    ChartData(x: 'Sat', y: 18),
  ];

  List<ChartData<String, num>> caloriesData = [
    ChartData(x: 'Burned', y: 38),
  ];

  void onSelectWellnessTimeSchedule(WellnessDuration duration) {
    wellnessDuration = duration;
    update();
  }

  void goBack() {
    Get.back();
  }

  void seeAllYourActivity() {
    // View Your Activity
  }

  void seeAllIndicators() {
    // View Your Indicators
  }

  void goNotification() {
    // View Notification
  }
}
