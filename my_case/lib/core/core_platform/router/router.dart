import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'routes.dart';

final goRouterProvider = Provider<GoRouter>((ref) => routerConfig);

final GoRouter routerConfig = GoRouter(
  initialLocation: '/',
  routes: goRouterRoutes,
);
