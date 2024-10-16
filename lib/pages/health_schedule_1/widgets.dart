// Base
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

// Need for specific page
import 'controller.dart';
import 'style.dart';

class AvailableScheduleWidget extends StatelessWidget {
  AvailableScheduleWidget({super.key, required this.date});

  final DateTime date;

  final ThemeData theme = Style.theme();
  final HealthScheduleController controller = Get.put(HealthScheduleController());

  @override
  Widget build(BuildContext context) {
    final bool isSelected = controller.selectedDate == date;
    return InkWell(
      onTap: () => controller.onSelectDate(date),
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: 50,
        decoration: BoxDecoration(
          color: isSelected ? theme.colorScheme.primaryContainer : theme.colorScheme.surfaceContainer,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          children: [
            Text(
              DateFormat("dd").format(date),
              style: theme.textTheme.titleSmall?.copyWith(
                  height: 1.9, fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500, color: isSelected ? theme.colorScheme.onPrimaryContainer : null),
            ),
            const SizedBox(height: 6),
            Container(
              width: 36,
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                  color: isSelected ? theme.colorScheme.primary : theme.colorScheme.surfaceContainerHighest, borderRadius: BorderRadius.circular(4)),
              child: Center(
                  child: Text(
                DateFormat("E").format(date),
                style: theme.textTheme.bodySmall?.copyWith(color: isSelected ? theme.colorScheme.onPrimary : null),
              )),
            )
          ],
        ),
      ),
    );
  }
}

class AvailableScheduleList extends StatelessWidget {
  final HealthScheduleController controller = Get.put(HealthScheduleController());

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: controller.dates
          .map((date) => AvailableScheduleWidget(
                date: date,
              ))
          .toList(),
    );
  }
}

class SingleActivityWidget extends StatelessWidget {
  SingleActivityWidget({super.key, required this.time, required this.startContent, required this.title, required this.description});

  final Widget startContent;
  final String time;
  final String title;
  final String description;

  final ThemeData theme = Style.theme();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        startContent,
        const SizedBox(
          width: 16,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: theme.textTheme.titleSmall),
            Text(description, style: theme.textTheme.bodySmall),
          ],
        ),
        const Spacer(),
        const SizedBox(
          width: 16,
        ),
        Text(time, style: theme.textTheme.bodySmall),
      ],
    );
  }
}
