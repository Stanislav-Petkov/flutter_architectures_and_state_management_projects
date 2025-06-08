import 'package:injectable/injectable.dart';
import '../../domain/repositories/product_repository.dart';
import '../data_sources/product_data_source.dart';
import '../../domain/models/product.dart';

@LazySingleton(as: ProductRepository)
class ProductRepositoryImpl implements ProductRepository {
  ProductRepositoryImpl(this.dataSource);

  final ProductDataSource dataSource;

  @override
  Future<List<Product>> fetchProducts(int start, int count) {
    return dataSource.fetchProducts(start, count);
  }
}
