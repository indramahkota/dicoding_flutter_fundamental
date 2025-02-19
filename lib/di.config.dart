// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dicoding_flutter_fundamental/persist/di/persist_module.dart'
    as _i436;
import 'package:dicoding_flutter_fundamental/persist/services/local_database_service.dart'
    as _i179;
import 'package:dicoding_flutter_fundamental/persist/services/shared_preferences_service.dart'
    as _i104;
import 'package:dicoding_flutter_fundamental/provider/bookmark_provider.dart'
    as _i119;
import 'package:dicoding_flutter_fundamental/provider/di/provider_module.dart'
    as _i842;
import 'package:dicoding_flutter_fundamental/provider/restaurant_provider.dart'
    as _i526;
import 'package:dicoding_flutter_fundamental/provider/restaurants_provider.dart'
    as _i316;
import 'package:dicoding_flutter_fundamental/provider/settings_provider.dart'
    as _i569;
import 'package:dicoding_flutter_fundamental/remoting/di/network_module.dart'
    as _i283;
import 'package:dicoding_flutter_fundamental/remoting/services/restaurant_service.dart'
    as _i395;
import 'package:dicoding_flutter_fundamental/repository/di/repository_module.dart'
    as _i506;
import 'package:dicoding_flutter_fundamental/repository/restaurant_repository.dart'
    as _i713;
import 'package:dicoding_flutter_fundamental/repository/restaurant_repository_impl.dart'
    as _i218;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final persistModule = _$PersistModule();
    final networkModule = _$NetworkModule();
    final providerModule = _$ProviderModule();
    final repositoryModule = _$RepositoryModule(this);
    await gh.singletonAsync<_i460.SharedPreferences>(
      () => persistModule.prefs,
      preResolve: true,
    );
    gh.singleton<_i179.LocalDatabaseService>(() => persistModule.database());
    gh.singleton<_i104.SharedPreferencesService>(
        () => persistModule.preferences(gh<_i460.SharedPreferences>()));
    gh.singleton<String>(
      () => networkModule.baseUrl,
      instanceName: 'base_url',
    );
    gh.singleton<_i361.Dio>(
        () => networkModule.dio(gh<String>(instanceName: 'base_url')));
    gh.singleton<_i569.SettingsProvider>(() =>
        providerModule.themeProvider(gh<_i104.SharedPreferencesService>()));
    gh.singleton<_i395.RestaurantService>(
        () => networkModule.service(gh<_i361.Dio>()));
    gh.singleton<_i713.RestaurantRepository>(
        () => repositoryModule.restaurantRepository);
    gh.singleton<_i526.RestaurantProvider>(() =>
        providerModule.restaurantProvider(gh<_i713.RestaurantRepository>()));
    gh.singleton<_i316.RestaurantsProvider>(() =>
        providerModule.restaurantsProvider(gh<_i713.RestaurantRepository>()));
    gh.singleton<_i119.BookmarkProvider>(() =>
        providerModule.bookmarkProvider(gh<_i713.RestaurantRepository>()));
    return this;
  }
}

class _$PersistModule extends _i436.PersistModule {}

class _$NetworkModule extends _i283.NetworkModule {}

class _$ProviderModule extends _i842.ProviderModule {}

class _$RepositoryModule extends _i506.RepositoryModule {
  _$RepositoryModule(this._getIt);

  final _i174.GetIt _getIt;

  @override
  _i218.RestaurantRepositoryImpl get restaurantRepository =>
      _i218.RestaurantRepositoryImpl(
        _getIt<_i395.RestaurantService>(),
        _getIt<_i179.LocalDatabaseService>(),
      );
}
