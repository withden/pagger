// Base
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

// Need for specific page
import 'controller.dart';
import 'style.dart';
import 'widgets.dart';

class HealthScheduleView extends StatefulWidget {
  const HealthScheduleView({super.key});

  @override
  State<HealthScheduleView> createState() => _HealthScheduleViewState();
}

class _HealthScheduleViewState extends State<HealthScheduleView> {
  final ThemeData theme = Style.theme();
  HealthScheduleController controller = Get.put(HealthScheduleController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: controller,
      tag: 'health_schedule_1',
      builder: (controller) {
        return Theme(
          data: theme,
          child: Scaffold(
              appBar: AppBar(
                leading: IconButton(
                    icon: const Icon(
                      Symbols.chevron_left_rounded,
                    ),
                    onPressed: controller.goBack),
                title: Text("Schedule", style: theme.textTheme.titleMedium),
              ),
              body: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    AvailableScheduleList(),
                    const SizedBox(height: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Activity", style: theme.textTheme.titleMedium),
                        const SizedBox(height: 16),
                        Wrap(
                          runSpacing: 16,
                          children: [
                            SingleActivityWidget(
                                startContent: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(color: theme.colorScheme.primaryContainer, borderRadius: BorderRadius.circular(8)),
                                    child: Icon(Symbols.alarm_rounded, color: theme.colorScheme.onPrimaryContainer, size: 22)),
                                time: "6:00 AM",
                                title: "Wake up",
                                description: "Alarm automatic set"),
                            SingleActivityWidget(
                                startContent: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(color: theme.colorScheme.secondaryContainer, borderRadius: BorderRadius.circular(8)),
                                    child: Icon(Symbols.footprint_rounded, color: theme.colorScheme.onSecondaryContainer, size: 22)),
                                time: "7:00 AM",
                                title: "Running",
                                description: "3 KM at morning"),
                            SingleActivityWidget(
                                startContent: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(color: theme.colorScheme.tertiaryContainer, borderRadius: BorderRadius.circular(8)),
                                    child: Icon(Symbols.pill_rounded, color: theme.colorScheme.onTertiaryContainer, size: 22)),
                                time: "8:00 AM",
                                title: "Take Pill",
                                description: "After walking"),
                            SingleActivityWidget(
                                startContent: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(color: theme.colorScheme.errorContainer, borderRadius: BorderRadius.circular(8)),
                                    child: Icon(Symbols.clinical_notes_rounded, color: theme.colorScheme.onErrorContainer, size: 22)),
                                time: "10:00 AM",
                                title: "You missed an appointment",
                                description: "Dr. Vivek"),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              )),
        );
      },
    );
  }
}
