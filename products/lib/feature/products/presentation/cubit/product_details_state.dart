import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:products/feature/products/domain/models/product.dart';

enum ProductDetailsStatus { initial, loading, success, error }

@immutable
class ProductDetailsState extends Equatable {
  final Product product;
  final ProductDetailsStatus status;
  final String? errorMessage;

  const ProductDetailsState({
    required this.product,
    this.status = ProductDetailsStatus.initial,
    this.errorMessage,
  });

  ProductDetailsState copyWith({
    Product? product,
    ProductDetailsStatus? status,
    String? errorMessage,
  }) =>
      ProductDetailsState(
        product: product ?? this.product,
        status: status ?? this.status,
        errorMessage: errorMessage,
      );

  @override
  List<Object?> get props => [product, status, errorMessage];
}
