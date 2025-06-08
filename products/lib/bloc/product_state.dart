part of 'product_cubit.dart';

class ProductState extends Equatable {
  final List<Product> products;
  final bool isLoading;

  const ProductState({
    this.products = const [],
    this.isLoading = false,
  });

  ProductState copyWith({
    List<Product>? products,
    bool? isLoading,
  }) {
    return ProductState(
      products: products ?? this.products,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [products, isLoading];
}
