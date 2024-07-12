import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_case/core/core_platform/router/route_enums.dart';
import 'package:my_case/core/design_system/components/c_list_tile.dart';
import 'package:my_case/core/design_system/theme/c_colors.dart';
import 'package:my_case/core/extensions/text_theme_extensions.dart';

enum RequestStatus {
  requestReceived,
  requestViewed,
  requestReffered,
  caseWorkerAssigned,
  interviewScheduled,
  caseClosed,
}

class RequestListTile extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final Widget? leading;
  final RequestStatus? status;
  final String? caseId;
  const RequestListTile({
    super.key,
    this.title,
    this.subtitle,
    this.leading,
    this.status,
    this.caseId,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).push(NavigationEnums.requestDetailScreen.routeName);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        decoration: BoxDecoration(
          color: CColors.grey,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          children: [
            CListTile(
              title: Text(
                title ?? '',
                style: context.text16.copyWith(),
              ),
              subtitle: null,
              leading: leading,
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 16.0,
                color: CColors.black.withOpacity(0.5),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Case ID: $caseId',
                    style: context.text12.copyWith(color: CColors.black.withOpacity(0.5)),
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    children: [
                      RichText(
                        text: TextSpan(
                          text: 'Status: ',
                          style: context.text14,
                          children: <TextSpan>[
                            TextSpan(
                              text: statusText,
                              style: TextStyle(color: statusColor),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Text(
                        "02/06/2024",
                        style: context.text12.copyWith(color: CColors.black.withOpacity(0.5)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color get statusColor {
    switch (status) {
      case RequestStatus.requestReceived:
        return Colors.blue;
      case RequestStatus.requestViewed:
        return Colors.green;
      case RequestStatus.requestReffered:
        return Colors.orange;
      case RequestStatus.caseWorkerAssigned:
        return Colors.purple;
      case RequestStatus.interviewScheduled:
        return Colors.teal;
      case RequestStatus.caseClosed:
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  String get statusText {
    switch (status) {
      case RequestStatus.requestReceived:
        return 'Pending';
      case RequestStatus.requestViewed:
        return 'Pending';
      case RequestStatus.requestReffered:
        return 'Request Reffered';
      case RequestStatus.caseWorkerAssigned:
        return 'Case Worker Assigned';
      case RequestStatus.interviewScheduled:
        return 'Interview Scheduled';
      case RequestStatus.caseClosed:
        return 'Case Closed';
      default:
        return '';
    }
  }
}
