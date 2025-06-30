// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:bloc_deep_dive/common/data/data_source/box_office_data_source.dart'
    as _i1023;
import 'package:bloc_deep_dive/common/data/repository/box_office_repository.dart'
    as _i544;
import 'package:bloc_deep_dive/common/notifier/authentication_notifier.dart'
    as _i32;
import 'package:bloc_deep_dive/router/router.dart' as _i589;
import 'package:bloc_deep_dive/router/router_observer.dart' as _i229;
import 'package:bloc_deep_dive/util/dio.dart' as _i875;
import 'package:dio/dio.dart' as _i361;
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
    final dioModule = _$DioModule();
    final goRouterModule = _$GoRouterModule();
    final boxOfficeDataSourceModule = _$BoxOfficeDataSourceModule();
    gh.singleton<_i32.AuthenticationNotifier>(
      () => _i32.AuthenticationNotifier(),
    );
    gh.factory<_i229.RouterObserver>(() => _i229.RouterObserver());
    gh.singleton<_i361.Dio>(() => dioModule.createGitHubDio());
    gh.singleton<_i583.GoRouter>(() => goRouterModule.router);
    gh.lazySingleton<_i1023.BoxOfficeDataSource>(
      () =>
          boxOfficeDataSourceModule.provideBoxOfficeDataSource(gh<_i361.Dio>()),
    );
    gh.singleton<_i544.BoxOfficeRepository>(
      () => _i544.BoxOfficeRepository(gh<_i1023.BoxOfficeDataSource>()),
    );
    return this;
  }
}

class _$DioModule extends _i875.DioModule {}

class _$GoRouterModule extends _i589.GoRouterModule {}

class _$BoxOfficeDataSourceModule extends _i1023.BoxOfficeDataSourceModule {}
