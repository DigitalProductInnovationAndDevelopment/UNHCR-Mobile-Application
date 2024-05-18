import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_case/features/authentication/sign_in/sign_in_screen.dart';

List<RouteBase> goRouterRoutes = <RouteBase>[
  GoRoute(
    path: '/',
    builder: (BuildContext context, GoRouterState state) {
      return const SignInScreen();
    },
    routes: <RouteBase>[
      GoRoute(
        path: 'details',
        builder: (BuildContext context, GoRouterState state) {
          return Scaffold(
            body: Center(
              child: GestureDetector(
                onTap: () => context.go('/'),
                child: const Text('Details'),
              ),
            ),
          );
        },
      ),
    ],
  ),
];
