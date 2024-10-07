// Base
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

// Internal Shared Library

// Need for specific page
import 'controller.dart';
import 'style.dart';

class ShoppingOrdersView extends StatefulWidget {
  const ShoppingOrdersView({super.key});

  @override
  State<ShoppingOrdersView> createState() => _ShoppingOrdersViewState();
}

class _ShoppingOrdersViewState extends State<ShoppingOrdersView> {
  final ThemeData theme = Style.theme();
  ShoppingOrdersController controller = Get.put(ShoppingOrdersController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: controller,
      tag: 'shopping_orders_1',
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Symbols.chevron_left_rounded),
              onPressed: controller.goBack,
            ),
            title: Text("Orders", style: theme.textTheme.titleMedium),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Card(
                    margin: EdgeInsets.zero,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          color: theme.colorScheme.surfaceContainerHigh,
                          padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(
                                Symbols.box,
                                size: 28,
                              ),
                              const SizedBox(width: 12),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Booking / Tracking Number", style: theme.textTheme.bodySmall),
                                  const SizedBox(height: 2),
                                  Text("HDTD93647829", style: theme.textTheme.titleSmall),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          color: theme.colorScheme.surfaceContainerLow,
                          padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Status", style: theme.textTheme.titleSmall),
                                  Text("Packaging", style: theme.textTheme.titleSmall?.copyWith(color: Colors.orange)),
                                ],
                              ),
                              const Spacer(),
                              TextButton(
                                onPressed: () {},
                                child: Row(
                                  children: [
                                    Text("Track", style: theme.textTheme.titleMedium?.copyWith(color: theme.colorScheme.primary)),
                                    const SizedBox(width: 8),
                                    Icon(Symbols.chevron_right, size: 18, color: theme.colorScheme.primary)
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Card(
                    margin: EdgeInsets.zero,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          color: theme.colorScheme.surfaceContainerHigh,
                          padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Symbols.local_shipping,
                                color: theme.colorScheme.onSurface,
                                size: 28,
                              ),
                              const SizedBox(width: 12),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Booking/Tracking Number", style: theme.textTheme.bodySmall),
                                  const SizedBox(height: 4),
                                  Text("HDTD87452739", style: theme.textTheme.titleSmall?.copyWith(height: 1.1)),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          color: theme.colorScheme.surfaceContainerLow,
                          padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Status", style: theme.textTheme.titleSmall),
                                  Text("On The Way", style: theme.textTheme.titleSmall?.copyWith(color: Colors.blue)),
                                ],
                              ),
                              const Spacer(),
                              TextButton(
                                onPressed: () {},
                                child: Row(
                                  children: [
                                    Text("Track", style: theme.textTheme.titleMedium?.copyWith(color: theme.colorScheme.primary)),
                                    const SizedBox(width: 8),
                                    Icon(Symbols.chevron_right, size: 18, color: theme.colorScheme.primary)
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Card(
                    margin: EdgeInsets.zero,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          color: theme.colorScheme.surfaceContainerHigh,
                          padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Symbols.cancel,
                                color: theme.colorScheme.onSurface,
                                size: 28,
                              ),
                              const SizedBox(width: 12),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Booking/Tracking Number", style: theme.textTheme.bodySmall),
                                  const SizedBox(height: 4),
                                  Text("HDTD64869263", style: theme.textTheme.titleSmall?.copyWith(height: 1.1)),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          color: theme.colorScheme.surfaceContainerLow,
                          padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text("Status", style: theme.textTheme.titleSmall),
                              Text("Customer Cancelled", style: theme.textTheme.titleSmall?.copyWith(color: theme.colorScheme.error)),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Card(
                    margin: EdgeInsets.zero,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          color: theme.colorScheme.surfaceContainerHigh,
                          padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Symbols.service_toolbox,
                                color: theme.colorScheme.onSurface,
                                size: 28,
                              ),
                              const SizedBox(width: 12),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Booking/Tracking Number", style: theme.textTheme.bodySmall),
                                  const SizedBox(height: 4),
                                  Text("HDTD73846483", style: theme.textTheme.titleSmall?.copyWith(height: 1.1)),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          color: theme.colorScheme.surfaceContainerLow,
                          padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Status", style: theme.textTheme.titleSmall),
                                  Text("Delivered", style: theme.textTheme.titleSmall?.copyWith(color: Colors.green)),
                                ],
                              ),
                              const Spacer(),
                              TextButton(
                                onPressed: () {},
                                child: Row(
                                  children: [
                                    Text("Review", style: theme.textTheme.titleMedium?.copyWith(color: theme.colorScheme.primary)),
                                    const SizedBox(width: 8),
                                    Icon(Symbols.chevron_right, size: 18, color: theme.colorScheme.primary)
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Card(
                    margin: EdgeInsets.zero,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          color: theme.colorScheme.surfaceContainerHigh,
                          padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Symbols.service_toolbox,
                                color: theme.colorScheme.onSurface,
                                size: 28,
                              ),
                              const SizedBox(width: 12),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Booking/Tracking Number", style: theme.textTheme.bodySmall),
                                  const SizedBox(height: 4),
                                  Text("HDTD64869263", style: theme.textTheme.titleSmall?.copyWith(height: 1.1)),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          color: theme.colorScheme.surfaceContainerLow,
                          padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Status", style: theme.textTheme.titleSmall),
                                  Text("Delivered", style: theme.textTheme.titleSmall?.copyWith(color: Colors.green)),
                                ],
                              ),
                              const Spacer(),
                              TextButton(
                                onPressed: () {},
                                child: Row(
                                  children: [
                                    Text("Review", style: theme.textTheme.titleMedium?.copyWith(color: theme.colorScheme.primary)),
                                    const SizedBox(width: 8),
                                    Icon(Symbols.chevron_right, size: 18, color: theme.colorScheme.primary)
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
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
