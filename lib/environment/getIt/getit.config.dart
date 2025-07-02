// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:door_stamp/common/notifier/authentication_notifier.dart'
    as _i32;
import 'package:door_stamp/presentation/daily_box_office/data/data_source/box_office_data_source.dart'
    as _i19;
import 'package:door_stamp/presentation/daily_box_office/data/repository/box_office_repository.dart'
    as _i889;
import 'package:door_stamp/presentation/movie_detail/data/data_source/movie_detail_data_source.dart'
    as _i296;
import 'package:door_stamp/presentation/movie_detail/data/repository/movie_detail_repository.dart'
    as _i705;
import 'package:door_stamp/router/router.dart' as _i589;
import 'package:door_stamp/router/router_observer.dart' as _i229;
import 'package:door_stamp/util/dio.dart' as _i875;
import 'package:door_stamp/util/local_storage/shared_pref_util.dart' as _i491;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:go_router/go_router.dart' as _i583;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final sharedPreferencesModule = _$SharedPreferencesModule();
    final dioModule = _$DioModule();
    final goRouterModule = _$GoRouterModule();
    final boxOfficeDataSourceModule = _$BoxOfficeDataSourceModule();
    final movieDetailDataSourceModule = _$MovieDetailDataSourceModule();
    gh.singleton<_i32.AuthenticationNotifier>(
      () => _i32.AuthenticationNotifier(),
    );
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => sharedPreferencesModule.sharedPreferences,
      preResolve: true,
    );
    gh.factory<_i229.RouterObserver>(() => _i229.RouterObserver());
    gh.singleton<_i361.Dio>(() => dioModule.createGitHubDio());
    gh.singleton<_i583.GoRouter>(() => goRouterModule.router);
    gh.lazySingleton<_i19.BoxOfficeDataSource>(
      () =>
          boxOfficeDataSourceModule.provideBoxOfficeDataSource(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i296.MovieDetailDataSource>(
      () => movieDetailDataSourceModule.provideMovieDetailDataSource(
        gh<_i361.Dio>(),
      ),
    );
    gh.singleton<_i491.SharedPrefUtil>(
      () => _i491.SharedPrefUtil(
        sharedPreferences: gh<_i460.SharedPreferences>(),
      ),
    );
    gh.lazySingleton<_i705.MovieDetailRepository>(
      () => _i705.MovieDetailRepository(gh<_i296.MovieDetailDataSource>()),
    );
    gh.singleton<_i889.BoxOfficeRepository>(
      () => _i889.BoxOfficeRepository(gh<_i19.BoxOfficeDataSource>()),
    );
    return this;
  }
}

class _$SharedPreferencesModule extends _i491.SharedPreferencesModule {}

class _$DioModule extends _i875.DioModule {}

class _$GoRouterModule extends _i589.GoRouterModule {}

class _$BoxOfficeDataSourceModule extends _i19.BoxOfficeDataSourceModule {}

class _$MovieDetailDataSourceModule extends _i296.MovieDetailDataSourceModule {}
