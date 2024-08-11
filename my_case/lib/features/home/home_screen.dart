import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_case/core/core_platform/router/route_enums.dart';
import 'package:my_case/core/design_system/components/c_button.dart';
import 'package:my_case/core/extensions/text_theme_extensions.dart';
import 'package:my_case/features/home/widgets/home_service_list_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 8),
        Card(
          elevation: 10,
          child: Column(
            children: [
              Text(
                "We can help.",
                style: context.text32Bold,
              ),
              const SizedBox(height: 16),
              CButton(
                text: "Request Assistance",
                onTap: () {
                  GoRouter.of(context).push(NavigationEnums.createRequestScreen.routeName);
                },
                horizontalMargin: 24,
                verticalPadding: 20,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Additional Services",
                    style: context.text18Bold,
                  ),
                  const SizedBox(height: 16),
                  HomeServiceListTile(
                    title: "Scholarships",
                    subtitle: "Find scholarships that match your profile",
                    icon: Icons.school,
                  ),
                  HomeServiceListTile(
                    title: "Join Jobpool",
                    subtitle: "Find jobs that match your profile",
                    icon: Icons.work,
                  ),
                  HomeServiceListTile(
                    title: "Flag Social Tension",
                    subtitle: "Report social tension in your area",
                    icon: Icons.flag,
                  ),
                  HomeServiceListTile(
                    title: "Flag Fraud",
                    subtitle: "Report fraud in your area",
                    icon: Icons.warning,
                  ),
                  HomeServiceListTile(
                    title: "Give Feedback",
                    subtitle: "Help us improve our services",
                    icon: Icons.feedback,
                  ),
                  HomeServiceListTile(
                    title: "Check Resettlement",
                    subtitle: "Check your resettlement status",
                    icon: Icons.check_circle,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
