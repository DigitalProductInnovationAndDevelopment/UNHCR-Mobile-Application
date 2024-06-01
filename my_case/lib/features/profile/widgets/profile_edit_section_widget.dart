import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

class ProfileEditSectionWidget extends StatelessWidget {
  const ProfileEditSectionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SettingsList(
        sections: [
          SettingsSection(
            title: Text('Personal Information'),
            tiles: <SettingsTile>[
              SettingsTile.navigation(
                leading: Icon(Icons.person),
                title: Text('Name'),
                value: Text('John'),
              ),
              SettingsTile.navigation(
                leading: Icon(Icons.person),
                title: Text('Surname'),
                value: Text('Doe'),
              ),
              SettingsTile.navigation(
                leading: Icon(Icons.cake),
                title: Text('Date of Birth'),
                value: Text('01.01.1990'),
              ),
              SettingsTile.navigation(
                leading: Icon(Icons.location_on),
                title: Text('Location'),
                value: Text('New York, USA'),
              ),
              SettingsTile.navigation(
                leading: Icon(Icons.family_restroom),
                title: Text('Household Size'),
                value: Text('5'),
              ),
            ],
          ),
          SettingsSection(
            title: Text('Account'),
            tiles: <SettingsTile>[
              SettingsTile(
                leading: Icon(Icons.email),
                title: Text('Email'),
                value: Text('johndoe@gmail.com'),
              ),
              SettingsTile.navigation(
                leading: Icon(Icons.phone),
                title: Text('Phone Number'),
                value: Text('+11234567890'),
              ),
            ],
          ),
          SettingsSection(
            title: Text('UNHCR Information'),
            tiles: <SettingsTile>[
              SettingsTile(
                leading: Icon(Icons.confirmation_number),
                title: Text('UNHCR Case Number'),
                value: Text('1234567890'),
              ),
              SettingsTile.navigation(
                leading: Icon(Icons.confirmation_number),
                title: Text('CoA ID Number'),
                value: Text('1234567890'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
