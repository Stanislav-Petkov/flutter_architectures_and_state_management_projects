import 'package:flutter_bloc/flutter_bloc.dart';
import 'product_list_state.dart';
import 'product_list_error.dart';

import 'package:products/feature/products/domain/models/product.dart';
import 'package:injectable/injectable.dart';
import 'package:products/feature/products/domain/repositories/product_repository.dart';

@injectable
class ProductListCubit extends Cubit<ProductListState> {
  ProductListCubit(this.repository) : super(ProductListState());

  final ProductRepository repository;

  Future<void> loadMore() async {
    if (state.isLoading) return;
    emit(state.copyWith(
      isLoading: true,
      error: null,
    ));
    await _errorHandling(() async {
      final nextId = state.products.length;
      final moreProducts = await repository.fetchProducts(nextId, 10);
      emit(state.copyWith(
        products: List.of(state.products)..addAll(moreProducts),
        isLoading: false,
        error: null,
      ));
    }, error: ProductListError.loadMoreProductsError);
  }

  Future<void> addProduct(String title, String description) async {
    await _errorHandling(() async {
      final newProduct = Product(
        id: state.products.length,
        title: title,
        description: description,
      );
      await repository.addProduct(newProduct);
      final updatedProducts = List<Product>.from(state.products)
        ..add(newProduct);
      emit(state.copyWith(
          products: updatedProducts,
          error: null,
          successMessage: 'Product added successfully!'));
    }, error: ProductListError.addProductError);
  }

  void clearSuccessMessage() {
    emit(state.copyWith(successMessage: null));
  }

  Future<void> removeProduct(int id) async {
    await _errorHandling(() async {
      await repository.removeProduct(id);
      final updatedProducts = List<Product>.from(state.products)
        ..removeWhere((p) => p.id == id);
      emit(state.copyWith(
        products: updatedProducts,
        error: null,
      ));
    }, error: ProductListError.deleteProductError);
  }

  Future<void> toggleFavorite(int id) async {
    await _errorHandling(() async {
      final product = state.products.firstWhere((item) => item.id == id);
      await repository.updateFavorite(id, !product.isFavorite);
      final updatedProducts = state.products.map((item) {
        if (item.id == id) {
          return item.copyWith(isFavorite: !product.isFavorite);
        }
        return item;
      }).toList();
      emit(state.copyWith(
        products: updatedProducts,
        error: null,
      ));
    }, error: ProductListError.markAsFavoriteError);
  }

  void clearError() {
    emit(state.copyWith(error: null));
  }

  Future<void> _errorHandling(Future<void> Function() action,
      {ProductListError? error}) async {
    try {
      await action();
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        error: error,
      ));
    }
  }
}
