// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dicoding_flutter_fundamental/remoting/di/network_module.dart'
    as _i283;
import 'package:dicoding_flutter_fundamental/remoting/repository/restaurant_repository.dart'
    as _i289;
import 'package:dicoding_flutter_fundamental/remoting/repository/restaurant_repository_impl.dart'
    as _i733;
import 'package:dicoding_flutter_fundamental/remoting/services/restaurant_service.dart'
    as _i395;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final networkModule = _$NetworkModule(this);
    gh.singleton<String>(
      () => networkModule.baseUrl,
      instanceName: 'base_url',
    );
    gh.singleton<_i361.Dio>(
        () => networkModule.dio(gh<String>(instanceName: 'base_url')));
    gh.singleton<_i395.RestaurantService>(
        () => networkModule.service(gh<_i361.Dio>()));
    gh.singleton<_i289.RestaurantRepository>(
        () => networkModule.restaurantRepository);
    return this;
  }
}

class _$NetworkModule extends _i283.NetworkModule {
  _$NetworkModule(this._getIt);

  final _i174.GetIt _getIt;

  @override
  _i733.RestaurantRepositoryImpl get restaurantRepository =>
      _i733.RestaurantRepositoryImpl(_getIt<_i395.RestaurantService>());
}
