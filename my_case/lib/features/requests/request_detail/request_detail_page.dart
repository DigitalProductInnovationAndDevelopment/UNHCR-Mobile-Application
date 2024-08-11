import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_case/core/core_platform/router/route_enums.dart';
import 'package:my_case/core/design_system/components/c_app_bar.dart';
import 'package:my_case/core/design_system/components/c_scaffold.dart';
import 'package:my_case/core/design_system/theme/c_colors.dart';
import 'package:my_case/core/extensions/text_theme_extensions.dart';
import 'package:my_case/features/requests/request_detail/widgets/request_status_item.dart';

class RequestDetailPage extends StatelessWidget {
  final String? requestId;
  const RequestDetailPage({
    super.key,
    this.requestId,
  });

  @override
  Widget build(BuildContext context) {
    return CScaffold(
      appBar: CAppBar(),
      body: Column(
        children: [
          const SizedBox(height: 16.0),
          Row(
            children: [
              const SizedBox(width: 16.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (requestId != null)
                    Text(
                      'Request ID: $requestId',
                      style: context.text16,
                    ),
                ],
              ),
              Spacer(),
              Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: TextButton.icon(
                      style: TextButton.styleFrom(
                        backgroundColor: CColors.primaryColor,
                      ),
                      onPressed: () {
                        GoRouter.of(context).push(NavigationEnums.chatScreen.routeName);
                      },
                      label: Text(
                        "Go to Chat",
                        style: context.text16.copyWith(color: CColors.white),
                      ),
                      icon: Icon(
                        Icons.message,
                        color: CColors.white,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: 20.0,
                      height: 20.0,
                      decoration: BoxDecoration(
                        color: CColors.error,
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                      child: Center(
                        child: Text(
                          '1',
                          style: context.text12.copyWith(color: CColors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 16.0),
            ],
          ),
          const SizedBox(height: 24.0),
          LevelListItem(
            title: 'Request Received',
            step: '1',
            isCompleted: true,
          ),
          LevelListItem(
            title: 'Request Viewed',
            step: '2',
            isCurrent: true,
          ),
          LevelListItem(
            title: 'Request Reffered',
            step: '3',
            showLine: true,
            isNext: true,
          ),
          LevelListItem(
            title: 'Case Worker Assigned',
            step: '4',
            showLine: true,
            isNext: true,
          ),
          LevelListItem(
            title: 'Appointment Scheduled',
            step: '5',
            showLine: true,
            isNext: true,
          ),
          LevelListItem(
            title: 'Case Closed',
            step: '6',
            showLine: false,
            isNext: true,
          ),
        ],
      ),
    );
  }
}
