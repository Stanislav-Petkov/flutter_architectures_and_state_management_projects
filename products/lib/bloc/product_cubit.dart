import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../models/product.dart';
part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(const ProductState());

  void loadMore() {
    if (state.isLoading) return;
    emit(state.copyWith(isLoading: true));
    // Simulate fetching more products
    Future.delayed(const Duration(milliseconds: 500), () {
      final nextId = state.products.length;
      final moreProducts = List.generate(
          20,
          (i) => Product(
                id: nextId + i,
                title: 'Product ${nextId + i + 1}',
                description: 'Description for product ${nextId + i + 1}',
              ));
      emit(state.copyWith(
        products: List.of(state.products)..addAll(moreProducts),
        isLoading: false,
      ));
    });
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
