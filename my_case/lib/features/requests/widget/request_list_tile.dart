import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_case/core/core_platform/router/route_enums.dart';
import 'package:my_case/core/design_system/components/c_list_tile.dart';
import 'package:my_case/core/design_system/theme/c_colors.dart';
import 'package:my_case/core/extensions/text_theme_extensions.dart';
import 'package:my_case/features/requests/request_detail/request_detail_page.dart';
import 'package:intl/intl.dart';

// enum RequestStatus {
//   requestReceived,
//   requestViewed,
//   requestReffered,
//   caseWorkerAssigned,
//   interviewScheduled,
//   caseClosed,
// }

class RequestListTile extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final Widget? leading;
  final String? status;
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
    var dateFormatted = DateFormat('dd/MM/yyyy').format(DateTime.now());
    return InkWell(
      onTap: () {
        GoRouter.of(context).push(
          NavigationEnums.requestDetailScreen.routeName,
          extra: RequestDetailPageParams(
            requestId: caseId ?? '',
            status: status ?? '',
          ),
        );
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
                      SizedBox(
                        width: 200,
                        child: RichText(
                          text: TextSpan(
                            text: 'Status: ',
                            style: context.text14,
                            children: <TextSpan>[
                              TextSpan(
                                text: status ?? '',
                                style: TextStyle(color: statusColor),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        dateFormatted,
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
      case "REQUEST RECEIVED":
        return Colors.blue;
      case "REQUEST VIEWED":
        return Colors.green;
      case "REQUEST REFERRED":
        return Colors.orange;
      case "CASE WORKER ASSIGNED":
        return Colors.purple;
      case "FIRST CONTACT SCHEDULED":
        return Colors.teal;
      case "CASE CLOSED":
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}
