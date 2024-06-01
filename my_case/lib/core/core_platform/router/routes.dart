import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_case/core/core_platform/router/route_enums.dart';
import 'package:my_case/features/authentication/sign_in/sign_in_screen.dart';
import 'package:my_case/features/authentication/sign_up/sign_up_screen.dart';
import 'package:my_case/features/profile/settings/settings_screen.dart';
import 'package:my_case/features/view/view_screen.dart';
import 'package:my_case/features/information/what_is_my_case/what_is_my_case_screen.dart';

List<RouteBase> goRouterRoutes = <RouteBase>[
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
];
