import 'package:bloc_deep_dive/common/data/repository/authentication_repository.dart';
import 'package:bloc_deep_dive/common/notifier/authentication_notifier.dart';
import 'package:bloc_deep_dive/environment/getIt/getit.dart';
import 'package:bloc_deep_dive/presentation/home/home_screen.dart';
import 'package:bloc_deep_dive/presentation/login/login_screen.dart';
import 'package:bloc_deep_dive/presentation/splash/splash_screen.dart';
import 'package:bloc_deep_dive/router/router_observer.dart';
import 'package:bloc_deep_dive/router/router_path.dart';
import 'package:bloc_deep_dive/util/logger.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

@module
abstract class GoRouterModule {
  CustomTransitionPage commonTransition({
    required BuildContext context,
    required GoRouterState state,
    required Widget child,
    int durationMilliseconds = 0,
  }) {
    return NoTransitionPage(key: state.pageKey, name: state.name, child: child);
  }

  @singleton
  GoRouter get router => GoRouter(
    navigatorKey: navigatorKey,
    observers: [locator<RouterObserver>()],
    initialLocation: '/${RouterPath.splash}',
    refreshListenable: locator<AuthenticationNotifier>(),
    redirect: (context, state) {
      final authenticationNotifier = locator<AuthenticationNotifier>();

      final isAuthenticated =
          authenticationNotifier.status == AuthenticationStatus.authenticated;
      final isSplash = state.matchedLocation.contains(RouterPath.splash);
      final isLogin = state.matchedLocation.contains(RouterPath.login);

      if (!isAuthenticated && !isSplash && !isLogin) {
        logger.w('Redirecting to splash screen');
        return '/${RouterPath.splash}';
      }
      return null;
    },
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => Container(),
        routes: [
          GoRoute(
            path: RouterPath.splash,
            name: RouterPath.splash,
            builder: (context, state) => const SplashScreen(),
          ),
          GoRoute(
            path: RouterPath.login,
            name: RouterPath.login,
            builder: (context, state) => const LoginScreen(),
          ),
          GoRoute(
            path: RouterPath.home,
            name: RouterPath.home,
            builder: (context, state) => const HomeScreen(),
          ),
        ],
      ),
    ],
  );
}
