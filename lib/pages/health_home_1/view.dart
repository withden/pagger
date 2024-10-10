// Base
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

// Need for specific page
import 'controller.dart';
import 'style.dart';
import 'widgets.dart';

class HealthViewView extends StatefulWidget {
  const HealthViewView({super.key});

  @override
  State<HealthViewView> createState() => _HealthViewViewState();
}

class _HealthViewViewState extends State<HealthViewView> {
  final ThemeData theme = Style.theme();
  HealthHomeController controller = Get.put(HealthHomeController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: controller,
      tag: 'health_home_1',
      builder: (controller) {
        return Theme(
          data: theme,
          child: Scaffold(
            appBar: AppBar(
              leading: IconButton(icon: const Icon(Symbols.chevron_left_rounded), onPressed: controller.goBack),
              title: Text("Hello, Jakob!", style: theme.textTheme.titleMedium),
              actions: [
                IconButton(
                    icon: const Icon(
                      Symbols.notifications_rounded,
                      size: 20,
                    ),
                    onPressed: controller.goNotification),
                const SizedBox(
                  width: 4,
                ),
                ClipOval(
                  child: Image.asset('assets/avatars/avatar-1.jpg', height: 24, width: 24, fit: BoxFit.cover),
                ),
                const SizedBox(
                  width: 16,
                )
              ],
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    margin: EdgeInsets.zero,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: theme.colorScheme.surfaceContainerHighest,
                                ),
                                child: const Icon(Symbols.cookie_rounded, size: 24),
                              ),
                              const SizedBox(width: 12),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Glucose: 5.6 mmol/L", style: theme.textTheme.titleSmall),
                                  Text("You're on good state!", style: theme.textTheme.bodySmall),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Divider(height: 0),
                        const SizedBox(height: 16),
                        Padding(
                          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                children: [
                                  const Icon(Symbols.arrow_upward_rounded, size: 20),
                                  const SizedBox(width: 8),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("High", style: theme.textTheme.titleSmall),
                                      RichText(
                                          text: TextSpan(children: [
                                        TextSpan(text: "8.5 ", style: theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w600)),
                                        TextSpan(text: "mmol/L", style: theme.textTheme.bodySmall),
                                      ]))
                                    ],
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      color: theme.colorScheme.secondary,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(Symbols.check_rounded, size: 16, color: theme.colorScheme.onSecondary),
                                  ),
                                  const SizedBox(width: 8),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Normal", style: theme.textTheme.titleSmall),
                                      RichText(
                                          text: TextSpan(children: [
                                        TextSpan(text: "5.5 ", style: theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w600)),
                                        TextSpan(text: "mmol/L", style: theme.textTheme.bodySmall),
                                      ]))
                                    ],
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  const Icon(Symbols.arrow_downward, size: 20),
                                  const SizedBox(width: 8),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Low", style: theme.textTheme.titleSmall),
                                      RichText(
                                          text: TextSpan(children: [
                                        TextSpan(text: "3.5 ", style: theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w600)),
                                        TextSpan(text: "mmol/L", style: theme.textTheme.bodySmall),
                                      ]))
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  WellnessWidget(),
                  const SizedBox(height: 12),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    Text("Your Activity", style: theme.textTheme.titleMedium),
                    TextButton(
                        onPressed: controller.seeAllYourActivity,
                        child: Text("See All", style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.primary))),
                  ]),
                  const SizedBox(height: 12),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: CaloriesWidget()),
                      const SizedBox(width: 16),
                      Expanded(child: SleepWidget()),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    Text("Indicators", style: theme.textTheme.titleMedium),
                    TextButton(
                        onPressed: controller.seeAllIndicators,
                        child: Text("See All", style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.primary))),
                  ]),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(child: StepWidget()),
                      const SizedBox(width: 16),
                      Expanded(child: PulseRateWidget()),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
