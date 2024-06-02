import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_case/core/core_platform/router/route_enums.dart';
import 'package:my_case/core/design_system/components/c_button.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Center(
          child: CButton(
            onTap: () {
              GoRouter.of(context).push(NavigationEnums.chatScreen.routeName);
            },
            text: "Go to Chat",
          ),
        ),
      ],
    );
  }
}
