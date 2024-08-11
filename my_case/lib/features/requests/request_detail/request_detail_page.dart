import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_case/core/core_platform/router/route_enums.dart';
import 'package:my_case/core/design_system/components/c_app_bar.dart';
import 'package:my_case/core/design_system/components/c_scaffold.dart';
import 'package:my_case/core/design_system/theme/c_colors.dart';
import 'package:my_case/core/extensions/text_theme_extensions.dart';
import 'package:my_case/features/requests/request_detail/widgets/request_status_item.dart';

class RequestDetailPageParams {
  final String requestId;
  final String status;
  const RequestDetailPageParams({
    required this.requestId,
    required this.status,
  });
}

class RequestDetailPage extends StatelessWidget {
  final RequestDetailPageParams params;
  const RequestDetailPage({
    super.key,
    required this.params,
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
                  Text(
                    'Request ID: ${params.requestId}',
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
                        GoRouter.of(context).push(
                          NavigationEnums.chatScreen.routeName,
                          extra: params.requestId,
                        );
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
            isCompleted: statusStep >= 1,
          ),
          LevelListItem(
            title: 'Request Viewed',
            step: '2',
            isCompleted: statusStep >= 2,
          ),
          LevelListItem(
            title: 'Request Reffered',
            step: '3',
            isCompleted: statusStep >= 3,
          ),
          LevelListItem(
            title: 'Case Worker Assigned',
            step: '4',
            isCompleted: statusStep >= 4,
          ),
          LevelListItem(
            title: 'Appointment Scheduled',
            step: '5',
            isCompleted: statusStep >= 5,
          ),
          LevelListItem(
            title: 'Case Closed',
            step: '6',
            isCompleted: statusStep >= 6,
          ),
        ],
      ),
    );
  }

  int get statusStep {
    switch (params.status) {
      case "REQUEST RECEIVED":
        return 1;
      case "REQUEST VIEWED":
        return 2;
      case "REQUEST REFERRED":
        return 3;
      case "CASE WORKER ASSIGNED":
        return 4;
      case "FIRST CONTACT SCHEDULED":
        return 5;
      case "CASE CLOSED":
        return 6;
      default:
        return 0;
    }
  }
}
