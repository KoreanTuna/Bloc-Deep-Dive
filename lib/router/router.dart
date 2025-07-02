import 'package:door_stamp/common/data/repository/authentication_repository.dart';
import 'package:door_stamp/common/notifier/authentication_notifier.dart';
import 'package:door_stamp/environment/getIt/getit.dart';
import 'package:door_stamp/presentation/home/home_screen.dart';
import 'package:door_stamp/presentation/login/login_screen.dart';
import 'package:door_stamp/presentation/movie_detail/presentation/movie_detail_screen.dart';
import 'package:door_stamp/presentation/on_board/presentation/on_board_screen.dart';
import 'package:door_stamp/presentation/splash/splash_screen.dart';
import 'package:door_stamp/router/router_observer.dart';
import 'package:door_stamp/router/router_path.dart';
import 'package:door_stamp/util/logger.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Widget _fadeTransition(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) {
  return FadeTransition(
    opacity: animation,
    child: child,
  );
}

CustomTransitionPage buildFadeTransitionPage({
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionsBuilder: _fadeTransition,
  );
}

@module
abstract class GoRouterModule {
  @singleton
  GoRouter get router => GoRouter(
    navigatorKey: navigatorKey,
    observers: [locator<RouterObserver>()],
    initialLocation: '/${RouterPath.splash}',
    refreshListenable: locator<AuthenticationNotifier>(),
    redirect: (context, state) {
      final AuthenticationNotifier authNotifier =
          locator<AuthenticationNotifier>();
      final AuthenticationStatus status = authNotifier.status;

      final bool isAuthenticated = status == AuthenticationStatus.authenticated;
      final bool isSplash = state.matchedLocation.contains(RouterPath.splash);
      final bool isLogin = state.matchedLocation.contains(RouterPath.login);

      // 인증 안 됐고 splash나 login이 아닌 곳이면 splash로 보낸다
      if (!isAuthenticated && !isSplash && !isLogin) {
        logger.w('Unauthenticated → Redirect to Splash');
        return '/${RouterPath.login}';
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
            pageBuilder:
                (context, state) => buildFadeTransitionPage(
                  state: state,
                  child: const SplashScreen(),
                ),
          ),
          GoRoute(
            path: RouterPath.login,
            name: RouterPath.login,
            builder: (context, state) => const LoginScreen(),
            pageBuilder:
                (context, state) => buildFadeTransitionPage(
                  state: state,
                  child: const LoginScreen(),
                ),
          ),
          GoRoute(
            path: RouterPath.onboard,
            name: RouterPath.onboard,
            builder: (context, state) => const OnBoardScreen(),
            pageBuilder:
                (context, state) => buildFadeTransitionPage(
                  state: state,
                  child: const OnBoardScreen(),
                ),
          ),
          GoRoute(
            path: RouterPath.home,
            name: RouterPath.home,
            builder: (context, state) => const HomeScreen(),
            pageBuilder:
                (context, state) => buildFadeTransitionPage(
                  state: state,
                  child: const HomeScreen(),
                ),
          ),
          GoRoute(
            path: '${RouterPath.movieDetail}/:movieCd/:prevDayTotalAudits',
            name: RouterPath.movieDetail,
            builder: (context, state) {
              final String? movieCd = state.pathParameters['movieCd'];
              final int prevDayTotalAudits =
                  state.pathParameters['prevDayTotalAudits'] != null
                      ? int.parse(state.pathParameters['prevDayTotalAudits']!)
                      : 0;
              if (movieCd == null) {
                return HomeScreen();
              }
              return MovieDetailScreen(
                movieCd: movieCd,
                prevDayTotalAudits: prevDayTotalAudits,
              );
            },
            pageBuilder: (context, state) {
              final String? movieCd = state.pathParameters['movieCd'];
              final int prevDayTotalAudits =
                  state.pathParameters['prevDayTotalAudits'] != null
                      ? int.parse(state.pathParameters['prevDayTotalAudits']!)
                      : 0;

              if (movieCd == null) {
                return buildFadeTransitionPage(
                  state: state,
                  child: HomeScreen(),
                );
              }
              return buildFadeTransitionPage(
                state: state,
                child: MovieDetailScreen(
                  movieCd: movieCd,
                  prevDayTotalAudits: prevDayTotalAudits,
                ),
              );
            },
          ),
        ],
      ),
    ],
  );
}
