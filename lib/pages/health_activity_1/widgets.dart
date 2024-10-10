// Base
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
// Need to add: Syncfusion Charts
// Run `flutter pub add syncfusion_flutter_charts`
import 'package:syncfusion_flutter_charts/charts.dart';

// Need for specific page
import 'controller.dart';
import 'model.dart';
import 'style.dart';

class AverageStepsWidget extends StatelessWidget {
  AverageStepsWidget({super.key});

  final ThemeData theme = Style.theme();
  final HealthActivityController controller = Get.put(HealthActivityController());

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Symbols.footprint_rounded,
                  size: 24,
                ),
                const SizedBox(height: 4),
                const Text("Average Steps"),
                const SizedBox(height: 4),
                Text("4.2 KM / Day", style: theme.textTheme.titleMedium),
              ],
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: SizedBox(
                height: 96,
                child: SfCartesianChart(
                    margin: EdgeInsets.zero,
                    plotAreaBorderWidth: 0,
                    plotAreaBorderColor: Colors.transparent,
                    tooltipBehavior: TooltipBehavior(enable: true),
                    primaryXAxis: const CategoryAxis(isVisible: false, majorGridLines: MajorGridLines(width: 0)),
                    primaryYAxis:
                        NumericAxis(isVisible: false, maximum: 22, labelStyle: theme.textTheme.bodySmall, majorTickLines: const MajorTickLines(size: 0)),
                    series: [
                      ColumnSeries<ChartData<String, num>, String>(
                          dataSource: controller.stepsData,
                          xValueMapper: (sales, _) => sales.x,
                          yValueMapper: (sales, _) => sales.y,
                          borderRadius: BorderRadius.circular(100),
                          color: theme.colorScheme.primary,
                          width: .4)
                    ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SleepWidget extends StatelessWidget {
  final ThemeData theme = Style.theme();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Sleep', style: theme.textTheme.titleMedium),
                const Icon(Symbols.sleep_rounded, size: 20),
              ],
            ),
            const SizedBox(height: 8),
            RichText(
              text: TextSpan(children: [
                TextSpan(text: '5.43', style: theme.textTheme.titleSmall),
                const WidgetSpan(
                    child: SizedBox(
                  width: 4,
                )),
                TextSpan(text: 'Hours', style: theme.textTheme.bodySmall),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

class HeartWidget extends StatelessWidget {
  HeartWidget({super.key});

  final ThemeData theme = Style.theme();
  final HealthActivityController controller = Get.put(HealthActivityController());

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Heart', style: theme.textTheme.titleMedium),
                const Icon(Symbols.favorite_rounded, size: 20),
              ],
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 72,
              child: SfCartesianChart(
                  margin: EdgeInsets.zero,
                  plotAreaBorderWidth: 0,
                  tooltipBehavior: TooltipBehavior(enable: true),
                  primaryXAxis: const NumericAxis(isVisible: false, majorGridLines: MajorGridLines(width: 0)),
                  primaryYAxis: const NumericAxis(isVisible: false),
                  series: [
                    LineSeries<ChartData<num, num>, num>(
                        dataSource: controller.heartData,
                        name: 'Heart Rate',
                        xValueMapper: (sales, _) => sales.x,
                        yValueMapper: (sales, _) => sales.y,
                        color: theme.colorScheme.primary,
                        markerSettings: MarkerSettings(isVisible: true, color: theme.colorScheme.primary))
                  ]),
            ),
            const SizedBox(height: 8),
            RichText(
              text: TextSpan(children: [
                TextSpan(text: '43', style: theme.textTheme.titleSmall?.copyWith(fontSize: 14)),
                const WidgetSpan(
                    child: SizedBox(
                  width: 4,
                )),
                TextSpan(text: 'bpm', style: theme.textTheme.bodySmall?.copyWith(fontSize: 12)),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

class ExerciseWidget extends StatelessWidget {
  ExerciseWidget({super.key});

  final ThemeData theme = Style.theme();
  final HealthActivityController controller = Get.put(HealthActivityController());

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("Exercise", style: theme.textTheme.titleMedium), const Icon(Symbols.exercise_rounded, size: 20)],
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 130,
              child: SfCircularChart(
                margin: EdgeInsets.zero,
                tooltipBehavior: TooltipBehavior(enable: true),
                series: [
                  RadialBarSeries<ChartData<String, num>, String>(
                    animationDuration: 0,
                    maximumValue: 100,
                    radius: '100%',
                    innerRadius: '75%',
                    trackColor: theme.colorScheme.secondaryContainer,
                    dataSource: controller.exerciseData,
                    cornerStyle: CornerStyle.bothCurve,
                    xValueMapper: (data, _) => data.x,
                    yValueMapper: (data, _) => data.y,
                    pointColorMapper: (data, _) => theme.colorScheme.secondary,
                  )
                ],
              ),
            ),
            const SizedBox(height: 12),
            RichText(
              text: TextSpan(children: [
                TextSpan(text: '1.45', style: theme.textTheme.titleMedium),
                const WidgetSpan(
                    child: SizedBox(
                  width: 4,
                )),
                TextSpan(text: 'Hours', style: theme.textTheme.bodyMedium),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

class FoodWidget extends StatelessWidget {
  FoodWidget({super.key});

  final ThemeData theme = Style.theme();
  final HealthActivityController controller = Get.put(HealthActivityController());

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Food", style: theme.textTheme.titleMedium),
                    const SizedBox(
                      height: 4,
                    ),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(text: '245', style: theme.textTheme.titleSmall?.copyWith(fontSize: 14)),
                        const WidgetSpan(
                            child: SizedBox(
                          width: 4,
                        )),
                        TextSpan(text: '/1,365', style: theme.textTheme.bodySmall?.copyWith(fontSize: 12)),
                      ]),
                    ),
                  ],
                ),
                const Icon(Symbols.fastfood_rounded, size: 20)
              ],
            ),
            const SizedBox(height: 12),
            SizedBox(
                height: 110,
                child: SfCircularChart(margin: EdgeInsets.zero, tooltipBehavior: TooltipBehavior(enable: true), series: [
                  RadialBarSeries<ChartData<String, num>, String>(
                    animationDuration: 0,
                    maximumValue: 100,
                    radius: '100%',
                    innerRadius: '75%',
                    trackColor: theme.colorScheme.tertiaryContainer,
                    dataSource: controller.foodData,
                    cornerStyle: CornerStyle.bothCurve,
                    xValueMapper: (data, _) => data.x,
                    yValueMapper: (data, _) => data.y,
                    pointColorMapper: (data, _) => theme.colorScheme.tertiary,
                  )
                ])),
            const SizedBox(height: 12),
            RichText(
              text: TextSpan(children: [
                TextSpan(text: '245', style: theme.textTheme.titleMedium),
                const WidgetSpan(
                    child: SizedBox(
                  width: 4,
                )),
                TextSpan(text: 'Kcal', style: theme.textTheme.bodyMedium),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

class DrinkWidget extends StatelessWidget {
  DrinkWidget({super.key});

  final ThemeData theme = Style.theme();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Drink', style: theme.textTheme.titleMedium),
                const Icon(Symbols.local_drink_rounded, size: 20),
              ],
            ),
            const SizedBox(height: 8),
            RichText(
              text: TextSpan(children: [
                TextSpan(text: '1000', style: theme.textTheme.titleMedium),
                const WidgetSpan(
                    child: SizedBox(
                  width: 4,
                )),
                TextSpan(text: '/2000 ml', style: theme.textTheme.bodyMedium),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

class RunningWidget extends StatelessWidget {
  RunningWidget({super.key});

  final ThemeData theme = Style.theme();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("Running", style: theme.textTheme.titleMedium), const Icon(Symbols.footprint_rounded, size: 20)],
            ),
            const SizedBox(height: 8),
            Text("36 Minutes", style: theme.textTheme.titleSmall),
          ],
        ),
      ),
    );
  }
}

class CyclingWidget extends StatelessWidget {
  CyclingWidget({super.key});

  final ThemeData theme = Style.theme();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("Cycling", style: theme.textTheme.titleMedium), const Icon(Symbols.directions_bike_rounded, size: 20)],
            ),
            const SizedBox(height: 8),
            RichText(
              text: TextSpan(children: [
                TextSpan(text: '45', style: theme.textTheme.titleMedium),
                const WidgetSpan(
                    child: SizedBox(
                  width: 4,
                )),
                TextSpan(text: 'Minutes', style: theme.textTheme.bodyMedium),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
