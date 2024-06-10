// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ader/application/bussiness_logic/cubit/initial_cubit.dart'
    as _i5;
import 'package:ader/data/module/flutter_secure_module.dart' as _i6;
import 'package:ader/data/module/module.dart' as _i7;
import 'package:dio/dio.dart' as _i4;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final secureStorageModule = _$SecureStorageModule();
    final dioModule = _$DioModule();
    gh.lazySingleton<_i3.FlutterSecureStorage>(
        () => secureStorageModule.flutterSecureStorage);
    gh.lazySingleton<_i4.Dio>(() => dioModule.dioInstance);
    gh.factory<_i5.InitialCubit>(
        () => _i5.InitialCubit(gh<_i3.FlutterSecureStorage>()));
    return this;
  }
}

class _$SecureStorageModule extends _i6.SecureStorageModule {}

class _$DioModule extends _i7.DioModule {}
