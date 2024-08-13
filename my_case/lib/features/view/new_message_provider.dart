import 'dart:async';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_case/core/core_platform/router/route_enums.dart';
import 'package:my_case/core/core_platform/router/router_keys.dart';
import 'package:my_case/data/repositories/request_repository.dart';
import 'package:my_case/features/notification/widgets/notification_widget.dart';
import 'package:collection/collection.dart';

class NewMessageProvider extends AsyncNotifier<bool> {
  @override
  FutureOr<bool> build() async {
    var cases = await RequestRepository().getCases();

    Timer.periodic(
      Duration(seconds: 2),
      (timer) async {
        cases = await RequestRepository().getCases();

        var caseWithMessage = cases.firstWhereOrNull((element) {
          return element.unreadMessageCount != null && element.unreadMessageCount! > 0;
        });
        if (caseWithMessage != null) {
          BotToast.showCustomNotification(
            duration: const Duration(seconds: 5),
            toastBuilder: (cancelFunc) {
              return NotificationWidget(
                title: "New Message",
                description: "Go to your request to see the message",
                onClick: () {
                  cancelFunc();
                  GoRouter.of(navKey.currentContext!).push(
                    NavigationEnums.chatScreen.routeName,
                    extra: caseWithMessage.id.toString(),
                  );
                },
              );
            },
          );
          timer.cancel();
        }
      },
    );

    return false;
  }
}

final newMessageProvider = AsyncNotifierProvider<NewMessageProvider, bool>(NewMessageProvider.new);
