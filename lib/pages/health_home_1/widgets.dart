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

class WellnessWidget extends StatelessWidget {
  final ThemeData theme = Style.theme();
  final HealthHomeController controller = Get.put(HealthHomeController());

  WellnessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Symbols.ecg_heart_rounded, size: 20),
                const SizedBox(width: 8),
                Text("Wellness", style: theme.textTheme.titleMedium),
                const Spacer(),
                PopupMenuButton<WellnessDuration>(
                  onSelected: controller.onSelectWellnessTimeSchedule,
                  position: PopupMenuPosition.under,
                  splashRadius: 8,
                  itemBuilder: (BuildContext context) {
                    return WellnessDuration.values.map((wellness) {
                      return PopupMenuItem<WellnessDuration>(
                        value: wellness,
                        height: 32,
                        child: Text(wellness.toString().split('.').last.capitalize!, style: theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w600)),
                      );
                    }).toList();
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(controller.wellnessDuration.toString().split('.').last.capitalize!,
                            style: theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w600)),
                        const SizedBox(width: 4),
                        const Icon(Symbols.keyboard_arrow_down_rounded, size: 18),
                      ],
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
                height: 230,
                child: SfCartesianChart(
                    margin: EdgeInsets.zero,
                    plotAreaBorderWidth: 0,
                    plotAreaBorderColor: Colors.transparent,
                    primaryXAxis: CategoryAxis(labelStyle: theme.textTheme.bodySmall, majorGridLines: const MajorGridLines(width: 0)),
                    primaryYAxis: NumericAxis(labelFormat: '{value}', labelStyle: theme.textTheme.bodySmall, majorTickLines: const MajorTickLines(size: 0)),
                    series: [
                      ColumnSeries<ChartData<String, num>, String>(
                          dataSource: controller.wellnessData,
                          xValueMapper: (sales, _) => sales.x,
                          yValueMapper: (sales, _) => sales.y,
                          borderRadius: const BorderRadius.vertical(top: Radius.circular(100)),
                          color: theme.colorScheme.primary,
                          width: .4)
                    ],
                    tooltipBehavior: TooltipBehavior(enable: true, header: '', canShowMarker: false))),
          ],
        ),
      ),
    );
  }
}

class CaloriesWidget extends StatelessWidget {
  CaloriesWidget({super.key});

  final ThemeData theme = Style.theme();
  final HealthHomeController controller = Get.put(HealthHomeController());

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
              children: [
                const Icon(Symbols.local_fire_department_rounded, size: 22),
                const SizedBox(width: 12),
                Text("Calories", style: theme.textTheme.titleMedium),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
                height: 125,
                child: SfCircularChart(margin: EdgeInsets.zero, tooltipBehavior: TooltipBehavior(enable: true), series: [
                  RadialBarSeries<ChartData<String, num>, String>(
                    animationDuration: 0,
                    maximumValue: 100,
                    radius: '100%',
                    gap: '2%',
                    innerRadius: '75%',
                    trackColor: theme.colorScheme.secondaryContainer,
                    dataSource: controller.caloriesData,
                    cornerStyle: CornerStyle.bothCurve,
                    xValueMapper: (data, _) => data.x,
                    yValueMapper: (data, _) => data.y,
                    pointColorMapper: (ChartData data, _) => theme.colorScheme.secondary,
                  ),
                ])),
            const SizedBox(height: 16),
            Text("1286", style: theme.textTheme.titleMedium),
            const Text("Daily rates"),
          ],
        ),
      ),
    );
  }
}

class SleepWidget extends StatelessWidget {
  SleepWidget({super.key});

  final ThemeData theme = Style.theme();
  final HealthHomeController controller = Get.put(HealthHomeController());

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16, left: 16),
            child: Row(
              children: [
                const Icon(Symbols.bed_rounded, size: 22),
                const SizedBox(width: 12),
                Text("Sleep", style: theme.textTheme.titleMedium),
              ],
            ),
          ),
          SizedBox(
              height: 141,
              child: SfCartesianChart(
                margin: EdgeInsets.zero,
                plotAreaBorderWidth: 0,
                primaryXAxis:
                    const NumericAxis(interval: 1, isVisible: false, majorGridLines: MajorGridLines(width: 0), edgeLabelPlacement: EdgeLabelPlacement.shift),
                primaryYAxis: const NumericAxis(isVisible: false, axisLine: AxisLine(width: 0), majorTickLines: MajorTickLines(size: 0)),
                series: [
                  SplineAreaSeries<ChartData<num, num>, num>(
                      dataSource: controller.sleepData,
                      color: theme.colorScheme.secondaryContainer,
                      borderColor: theme.colorScheme.secondary,
                      name: 'Food',
                      xValueMapper: (sales, _) => sales.x,
                      yValueMapper: (sales, _) => sales.y)
                ],
                tooltipBehavior: TooltipBehavior(enable: true),
              )),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("6.2", style: theme.textTheme.titleMedium),
                Text("Hour", style: theme.textTheme.bodyMedium),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class StepWidget extends StatelessWidget {
  StepWidget({super.key});

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
            Text("Steps", style: theme.textTheme.titleMedium?.copyWith(color: theme.colorScheme.secondary)),
            Text("11:23 PM", style: theme.textTheme.bodySmall),
            const SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("3200", style: theme.textTheme.titleLarge?.copyWith(height: 1.1)),
                const SizedBox(width: 4),
                Text("Steps", style: theme.textTheme.bodySmall),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PulseRateWidget extends StatelessWidget {
  PulseRateWidget({super.key});

  final ThemeData theme = Style.theme();
  final HealthHomeController controller = Get.put(HealthHomeController());

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Pulse Rate", style: theme.textTheme.titleMedium?.copyWith(color: theme.colorScheme.secondary)),
            Text("6:26 PM", style: theme.textTheme.bodySmall),
            const SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("63", style: theme.textTheme.titleLarge?.copyWith(height: 1.1)),
                const SizedBox(width: 4),
                Text("BPM", style: theme.textTheme.bodySmall),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
