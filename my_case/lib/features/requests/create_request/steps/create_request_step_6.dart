import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:my_case/core/core_platform/router/route_enums.dart';
import 'package:my_case/core/design_system/components/c_app_bar.dart';
import 'package:my_case/core/design_system/components/c_button.dart';
import 'package:my_case/core/design_system/components/c_scaffold.dart';
import 'package:my_case/core/design_system/theme/c_colors.dart';
import 'package:my_case/core/extensions/text_theme_extensions.dart';
import 'package:my_case/features/requests/create_request/create_request_notifier.dart';
import 'package:my_case/features/requests/create_request/create_request_ui_model.dart';

class CreateRequestStep6Screen extends ConsumerStatefulWidget {
  const CreateRequestStep6Screen({super.key});

  @override
  ConsumerState<CreateRequestStep6Screen> createState() => _CreateRequestStep6ScreenState();
}

class _CreateRequestStep6ScreenState extends ConsumerState<CreateRequestStep6Screen>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  bool _isSubmitting = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    CreateRequestUiModel? uiModel;
    final createRequestProvider = ref.watch(createRequestNotifierProvider);

    createRequestProvider.when(
      data: (data) {
        uiModel = data;
      },
      error: (error, stackTrace) {
        if (!EasyLoading.isShow) {
          EasyLoading.showError("An error occurred. Please try again later.");
        }
      },
      loading: () {},
    );

    return CScaffold(
      appBar: CAppBar(
        showSteps: true,
        currentStep: 6,
        totalSteps: 6,
        title: Text(
          "Create Request",
          style: context.text18Bold,
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  Text(
                    "Review your inputs. If everything is in order, submit your request.",
                    style: context.text16,
                  ),
                  const SizedBox(height: 32),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Text(
                            "Category: ",
                            style: context.text16Bold,
                          ),
                          Text(
                            uiModel?.selectedCategory ?? "",
                            style: context.text16,
                          ),
                          const Spacer(),
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              for (int i = 0; i < 5; i++) {
                                GoRouter.of(context).pop();
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Case Types: ",
                                style: context.text16Bold,
                              ),
                              const Spacer(),
                              IconButton(
                                icon: Icon(Icons.edit),
                                onPressed: () {
                                  for (var i = 0; i < 4; i++) {
                                    GoRouter.of(context).pop();
                                  }
                                },
                              ),
                            ],
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                ...uiModel?.selectedCaseTypes?.map((caseType) {
                                      var text = uiModel?.caseTypes
                                          ?.firstWhere((element) => element.id == caseType)
                                          .name;
                                      return Padding(
                                        padding: const EdgeInsets.only(right: 8),
                                        child: FilterChip(
                                          label: Text(text ?? ""),
                                          selected: true,
                                          onSelected: (value) {},
                                          selectedShadowColor: CColors.primaryColor,
                                          labelStyle: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      );
                                    }).toList() ??
                                    [],
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Text(
                            "Case Description: ",
                            style: context.text16Bold,
                          ),
                          Flexible(
                            child: Text(
                              uiModel?.caseDescription ?? "",
                              style: context.text16,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const Spacer(),
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              for (var i = 0; i < 3; i++) {
                                GoRouter.of(context).pop();
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Special Needs: ",
                                style: context.text16Bold,
                              ),
                              const Spacer(),
                              IconButton(
                                icon: Icon(Icons.edit),
                                onPressed: () {
                                  for (var i = 0; i < 2; i++) {
                                    GoRouter.of(context).pop();
                                  }
                                },
                              ),
                            ],
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                ...uiModel?.selectedSpecialNeeds?.map((specialNeed) {
                                      var text = uiModel?.specialNeeds
                                          ?.firstWhere((element) => element.id == specialNeed)
                                          .name;
                                      return Padding(
                                        padding: const EdgeInsets.only(right: 8),
                                        child: FilterChip(
                                          label: Text(text ?? ""),
                                          selected: true,
                                          onSelected: (value) {},
                                          selectedShadowColor: CColors.primaryColor,
                                          labelStyle: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      );
                                    }).toList() ??
                                    [],
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Documents: ",
                                style: context.text16Bold,
                              ),
                              const Spacer(),
                              IconButton(
                                icon: Icon(Icons.edit),
                                onPressed: () {
                                  GoRouter.of(context).pop();
                                },
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                ...uiModel?.selectedDocumentPaths?.map((path) {
                                      return Container(
                                        padding: const EdgeInsets.only(bottom: 8, right: 8),
                                        child: Row(
                                          children: [
                                            Icon(Icons.file_copy),
                                            const SizedBox(width: 8),
                                            Text(
                                              path.split("/").last,
                                              style: context.text14,
                                            ),
                                          ],
                                        ),
                                      );
                                    }).toList() ??
                                    [],
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  CButton(
                    text: "Submit",
                    verticalPadding: 12,
                    onTap: () async {
                      setState(() {
                        _isSubmitting = true;
                      });

                      _controller
                        ..duration = const Duration(milliseconds: 2000)
                        ..forward()
                        ..repeat();

                      await ref.read(createRequestNotifierProvider.notifier).submitRequest();

                      _controller.stop();
                      GoRouter.of(context).go(NavigationEnums.viewScreen.routeName);
                    },
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
          if (_isSubmitting)
            Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.white.withOpacity(0.9),
              child: Lottie.asset(
                'assets/lottie/unhcr.json',
                controller: _controller,
              ),
            ),
        ],
      ),
    );
  }
}
