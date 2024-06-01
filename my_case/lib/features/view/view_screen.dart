import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_case/core/design_system/components/c_app_bar.dart';
import 'package:my_case/features/view/navigation_bar_notifier.dart';
import 'package:my_case/features/view/widgets/c_bottom_navigation_bar.dart';
import 'package:my_case/core/design_system/components/c_scaffold.dart';

class ViewScreen extends ConsumerWidget {
  const ViewScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(navigationBarProvider);

    return const CScaffold(
      appBar: CAppBar(),
      body: Center(
        child: Text("Home Screen"),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
