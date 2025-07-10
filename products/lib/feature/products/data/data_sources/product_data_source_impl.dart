import 'package:injectable/injectable.dart';
import 'package:products/core/services/uuid_service.dart';
import 'package:products/feature/products/data/data_sources/product_data_source.dart';
import 'package:products/feature/products/data/models/product_dto.dart';

@LazySingleton(as: ProductDataSource)
class ProductDataSourceImpl implements ProductDataSource {
  final List<ProductDto> _products = [];
  final UuidService _uuidService;

  ProductDataSourceImpl(this._uuidService) {
    _seedProducts(10);
  }

  void _seedProducts(int count) => _products.addAll(List.generate(
      count,
      (i) => ProductDto(
            id: _uuidService.generate(),
            title: 'Sample Product ${_products.length + i + 1}',
            description:
                'Description for sample product ${_products.length + i + 1}',
            isFavorite: false,
          )));

  @override
  Future<List<ProductDto>> fetchProducts(int start, int count) async {
    while (_products.length < start + count) {
      _seedProducts(10);
    }
    final end =
        (start + count) > _products.length ? _products.length : (start + count);
    if (start >= _products.length) return [];
    return _products.sublist(start, end);
  }

  @override
  Future<void> addProduct(ProductDto dto) async {
    final newDto =
        dto.copyWith(id: dto.id.isEmpty ? _uuidService.generate() : dto.id);
    _products.add(newDto);
  }

  @override
  Future<void> updateFavorite(String id, bool isFavorite) async {
    final index = _products.indexWhere((dto) => dto.id == id);
    if (index != -1) {
      _products[index] = _products[index].copyWith(isFavorite: isFavorite);
    }
  }

  @override
  Future<void> removeProduct(String id) async =>
      _products.removeWhere((dto) => dto.id == id);
}
