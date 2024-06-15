import 'package:flutter/material.dart';
import 'package:my_case/core/design_system/components/c_button.dart';
import 'package:my_case/core/design_system/components/c_list_tile.dart';
import 'package:my_case/core/design_system/theme/c_colors.dart';
import 'package:my_case/core/extensions/media_query_extension.dart';
import 'package:my_case/core/extensions/text_theme_extensions.dart';
import 'package:my_case/features/requests/widget/request_list_tile.dart';

class RequestsScreen extends StatelessWidget {
  const RequestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Requests',
            style: context.text20,
          ),
          const SizedBox(height: 16.0),
          Expanded(
            child: ListView(
              children: [
                RequestListTile(
                  title: 'Request 1',
                  subtitle: 'Request Received',
                  status: RequestStatus.requestReceived,
                  leading: Icon(Icons.person),
                ),
              ],
            ),
          ),
          CButton(
            text: 'Create New Request',
            onTap: () {},
            icon: Icons.add,
            iconPosition: AxisDirection.left,
            iconColor: Colors.white,
            color: CColors.primaryColor,
          ),
          const SizedBox(height: 16.0),
        ],
      ),
    );
  }
}
