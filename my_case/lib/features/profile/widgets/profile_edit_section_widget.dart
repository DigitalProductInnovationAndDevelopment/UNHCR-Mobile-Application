import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_case/core/core_platform/router/route_enums.dart';
import 'package:my_case/core/design_system/components/c_button.dart';
import 'package:my_case/features/authentication/authenticator/authenticator_notifier.dart';
import 'package:my_case/features/localization/strings.g.dart';
import 'package:my_case/features/profile/profile_notifier.dart';
import 'package:my_case/features/profile/profile_ui_model.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:intl/intl.dart';

class ProfileEditSectionWidget extends ConsumerWidget {
  const ProfileEditSectionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _t = Translations.of(context);

    ProfileUIModel? profileUIModel;
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

    var dateOfBirth = DateTime.parse(profileUIModel?.profileModel?.dateOfBirth ?? '');
    return Expanded(
      child: SettingsList(
        sections: [
          SettingsSection(
            title: Text(
              _t.profile.personalInformation.title,
            ),
            tiles: <SettingsTile>[
              SettingsTile.navigation(
                leading: Icon(Icons.person),
                title: Text(_t.profile.personalInformation.name),
                value: Text(profileUIModel?.profileModel?.name ?? ''),
              ),
              SettingsTile.navigation(
                leading: Icon(Icons.person),
                title: Text(_t.profile.personalInformation.surname),
                value: Text(profileUIModel?.profileModel?.surname ?? ''),
              ),
              SettingsTile.navigation(
                leading: Icon(Icons.cake),
                title: Text(_t.profile.personalInformation.dateOfBirth),
                value: Text(DateFormat('dd/MM/yyyy').format(dateOfBirth)),
              ),
              SettingsTile.navigation(
                leading: Icon(Icons.location_on),
                title: Text(_t.profile.personalInformation.location),
                value: Text(profileUIModel?.profileModel?.countryOfAsylum ?? ''),
              ),
              SettingsTile.navigation(
                leading: Icon(Icons.family_restroom),
                title: Text(_t.profile.personalInformation.householdSize),
                value: Text(profileUIModel?.profileModel?.householdPersonCount?.toString() ?? ''),
              ),
            ],
          ),
          SettingsSection(
            title: Text(_t.profile.account.title),
            tiles: <SettingsTile>[
              SettingsTile(
                leading: Icon(Icons.email),
                title: Text(_t.profile.account.email),
                value: Text(profileUIModel?.profileModel?.emailAddress ?? ''),
              ),
              SettingsTile.navigation(
                leading: Icon(Icons.phone),
                title: Text(_t.profile.account.phoneNumber),
                value: Text(profileUIModel?.profileModel?.phoneNumber ?? ''),
              ),
            ],
          ),
          SettingsSection(
            title: Text(_t.profile.unhcrInformation.title),
            tiles: <SettingsTile>[
              SettingsTile(
                leading: Icon(Icons.confirmation_number),
                title: Text(_t.profile.unhcrInformation.unhcrCaseNumber),
                value: Text(profileUIModel?.profileModel?.unHCRIndividualId ?? ''),
              ),
              SettingsTile.navigation(
                leading: Icon(Icons.confirmation_number),
                title: Text(_t.profile.unhcrInformation.unhcrCaseNumber),
                value: Text(profileUIModel?.profileModel?.unHCRIndividualId ?? ''),
              ),
            ],
          ),
          SettingsSection(
            title: Text(''),
            tiles: <SettingsTile>[
              SettingsTile(
                title: Text('Logout'),
                leading: Icon(Icons.logout),
                onPressed: (context) async {
                  EasyLoading.show();
                  await ref.read(authenticatorNotifierProvider.notifier).logout();
                  GoRouter.of(context).go(NavigationEnums.authenticator.routeName);
                  EasyLoading.dismiss();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
