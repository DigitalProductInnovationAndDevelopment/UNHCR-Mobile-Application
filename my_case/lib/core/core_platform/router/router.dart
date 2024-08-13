import 'package:bot_toast/bot_toast.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_case/core/core_platform/router/route_enums.dart';
import 'package:my_case/core/core_platform/router/router_keys.dart';

import 'routes.dart';

final goRouterProvider = Provider<GoRouter>((ref) => routerConfig);

final GoRouter routerConfig = GoRouter(
  navigatorKey: navKey,
  initialLocation: NavigationEnums.authenticator.routeName,
  routes: goRouterRoutes,
  observers: [BotToastNavigatorObserver()],
);
