import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_case/core/core_platform/router/route_enums.dart';
import 'package:my_case/core/design_system/components/c_button.dart';
import 'package:my_case/core/extensions/text_theme_extensions.dart';
import 'package:my_case/features/home/widgets/home_service_list_tile.dart';
import 'package:my_case/features/localization/strings.g.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _t = Translations.of(context);
    return Column(
      children: [
        Card(
          elevation: 10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                _t.home.title,
                textAlign: TextAlign.center,
                style: context.text28Bold,
              ),
              const SizedBox(height: 16),
              CButton(
                text: _t.home.actions.requestAssistance,
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
            clipBehavior: Clip.hardEdge,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _t.home.additionalServices.title,
                    style: context.text18Bold,
                  ),
                  const SizedBox(height: 16),
                  HomeServiceListTile(
                    title: _t.home.additionalServices.scholarships.title,
                    subtitle: _t.home.additionalServices.scholarships.description,
                    icon: Icons.school,
                  ),
                  HomeServiceListTile(
                    title: _t.home.additionalServices.joinJobpool.title,
                    subtitle: _t.home.additionalServices.joinJobpool.description,
                    icon: Icons.work,
                  ),
                  HomeServiceListTile(
                    title: _t.home.additionalServices.flagSocialTension.title,
                    subtitle: _t.home.additionalServices.flagSocialTension.description,
                    icon: Icons.flag,
                  ),
                  HomeServiceListTile(
                    title: _t.home.additionalServices.flagFraud.title,
                    subtitle: _t.home.additionalServices.flagFraud.description,
                    icon: Icons.warning,
                  ),
                  HomeServiceListTile(
                    title: _t.home.additionalServices.giveFeedback.title,
                    subtitle: _t.home.additionalServices.giveFeedback.description,
                    icon: Icons.feedback,
                  ),
                  HomeServiceListTile(
                    title: _t.home.additionalServices.checkResettlement.title,
                    subtitle: _t.home.additionalServices.checkResettlement.description,
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
