// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../feature/movie/data/repository/movie_client.dart' as _i549;
import '../../feature/movie/data/repository/movie_repository_impl.dart'
    as _i624;
import '../../feature/movie/domain/repository/movie_repository.dart' as _i478;
import '../../feature/movie/presentation/cubit/movie_cubit.dart' as _i575;
import '../network/dio_module.dart' as _i614;
import '../network/rest_client.dart' as _i876;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    final restModule = _$RestModule();
    gh.factory<_i361.Dio>(() => dioModule.dio());
    gh.lazySingleton<_i876.RestClient>(
      () => restModule.client(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i549.MovieClient>(
      () => restModule.movieClient(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i478.MovieRepository>(
      () => _i624.MovieRepositoryImpl(gh<_i549.MovieClient>()),
    );
    gh.factory<_i575.MovieCubit>(
      () => _i575.MovieCubit(gh<_i478.MovieRepository>()),
    );
    return this;
  }
}

class _$DioModule extends _i614.DioModule {}

class _$RestModule extends _i876.RestModule {}
