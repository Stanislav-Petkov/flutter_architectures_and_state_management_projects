part of 'product_list_cubit.dart';

class ProductListState extends Equatable {
  final List<Product> products;
  final bool isLoading;

  const ProductListState({
    this.products = const [],
    this.isLoading = false,
  });

  ProductListState copyWith({
    List<Product>? products,
    bool? isLoading,
  }) {
    return ProductListState(
      products: products ?? this.products,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [products, isLoading];
}
