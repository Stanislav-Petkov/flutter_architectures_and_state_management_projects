// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../feature/products/data/data_sources/product_data_source.dart'
    as _i481;
import '../feature/products/data/data_sources/product_data_source_impl.dart'
    as _i899;
import '../feature/products/data/repositories/product_repository_impl.dart'
    as _i330;
import '../feature/products/domain/models/product.dart' as _i240;
import '../feature/products/domain/repositories/product_repository.dart'
    as _i298;
import '../feature/products/presentation/cubit/product_details_cubit.dart'
    as _i291;
import '../feature/products/presentation/cubit/product_list_cubit.dart'
    as _i749;
import 'services/uuid_service.dart' as _i633;

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
    gh.singleton<_i633.UuidService>(() => _i633.UuidService());
    gh.lazySingleton<_i481.ProductDataSource>(
        () => _i899.ProductDataSourceImpl(gh<_i633.UuidService>()));
    gh.lazySingleton<_i298.ProductRepository>(
        () => _i330.ProductRepositoryImpl(gh<_i481.ProductDataSource>()));
    gh.factory<_i749.ProductListCubit>(
        () => _i749.ProductListCubit(gh<_i298.ProductRepository>()));
    gh.factory<_i291.ProductDetailsCubit>(() => _i291.ProductDetailsCubit(
          gh<_i298.ProductRepository>(),
          gh<_i240.Product>(),
        ));
    return this;
  }
}
