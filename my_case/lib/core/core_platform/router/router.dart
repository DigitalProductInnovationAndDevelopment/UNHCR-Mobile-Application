import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_case/core/core_platform/router/route_enums.dart';

import 'routes.dart';

final goRouterProvider = Provider<GoRouter>((ref) => routerConfig);

final GoRouter routerConfig = GoRouter(
  initialLocation: NavigationEnums.signInScreen.routeName,
  routes: goRouterRoutes,
);
