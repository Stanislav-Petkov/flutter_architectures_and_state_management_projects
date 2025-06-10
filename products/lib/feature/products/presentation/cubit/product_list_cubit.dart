import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:products/feature/products/domain/models/product.dart';
import 'package:injectable/injectable.dart';
import 'package:products/feature/products/domain/repositories/product_repository.dart';

part 'product_list_state.dart';

@injectable
class ProductListCubit extends Cubit<ProductListState> {
  ProductListCubit(this.repository) : super(const ProductListState());

  final ProductRepository repository;

  Future<void> _runWithErrorHandling(Future<void> Function() action, {ProductListAction? lastAction}) async {
    try {
      await action();
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        errorMessage: 'There was an error, please try again.',
        lastAction: lastAction,
      ));
    }
  }

  Future<void> loadMore() async {
    if (state.isLoading) return;
    emit(state.copyWith(isLoading: true, errorMessage: null, lastAction: ProductListAction.load));
    await _runWithErrorHandling(() async {
      final nextId = state.products.length;
      final moreProducts = await repository.fetchProducts(nextId, 10);
      emit(state.copyWith(
        products: List.of(state.products)..addAll(moreProducts),
        isLoading: false,
        errorMessage: null,
        lastAction: ProductListAction.none,
      ));
    }, lastAction: ProductListAction.load);
  }

  Future<void> addProduct(String title, String description) async {
    await _runWithErrorHandling(() async {
      final newProduct = Product(
        id: state.products.length,
        title: title,
        description: description,
      );
      await repository.addProduct(newProduct);
      final products =
          await repository.fetchProducts(0, state.products.length + 1);
      emit(state.copyWith(
        products: products,
        errorMessage: null,
        lastAction: ProductListAction.none,
        successMessage: 'Product added successfully!'));
    }, lastAction: ProductListAction.addProduct);
  }

  void clearSuccessMessage() {
    emit(state.copyWith(successMessage: null));
  }

  Future<void> removeProduct(int id) async {
    await _runWithErrorHandling(() async {
      await repository.removeProduct(id);
      final products =
          await repository.fetchProducts(0, state.products.length - 1);
      emit(state.copyWith(products: products, errorMessage: null, lastAction: ProductListAction.none));
    }, lastAction: ProductListAction.delete);
  }

  Future<void> toggleFavorite(int id) async {
    await _runWithErrorHandling(() async {
      final product = state.products.firstWhere((p) => p.id == id);
      await repository.updateFavorite(id, !product.isFavorite);
      final products = await repository.fetchProducts(0, state.products.length);
      emit(state.copyWith(products: products, errorMessage: null, lastAction: ProductListAction.none));
    }, lastAction: ProductListAction.markAsFavorite);
  }

  void clearError() {
    emit(state.copyWith(errorMessage: null, lastAction: ProductListAction.none));
  }
}
