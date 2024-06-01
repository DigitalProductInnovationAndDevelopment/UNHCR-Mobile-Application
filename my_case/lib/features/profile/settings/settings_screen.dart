import 'package:flutter/material.dart';
import 'package:my_case/core/design_system/components/c_app_bar.dart';
import 'package:my_case/core/design_system/components/c_scaffold.dart';
import 'package:my_case/core/extensions/text_theme_extensions.dart';
import 'package:my_case/features/profile/widgets/profile_image_widget.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            "John Doe",
            style: context.text20,
          ),
          Expanded(
            child: SettingsList(
              sections: [
                SettingsSection(
                  title: Text('Notifications'),
                  tiles: <SettingsTile>[
                    SettingsTile.switchTile(
                      title: Text('Receive Notifications'),
                      initialValue: true,
                      onToggle: (value) {},
                    ),
                    SettingsTile.switchTile(
                      title: Text('Receive Messages'),
                      initialValue: true,
                      onToggle: (value) {},
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
