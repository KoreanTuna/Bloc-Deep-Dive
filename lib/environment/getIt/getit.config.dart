// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:door_stamp/common/data/data_source/firestore_data_source.dart'
    as _i622;
import 'package:door_stamp/common/data/repository/user_repository.dart'
    as _i570;
import 'package:door_stamp/common/notifier/authentication_notifier.dart'
    as _i660;
import 'package:door_stamp/presentation/daily_box_office/data/data_source/box_office_data_source.dart'
    as _i930;
import 'package:door_stamp/presentation/daily_box_office/data/repository/box_office_repository.dart'
    as _i703;
import 'package:door_stamp/presentation/movie_detail/data/data_source/movie_detail_data_source.dart'
    as _i1027;
import 'package:door_stamp/presentation/movie_detail/data/repository/movie_detail_repository.dart'
    as _i318;
import 'package:door_stamp/router/router.dart' as _i498;
import 'package:door_stamp/router/router_observer.dart' as _i676;
import 'package:door_stamp/util/dio.dart' as _i681;
import 'package:door_stamp/util/local_storage/shared_pref_util.dart' as _i851;
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
    gh.singleton<_i660.AuthenticationNotifier>(
      () => _i660.AuthenticationNotifier(),
    );
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => sharedPreferencesModule.sharedPreferences,
      preResolve: true,
    );
    gh.factory<_i676.RouterObserver>(() => _i676.RouterObserver());
    gh.singleton<_i361.Dio>(() => dioModule.createGitHubDio());
    gh.singleton<_i622.FirestoreDataSource>(() => _i622.FirestoreDataSource());
    gh.singleton<_i583.GoRouter>(() => goRouterModule.router);
    gh.lazySingleton<_i930.BoxOfficeDataSource>(
      () =>
          boxOfficeDataSourceModule.provideBoxOfficeDataSource(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i1027.MovieDetailDataSource>(
      () => movieDetailDataSourceModule.provideMovieDetailDataSource(
        gh<_i361.Dio>(),
      ),
    );
    gh.lazySingleton<_i318.MovieDetailRepository>(
      () => _i318.MovieDetailRepository(gh<_i1027.MovieDetailDataSource>()),
    );
    gh.singleton<_i851.SharedPrefUtil>(
      () => _i851.SharedPrefUtil(
        sharedPreferences: gh<_i460.SharedPreferences>(),
      ),
    );
    gh.singleton<_i703.BoxOfficeRepository>(
      () => _i703.BoxOfficeRepository(gh<_i930.BoxOfficeDataSource>()),
    );
    gh.singleton<_i570.UserRepository>(
      () => _i570.UserRepository(
        gh<_i851.SharedPrefUtil>(),
        gh<_i622.FirestoreDataSource>(),
      ),
    );
    return this;
  }
}

class _$SharedPreferencesModule extends _i851.SharedPreferencesModule {}

class _$DioModule extends _i681.DioModule {}

class _$GoRouterModule extends _i498.GoRouterModule {}

class _$BoxOfficeDataSourceModule extends _i930.BoxOfficeDataSourceModule {}

class _$MovieDetailDataSourceModule
    extends _i1027.MovieDetailDataSourceModule {}
