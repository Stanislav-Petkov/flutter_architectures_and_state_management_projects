import 'package:products/feature/products/domain/models/product.dart';

abstract class ProductRepository {
  Future<List<Product>> fetchProducts(int start, int count);
}
