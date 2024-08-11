import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_case/core/design_system/components/c_app_bar.dart';
import 'package:my_case/core/design_system/components/c_scaffold.dart';
import 'package:my_case/core/extensions/text_theme_extensions.dart';
import 'package:my_case/features/localization/localization_model.dart';
import 'package:my_case/features/localization/localization_notifier.dart';
import 'package:my_case/features/localization/strings.g.dart';
import 'package:my_case/features/profile/profile_notifier.dart';
import 'package:my_case/features/profile/profile_ui_model.dart';
import 'package:my_case/features/profile/widgets/profile_image_widget.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _t = Translations.of(context);

    ProfileUIModel? profileUIModel;
    LocalizationModel? localizationModel;
    final profileProvider = ref.watch(profileNotifierProvider);

    profileProvider.when(
      data: (data) {
        profileUIModel = data;
      },
      loading: () {},
      error: (error, stackTrace) {},
    );
    if (profileUIModel == null)
      return Center(
        child: Column(
          children: [
            const CircularProgressIndicator(),
          ],
        ),
      );

    var localizationNotifier = ref.watch(localizationNotifierProvider);
    localizationNotifier.when(
      data: (data) {
        localizationModel = data;
      },
      loading: () {},
      error: (error, stackTrace) {},
    );

    return CScaffold(
      appBar: CAppBar(),
      body: Column(
        children: [
          Center(
            child: ProfileImageWidget(
              radius: 60,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            "${profileUIModel?.profileModel?.name ?? ""} ${profileUIModel?.profileModel?.surname ?? ""}",
            style: context.text20,
          ),
          Expanded(
            child: SettingsList(
              sections: [
                SettingsSection(
                  title: Text(_t.profile.settings.title),
                  tiles: <SettingsTile>[
                    SettingsTile.switchTile(
                      title: Text(_t.profile.settings.receiveNotifications),
                      initialValue: true,
                      onToggle: (value) {},
                    ),
                    SettingsTile.switchTile(
                      title: Text(_t.profile.settings.receiveMessages),
                      initialValue: true,
                      onToggle: (value) {},
                    ),
                    SettingsTile.navigation(
                      title: Text(_t.profile.settings.language),
                      value: Text(
                        SupportedLocales.getSupportedLanguages()
                            .firstWhere(
                              (element) => element.values.first == localizationModel?.language,
                            )
                            .values
                            .last,
                      ),
                      onPressed: (context) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text(_t.profile.settings.language),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ...SupportedLocales.getSupportedLanguages()
                                      .map((e) => ListTile(
                                            title: Text(e.values.last),
                                            onTap: () {
                                              var appLocale = AppLocale.values.firstWhere(
                                                (element) => element.languageCode == e.values.first,
                                              );

                                              LocaleSettings.setLocale(appLocale);
                                              GoRouter.of(context).pop();
                                            },
                                          ))
                                      .toList(),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
