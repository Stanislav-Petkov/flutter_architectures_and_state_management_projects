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

  void addProduct(String title, String description) {
    final newProduct = Product(
      id: state.products.length,
      title: title,
      description: description,
    );
    emit(state.copyWith(
        products: List.of(state.products)..insert(0, newProduct)));
  }

  void removeProduct(int id) {
    emit(state.copyWith(
        products: state.products.where((p) => p.id != id).toList()));
  }

  void toggleFavorite(int id) {
    emit(state.copyWith(
      products: state.products
          .map((p) => p.id == id ? p.copyWith(isFavorite: !p.isFavorite) : p)
          .toList(),
    ));
  }
}
