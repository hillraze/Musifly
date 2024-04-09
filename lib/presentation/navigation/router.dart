// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:musifly/analytics/events/screen_names.dart';

import '../screens/album_view/album_view_screen.dart';
import '../screens/bottom_bar/bottom_bar_shell.dart';
import '../screens/favourites/favourites_screen.dart';
import '../screens/onboarding/onboarding_screen.dart';
import '../screens/root/splash/splash_screen.dart';
import '../screens/search/search_screen.dart';

class RouterService {
  static RouterService? _instance;
  static RouterService get instance {
    assert(_instance != null,
        'Remember to initialise RouterService by calling its init method');
    return _instance!;
  }

  late final GoRouter _goRouter;
  GoRouter get goRouter => _goRouter;

  RouterService._(GlobalKey<NavigatorState> screenNavigatorKey,
      GlobalKey<NavigatorState> shellKey) {
    _goRouter = _buildGoRouter(screenNavigatorKey, shellKey);
  }

  static Future<void> init(
    GlobalKey<NavigatorState> screenNavigatorKey,
    GlobalKey<NavigatorState> shellKey,
  ) async {
    assert(_instance == null);
    _instance = RouterService._(screenNavigatorKey, shellKey);
  }

  static GoRouter _buildGoRouter(
    GlobalKey<NavigatorState> screenNavigatorKey,
    GlobalKey<NavigatorState> shellKey,
  ) {
    return GoRouter(
      initialLocation: ScreenNames.splash,
      navigatorKey: screenNavigatorKey,
      routes: [
        GoRoute(
          path: ScreenNames.splash,
          name: ScreenNames.splash,
          pageBuilder: (ctx, state) {
            return _rootMaterialPage(
              const SplashScreen(),
              ScreenNames.splash,
            );
          },
        ),
        GoRoute(
          path: ScreenNames.onboard,
          name: ScreenNames.onboard,
          pageBuilder: (ctx, state) {
            return _rootMaterialPage(
              const OnboardingScreen(),
              ScreenNames.onboard,
            );
          },
        ),
        // GoRoute(
        //   path: ScreenNames.home,
        //   name: ScreenNames.home,
        //   pageBuilder: (ctx, state) {
        //     return CustomTransitionPage(
        //         key: state.pageKey,
        //         child: HomeScreen(),
        //         transitionsBuilder: (_, a, __, c) =>
        //             FadeTransition(opacity: a, child: c));
        //   },
        // ),
        ShellRoute(
          navigatorKey: shellKey,
          pageBuilder: (ctx, state, child) {
            return _shellTabPage(
              BottomBarShell(
                state: state,
                child: child,
              ),
              state.uri.toString(),
            );
          },
          routes: [
            GoRoute(
              path: ScreenNames.favourites,
              name: ScreenNames.favourites,
              pageBuilder: (context, state) => _shellNoTransitionPage(
                const FavouritesScreen(),
                ScreenNames.favourites,
              ),
            ),
            GoRoute(
              path: ScreenNames.home,
              name: ScreenNames.home,
              pageBuilder: (context, state) => _shellNoTransitionPage(
                const HomeScreen(),
                ScreenNames.home,
              ),
            ),
            GoRoute(
              path: ScreenNames.search,
              name: ScreenNames.search,
              pageBuilder: (context, state) => _shellNoTransitionPage(
                const SearchScreen(),
                ScreenNames.search,
              ),
            ),
          ],
        )
      ],
    );
  }
}

Page _customTransitionPage(Widget child, String? name) {
  return CustomTransitionPage(
    transitionsBuilder: (_, a, __, c) => FadeTransition(opacity: a, child: c),
    transitionDuration: Duration(seconds: 2),
    key: ValueKey(name),
    name: name,
    child: child,
  );
}

Page _rootMaterialPage(Widget child, String? name) {
  return MaterialPage(child: child, name: name, key: ValueKey(name));
}

Page _shellTabPage(Widget child, String? name) {
  return NoTransitionPage(
    name: name,
    child: child,
  );
}

Page _shellNoTransitionPage(Widget child, String? name) {
  return NoTransitionPage(
    key: ValueKey(name),
    name: name,
    child: child,
  );
}
