// Base
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

// Need for specific page
import 'controller.dart';
import 'style.dart';
import 'widgets.dart';

class HealthActivityView extends StatefulWidget {
  const HealthActivityView({super.key});

  @override
  State<HealthActivityView> createState() => _HealthActivityViewState();
}

class _HealthActivityViewState extends State<HealthActivityView> {
  final ThemeData theme = Style.theme();
  HealthActivityController controller = Get.put(HealthActivityController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: controller,
      tag: 'health_activity_1',
      builder: (controller) {
        return Theme(
          data: theme,
          child: Scaffold(
            appBar: AppBar(
              leading: IconButton(icon: const Icon(Symbols.chevron_left_rounded), onPressed: controller.goBack),
              actions: [
                Builder(
                  builder: (BuildContext context) {
                    return IconButton(
                      icon: const Icon(
                        Symbols.calendar_month_rounded,
                        size: 20,
                        weight: 600,
                      ),
                      onPressed: () {
                        controller.openCalendar(context);
                      },
                    );
                  },
                ),
                const SizedBox(width: 16)
              ],
              title: Text("Activity", style: theme.textTheme.titleMedium),
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
              child: Column(
                children: [
                  AverageStepsWidget(),
                  const SizedBox(height: 16),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            HeartWidget(),
                            const SizedBox(height: 16),
                            CyclingWidget(),
                            const SizedBox(height: 16),
                            ExerciseWidget(),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          children: [
                            SleepWidget(),
                            const SizedBox(height: 16),
                            FoodWidget(),
                            const SizedBox(height: 16),
                            DrinkWidget(),
                            const SizedBox(height: 16),
                            RunningWidget(),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
