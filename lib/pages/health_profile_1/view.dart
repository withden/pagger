// Base
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

// Need for specific page
import 'controller.dart';
import 'style.dart';

class HealthProfileView extends StatefulWidget {
  const HealthProfileView({super.key});

  @override
  State<HealthProfileView> createState() => _HealthProfileViewState();
}

class _HealthProfileViewState extends State<HealthProfileView> {
  final ThemeData theme = Style.theme();
  HealthProfileController controller = Get.put(HealthProfileController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: controller,
      tag: 'health_profile_1',
      builder: (controller) {
        return Theme(
          data: theme,
          child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  tooltip: "Back",
                  icon: const Icon(
                    Symbols.chevron_left_rounded,
                  ),
                  onPressed: controller.goBack),
              title: Text("Profile", style: theme.textTheme.titleMedium),
              actions: [
                IconButton(
                    tooltip: "Logout",
                    onPressed: controller.logout,
                    style: ButtonStyle(
                      overlayColor: WidgetStatePropertyAll(theme.colorScheme.errorContainer),
                    ),
                    icon: Icon(
                      Symbols.logout_rounded,
                      size: 18,
                      color: theme.colorScheme.error,
                    )),
                const SizedBox(
                  width: 16,
                )
              ],
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 210,
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: SizedBox(
                              height: 150,
                              child: Card(
                                margin: EdgeInsets.zero,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text("Anika Deb Sager", style: theme.textTheme.titleMedium),
                                    const SizedBox(height: 16),
                                    const Divider(
                                      height: 0,
                                    ),
                                    const SizedBox(height: 16),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text("25", style: theme.textTheme.titleSmall),
                                            const SizedBox(height: 2),
                                            Text("Years", style: theme.textTheme.bodySmall),
                                          ],
                                        ),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text("Male", style: theme.textTheme.titleSmall),
                                            const SizedBox(height: 2),
                                            Text("Gender", style: theme.textTheme.bodySmall)
                                          ],
                                        ),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text("5.10 ft", style: theme.textTheme.titleSmall),
                                            const SizedBox(height: 2),
                                            Text("Height", style: theme.textTheme.bodySmall)
                                          ],
                                        ),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text("147.7 lb", style: theme.textTheme.titleSmall),
                                            const SizedBox(height: 2),
                                            Text("Weight", style: theme.textTheme.bodySmall)
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 16),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          ClipOval(child: Image.asset('assets/avatars/avatar-1.jpg', height: 90, width: 90)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Wrap(
                      runSpacing: 4,
                      children: [
                        ListTile(
                          dense: true,
                          contentPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                          onTap: () {},
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          leading: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(40), color: theme.colorScheme.surfaceContainerHighest),
                            child: Icon(
                              Symbols.flag_rounded,
                              color: theme.colorScheme.onSurface,
                            ),
                          ),
                          title: Text(
                            "Goal",
                            style: theme.textTheme.titleSmall,
                          ),
                          trailing: const Icon(
                            Symbols.chevron_right_rounded,
                            size: 20,
                          ),
                        ),
                        ListTile(
                          dense: true,
                          contentPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                          onTap: () {},
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          leading: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(40), color: theme.colorScheme.surfaceContainerHighest),
                            child: Icon(Symbols.exercise_rounded, color: theme.colorScheme.onSurface),
                          ),
                          title: Text("Workout History", style: theme.textTheme.titleSmall),
                          trailing: const Icon(
                            Symbols.chevron_right_rounded,
                            size: 20,
                          ),
                        ),
                        ListTile(
                          dense: true,
                          contentPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                          onTap: () {},
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          leading: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(40), color: theme.colorScheme.surfaceContainerHighest),
                            child: Icon(Symbols.watch_rounded, color: theme.colorScheme.onSurface),
                          ),
                          title: Text("Activity Tracking", style: theme.textTheme.titleSmall),
                          trailing: const Icon(
                            Symbols.chevron_right_rounded,
                            size: 20,
                          ),
                        ),
                        ListTile(
                          dense: true,
                          contentPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                          onTap: () {},
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          leading: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(40), color: theme.colorScheme.surfaceContainerHighest),
                            child: Icon(Symbols.grocery_rounded, color: theme.colorScheme.onSurface),
                          ),
                          title: Text("Nutrition Tracking", style: theme.textTheme.titleSmall),
                          trailing: const Icon(
                            Symbols.chevron_right_rounded,
                            size: 20,
                          ),
                        ),
                        ListTile(
                          dense: true,
                          contentPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                          onTap: () {},
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          leading: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(40), color: theme.colorScheme.surfaceContainerHighest),
                            child: Icon(
                              Symbols.page_info_rounded,
                              color: theme.colorScheme.onSecondaryContainer,
                            ),
                          ),
                          title: Text("Setting", style: theme.textTheme.titleSmall),
                          trailing: const Icon(
                            Symbols.chevron_right_rounded,
                            size: 20,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
