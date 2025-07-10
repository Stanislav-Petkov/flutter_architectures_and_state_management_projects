import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:products/feature/products/domain/models/product.dart';
import 'package:products/feature/products/domain/repositories/product_repository.dart';
import 'product_details_state.dart';

@injectable
class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  final ProductRepository _repository;

  ProductDetailsCubit(this._repository, Product initialProduct)
      : super(ProductDetailsState(product: initialProduct));

  Future<void> toggleFavorite() async {
    final product = state.product;

    emit(state.copyWith(status: ProductDetailsStatus.loading));

    try {
      await _repository.updateFavorite(product.id, !product.isFavorite);
      final updatedProduct = product.copyWith(isFavorite: !product.isFavorite);

      emit(state.copyWith(
        product: updatedProduct,
        status: ProductDetailsStatus.success,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: ProductDetailsStatus.error,
        errorMessage: 'Failed to update favorite status',
      ));
    }
  }

  void clearError() {
    emit(state.copyWith(
      status: ProductDetailsStatus.success,
      errorMessage: null,
    ));
  }
}
