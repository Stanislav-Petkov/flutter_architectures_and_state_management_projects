import 'package:injectable/injectable.dart';
import 'package:products/feature/products/domain/repositories/product_repository.dart';
import 'package:products/feature/products/data/data_sources/product_data_source.dart';
import 'package:products/feature/products/domain/models/product.dart';

@LazySingleton(as: ProductRepository)
class ProductRepositoryImpl implements ProductRepository {
  ProductRepositoryImpl(this.dataSource);

  final ProductDataSource dataSource;

  @override
  Future<List<Product>> fetchProducts(int start, int count) {
    return dataSource.fetchProducts(start, count);
  }
}
