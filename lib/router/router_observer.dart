import 'package:door_stamp/util/logger.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';

@injectable
final class RouterObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    logger.d(
      'Route Push: ${route.settings.name}, arguments: ${route.settings.arguments}',
    );
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    logger.d('Route Pop: ${route.settings.name}');
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    logger.d('Route Remove: ${route.settings.name}');
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    logger.d('Route Replace: ${newRoute?.settings.name}');
  }
}
