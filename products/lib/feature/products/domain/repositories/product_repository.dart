import 'package:injectable/injectable.dart';
import '../../data/data_sources/product_data_source.dart';
import '../models/product.dart';

abstract class ProductRepository {
  Future<List<Product>> fetchProducts(int start, int count);
}
