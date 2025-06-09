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

  Future<void> loadMore() async {
    if (state.isLoading) return;
    emit(state.copyWith(isLoading: true));
    final nextId = state.products.length;
    final moreProducts = await repository.fetchProducts(nextId, 20);
    emit(state.copyWith(
      products: List.of(state.products)..addAll(moreProducts),
      isLoading: false,
    ));
  }

  Future<void> addProduct(String title, String description) async {
    final newProduct = Product(
      id: state.products.length,
      title: title,
      description: description,
    );
    await repository.addProduct(newProduct);
    final products =
        await repository.fetchProducts(0, state.products.length + 1);
    emit(state.copyWith(products: products));
  }

  Future<void> removeProduct(int id) async {
    await repository.removeProduct(id);
    final products =
        await repository.fetchProducts(0, state.products.length - 1);
    emit(state.copyWith(products: products));
  }

  Future<void> toggleFavorite(int id) async {
    final product = state.products.firstWhere((p) => p.id == id);
    await repository.updateFavorite(id, !product.isFavorite);
    final products = await repository.fetchProducts(0, state.products.length);
    emit(state.copyWith(products: products));
  }
}
