import 'package:products/feature/products/domain/models/product.dart';

abstract class ProductRepository {
  Future<List<Product>> fetchProducts(int start, int count);
  Future<void> addProduct(Product product);
  Future<void> updateFavorite(String id, bool isFavorite);
  Future<void> removeProduct(String id);
}
