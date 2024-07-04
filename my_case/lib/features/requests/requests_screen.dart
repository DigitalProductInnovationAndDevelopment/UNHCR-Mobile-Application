import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_case/core/design_system/components/c_button.dart';
import 'package:my_case/core/design_system/components/c_skeleton.dart';
import 'package:my_case/core/design_system/theme/c_colors.dart';
import 'package:my_case/core/extensions/text_theme_extensions.dart';
import 'package:my_case/features/requests/requests_notifier.dart';
import 'package:my_case/features/requests/widget/request_list_tile.dart';

class RequestsScreen extends ConsumerWidget {
  const RequestsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final requests = ref.watch(requestsNotifierProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Requests',
            style: context.text24Bold,
          ),
          const SizedBox(height: 16.0),
          requests.when(
            skipLoadingOnRefresh: false,
            data: (data) {
              return Expanded(
                child: RefreshIndicator(
                  onRefresh: () async {
                    ref.invalidate(requestsNotifierProvider);
                  },
                  child: ListView.separated(
                    separatorBuilder: (context, index) => const SizedBox(height: 16.0),
                    itemCount: data.cases?.length ?? 0,
                    itemBuilder: (context, index) {
                      final _case = data.cases?[index];
                      return RequestListTile(
                        title: _case?.description ?? '',
                        subtitle: _case?.status ?? '',
                        status: _case?.status == 'Open'
                            ? RequestStatus.requestReceived
                            : RequestStatus.caseClosed,
                        leading: Icon(Icons.person),
                      );
                    },
                  ),
                ),
              );
            },
            loading: () {
              return Expanded(
                child: ListView.separated(
                  itemCount: 3,
                  separatorBuilder: (context, index) => const SizedBox(height: 16.0),
                  itemBuilder: (context, index) {
                    return CSkeleton(
                      height: 80.0,
                    );
                  },
                ),
              );
            },
            error: (error, stackTrace) => Center(
              child: Text('Error: $error'),
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
