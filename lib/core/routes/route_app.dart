import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/presentation/pages/home_screen.dart';
import '../../features/navigation_bar/presentation/pages/bottom_navigation_bar.dart';
import '../../features/recap/presentation/pages/recap_screen.dart';
import '../../features/splash/presentation/pages/splash_screen.dart';

part 'route_name.dart';

final GlobalKey<NavigatorState> homeKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> recapKey = GlobalKey<NavigatorState>();

final GoRouter routerApp = GoRouter(
  routes: <RouteBase>[
    /// Route without parent
    GoRoute(
      path: '/',
      name: RouteName().splashScreen,
      builder: (context, state) {
        return const SplashScreen();
      },
    ),

    /// Route with parent
    /// if have many role in app, just add more StatefulShellRoute.indexedStack
    /// with different name and path name
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MyNavigationBar(
          child: navigationShell,
        );
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: homeKey,
          routes: [
            GoRoute(
              path: "/homeScreen",
              name: RouteName().homeScreen,
              builder: (context, state) {
                return const HomeScreen();
              },
            )
          ],
        ),
        StatefulShellBranch(
          navigatorKey: recapKey,
          routes: [
            GoRoute(
              path: "/recapScreen",
              name: RouteName().recapScreen,
              builder: (context, state) {
                return const RecapScreen();
              },
            )
          ],
        ),
      ],
    ),
  ],
);
