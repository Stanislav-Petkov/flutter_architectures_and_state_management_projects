part of 'product_list_cubit.dart';

enum ProductListAction { none, load, delete, markAsFavorite, addProduct }

class ProductListState extends Equatable {
  final List<Product> products;
  final bool isLoading;
  final String? errorMessage;
  final String? successMessage;
  final ProductListAction lastAction;

  const ProductListState({
    this.products = const [],
    this.isLoading = false,
    this.errorMessage,
    this.successMessage,
    this.lastAction = ProductListAction.none,
  });

  ProductListState copyWith({
    List<Product>? products,
    bool? isLoading,
    String? errorMessage,
    String? successMessage,
    ProductListAction? lastAction,
  }) {
    return ProductListState(
      products: products ?? this.products,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      successMessage: successMessage,
      lastAction: lastAction ?? this.lastAction,
    );
  }

  @override
  List<Object?> get props => [products, isLoading, errorMessage, successMessage, lastAction];
}

