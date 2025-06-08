import 'package:injectable/injectable.dart';
import '../../domain/models/product.dart';

@lazySingleton
class ProductDataSource {
  Future<List<Product>> fetchProducts(int start, int count) async {
    // Simulate data creation
    await Future.delayed(const Duration(milliseconds: 500));
    return List.generate(
        count,
        (i) => Product(
              id: start + i,
              title: 'Product ${start + i + 1}',
              description: 'Description for product ${start + i + 1}',
            ));
  }
}
