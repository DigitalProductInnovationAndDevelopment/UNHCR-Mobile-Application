import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_case/core/core_platform/router/route_enums.dart';
import 'package:my_case/features/authentication/authenticator/authenticator_notifier.dart';
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
            title: Text('Personal Information'),
            tiles: <SettingsTile>[
              SettingsTile.navigation(
                leading: Icon(Icons.person),
                title: Text('Name'),
                value: Text(profileUIModel?.profileModel?.name ?? ''),
              ),
              SettingsTile.navigation(
                leading: Icon(Icons.person),
                title: Text('Surname'),
                value: Text(profileUIModel?.profileModel?.surname ?? ''),
              ),
              SettingsTile.navigation(
                leading: Icon(Icons.cake),
                title: Text('Date of Birth'),
                value: Text(DateFormat('dd/MM/yyyy').format(dateOfBirth)),
              ),
              SettingsTile.navigation(
                leading: Icon(Icons.location_on),
                title: Text('Location'),
                value: Text(profileUIModel?.profileModel?.countryOfAsylum ?? ''),
              ),
              SettingsTile.navigation(
                leading: Icon(Icons.family_restroom),
                title: Text('Household Size'),
                value: Text(profileUIModel?.profileModel?.householdPersonCount?.toString() ?? ''),
              ),
            ],
          ),
          SettingsSection(
            title: Text('Account'),
            tiles: <SettingsTile>[
              SettingsTile(
                leading: Icon(Icons.email),
                title: Text('Email'),
                value: Text(profileUIModel?.profileModel?.emailAddress ?? ''),
              ),
              SettingsTile.navigation(
                leading: Icon(Icons.phone),
                title: Text('Phone Number'),
                value: Text(profileUIModel?.profileModel?.phoneNumber ?? ''),
              ),
            ],
          ),
          SettingsSection(
            title: Text('UNHCR Information'),
            tiles: <SettingsTile>[
              SettingsTile(
                leading: Icon(Icons.confirmation_number),
                title: Text('UNHCR Case Number'),
                value: Text(profileUIModel?.profileModel?.unHCRIndividualId ?? ''),
              ),
              SettingsTile.navigation(
                leading: Icon(Icons.confirmation_number),
                title: Text('CoA ID Number'),
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
