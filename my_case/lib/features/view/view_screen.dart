import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_case/core/design_system/components/c_app_bar.dart';
import 'package:my_case/core/design_system/components/c_logo.dart';
import 'package:my_case/features/home/home_screen.dart';
import 'package:my_case/features/messages/messages_screen.dart';
import 'package:my_case/features/profile/profile_screen.dart';
import 'package:my_case/features/requests/requests_screen.dart';
import 'package:my_case/features/view/navigation_bar_notifier.dart';
import 'package:my_case/features/view/widgets/c_bottom_navigation_bar.dart';
import 'package:my_case/core/design_system/components/c_scaffold.dart';

class ViewScreen extends ConsumerWidget {
  const ViewScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _screens = [
      const HomeScreen(),
      const RequestsScreen(),
      // const MessagesScreen(),
      const ProfileScreen(),
    ];

    final navbarIndexProvider = ref.watch(navigationBarProvider);

    return CScaffold(
      appBar: CAppBar(
        title: const CLogo(
          size: 150,
          heroTag: "logo",
        ),
      ),
      body: _screens[navbarIndexProvider],
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
