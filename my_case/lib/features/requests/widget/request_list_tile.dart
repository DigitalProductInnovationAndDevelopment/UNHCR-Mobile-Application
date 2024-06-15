import 'package:flutter/material.dart';
import 'package:my_case/core/design_system/components/c_list_tile.dart';

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
  const RequestListTile({
    super.key,
    this.title,
    this.subtitle,
    this.leading,
    this.status,
  });

  @override
  Widget build(BuildContext context) {
    return CListTile(
      title: title,
      subtitle: subtitle,
      leading: leading,
      trailing: status != null
          ? Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: statusColor,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                statusText,
                style: TextStyle(color: Colors.white),
              ),
            )
          : null,
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
        return 'Request Received';
      case RequestStatus.requestViewed:
        return 'Request Viewed';
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
