import 'package:flutter_bloc/flutter_bloc.dart';
import 'product_list_state.dart';
import 'product_list_error.dart';
import 'package:products/feature/products/domain/models/product.dart';
import 'package:injectable/injectable.dart';
import 'package:products/feature/products/domain/repositories/product_repository.dart';

@injectable
class ProductListCubit extends Cubit<ProductListState> {
  ProductListCubit(this._repository) : super(ProductListState());

  final ProductRepository _repository;

  Future<void> loadMore() async {
    if (state.isLoading) return;
    _emitLoading();
    await _errorHandling(() async {
      final nextId = state.products.length;
      final moreProducts = await _repository.fetchProducts(nextId, 10);
      emit(state.copyWith(
        products: List.of(state.products)..addAll(moreProducts),
        isLoading: false,
        error: null,
      ));
    },
        error: ProductListError.loadMoreProductsError,
        errorMessage: 'Failed to load more products');
  }

  Future<void> addProduct(String title, String description) async {
    _emitLoading();
    await _errorHandling(() async {
      final newProduct = Product.create(
        title: title,
        description: description,
      );
      await _repository.addProduct(newProduct);
      final updatedProducts = List<Product>.from(state.products)
        ..add(newProduct);
      emit(state.copyWith(
        products: updatedProducts,
        error: null,
        isLoading: false,
      ));
    },
        error: ProductListError.addProductError,
        errorMessage: 'Failed to add product');
  }

  Future<void> removeProduct(String id) async {
    _emitLoading();
    await _errorHandling(() async {
      await _repository.removeProduct(id);
      final updatedProducts = List<Product>.from(state.products)
        ..removeWhere((p) => p.id == id);
      emit(state.copyWith(
        products: updatedProducts,
        error: null,
        isLoading: false,
      ));
    },
        error: ProductListError.deleteProductError,
        errorMessage: 'Failed to delete product');
  }

  Future<void> toggleFavorite(String id) async {
    _emitLoading();
    await _errorHandling(() async {
      final product = state.products.firstWhere((item) => item.id == id);
      await _repository.updateFavorite(id, !product.isFavorite);
      final updatedProducts = state.products.map((item) {
        if (item.id == id) {
          return item.copyWith(isFavorite: !product.isFavorite);
        }
        return item;
      }).toList();
      emit(state.copyWith(
        products: updatedProducts,
        error: null,
        isLoading: false,
      ));
    },
        error: ProductListError.markAsFavoriteError,
        errorMessage: 'Failed to mark as favorite');
  }

  void clearError() => emit(state.copyWith(error: null));

  /// Updates a single product in the list with new data
  void refreshProduct(Product updatedProduct) {
    final updatedProducts = state.products.map((item) {
      if (item.id == updatedProduct.id) {
        return updatedProduct;
      }
      return item;
    }).toList();

    emit(state.copyWith(
      products: updatedProducts,
      error: null,
    ));
  }

  void _emitLoading() => emit(state.copyWith(
        isLoading: true,
        error: null,
      ));

  Future<void> _errorHandling(Future<void> Function() action,
      {ProductListError? error, String? errorMessage}) async {
    try {
      await action();
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        error: error,
        errorMessage: errorMessage,
      ));
    }
  }
}