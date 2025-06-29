// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:bloc_deep_dive/common/notifier/authentication_notifier.dart'
    as _i32;
import 'package:bloc_deep_dive/router/router.dart' as _i589;
import 'package:bloc_deep_dive/router/router_observer.dart' as _i229;
import 'package:flutter/widgets.dart' as _i718;
import 'package:get_it/get_it.dart' as _i174;
import 'package:go_router/go_router.dart' as _i583;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final goRouterModule = _$GoRouterModule();
    gh.singleton<_i32.AuthenticationNotifier>(
      () => _i32.AuthenticationNotifier(),
    );
    gh.factory<_i229.RouterObserver>(() => _i229.RouterObserver());
    gh.singleton<_i583.GoRouter>(() => goRouterModule.router);
    gh.factory<_i583.CustomTransitionPage<dynamic>>(
      () => goRouterModule.commonTransition(
        context: gh<_i718.BuildContext>(),
        state: gh<_i583.GoRouterState>(),
        child: gh<_i718.Widget>(),
        durationMilliseconds: gh<int>(),
      ),
    );
    return this;
  }
}

class _$GoRouterModule extends _i589.GoRouterModule {}
