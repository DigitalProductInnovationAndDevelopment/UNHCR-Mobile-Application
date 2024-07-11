import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_case/core/core_platform/router/route_enums.dart';
import 'package:my_case/features/authentication/authenticator/authenticator.dart';
import 'package:my_case/features/authentication/sign_in/sign_in_screen.dart';
import 'package:my_case/features/authentication/sign_up/sign_up_screen.dart';
import 'package:my_case/features/authentication/sign_up/sign_up_screen_step2.dart';
import 'package:my_case/features/authentication/sign_up/sign_up_screen_step3.dart';
import 'package:my_case/features/authentication/sign_up/sign_up_ui_model.dart';
import 'package:my_case/features/messages/chat/chat_screen.dart';
import 'package:my_case/features/profile/settings/settings_screen.dart';
import 'package:my_case/features/requests/create_request/create_request_screen.dart';
import 'package:my_case/features/requests/create_request/steps/create_request_step_2.dart';
import 'package:my_case/features/requests/create_request/steps/create_request_step_3.dart';
import 'package:my_case/features/requests/create_request/steps/create_request_step_4.dart';
import 'package:my_case/features/requests/create_request/steps/create_request_step_5.dart';
import 'package:my_case/features/requests/create_request/steps/create_request_step_6.dart';
import 'package:my_case/features/requests/request_detail/request_detail_page.dart';
import 'package:my_case/features/view/view_screen.dart';
import 'package:my_case/features/information/what_is_my_case/what_is_my_case_screen.dart';

List<RouteBase> goRouterRoutes = <RouteBase>[
  GoRoute(
    path: NavigationEnums.authenticator.routeName,
    builder: (BuildContext context, GoRouterState state) {
      return const Authenticator();
    },
  ),
  GoRoute(
    path: NavigationEnums.viewScreen.routeName,
    builder: (BuildContext context, GoRouterState state) {
      return const ViewScreen();
    },
  ),
  GoRoute(
    path: NavigationEnums.signInScreen.routeName,
    builder: (BuildContext context, GoRouterState state) {
      return const SignInScreen();
    },
  ),
  GoRoute(
    path: NavigationEnums.signUpScreen.routeName,
    builder: (BuildContext context, GoRouterState state) {
      return const SignUpScreen();
    },
  ),
  GoRoute(
    path: NavigationEnums.signUpScreenStep2.routeName,
    builder: (BuildContext context, GoRouterState state) {
      return SignUpScreenStep2(
        signUpUiModel: state.extra as SignUpUiModel,
      );
    },
  ),
  GoRoute(
    path: NavigationEnums.signUpScreenStep3.routeName,
    builder: (BuildContext context, GoRouterState state) {
      return SignUpScreenStep3(
        signUpUiModel: state.extra as SignUpUiModel,
      );
    },
  ),
  GoRoute(
    path: NavigationEnums.whatIsMyCaseScreen.routeName,
    builder: (BuildContext context, GoRouterState state) {
      return const WhatIsMyCaseScreen();
    },
  ),
  GoRoute(
    path: NavigationEnums.settingsScreen.routeName,
    builder: (BuildContext context, GoRouterState state) {
      return const SettingsScreen();
    },
  ),
  GoRoute(
    path: NavigationEnums.chatScreen.routeName,
    builder: (BuildContext context, GoRouterState state) {
      return const ChatScreen();
    },
  ),
  GoRoute(
    path: NavigationEnums.requestDetailScreen.routeName,
    builder: (BuildContext context, GoRouterState state) {
      return const RequestDetailPage();
    },
  ),
  GoRoute(
    path: NavigationEnums.createRequestScreen.routeName,
    builder: (BuildContext context, GoRouterState state) {
      return const CreateRequestScreen();
    },
  ),
  GoRoute(
    path: NavigationEnums.createRequestScreenStep2.routeName,
    builder: (BuildContext context, GoRouterState state) {
      return const CreateRequestStep2Screen();
    },
  ),
  GoRoute(
    path: NavigationEnums.createRequestScreenStep3.routeName,
    builder: (BuildContext context, GoRouterState state) {
      return const CreateRequestStep3Screen();
    },
  ),
  GoRoute(
    path: NavigationEnums.createRequestScreenStep4.routeName,
    builder: (BuildContext context, GoRouterState state) {
      return const CreateRequestStep4Screen();
    },
  ),
  GoRoute(
    path: NavigationEnums.createRequestScreenStep5.routeName,
    builder: (BuildContext context, GoRouterState state) {
      return const CreateRequestStep5Screen();
    },
  ),
  GoRoute(
    path: NavigationEnums.createRequestScreenStep6.routeName,
    builder: (BuildContext context, GoRouterState state) {
      return const CreateRequestStep6Screen();
    },
  ),
];
