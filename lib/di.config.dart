// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dicoding_flutter_fundamental/core/di/network_module.dart'
    as _i335;
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
    final networkModule = _$NetworkModule();
    gh.singleton<String>(
      () => networkModule.baseUrl,
      instanceName: 'base_url',
    );
    gh.singleton<_i361.Dio>(
        () => networkModule.dio(gh<String>(instanceName: 'base_url')));
    return this;
  }
}

class _$NetworkModule extends _i335.NetworkModule {}
