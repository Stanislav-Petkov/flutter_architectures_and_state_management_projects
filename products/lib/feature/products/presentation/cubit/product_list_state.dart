part of 'product_list_cubit.dart';

enum ProductListAction { none, load, delete, markAsFavorite, addProduct }

@immutable
class ProductListState extends Equatable {
  final UnmodifiableListView<Product> products;
  final bool isLoading;
  final String? errorMessage;
  final String? successMessage;
  final ProductListAction lastAction;

  ProductListState({
    List<Product>? products,
    this.isLoading = false,
    this.errorMessage,
    this.successMessage,
    this.lastAction = ProductListAction.none,
  }) : products = UnmodifiableListView(products ?? const []);

  ProductListState copyWith({
    List<Product>? products,
    bool? isLoading,
    String? errorMessage,
    String? successMessage,
    ProductListAction? lastAction,
  }) {
    return ProductListState(
      products:
          products != null ? UnmodifiableListView(products) : this.products,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      successMessage: successMessage,
      lastAction: lastAction ?? this.lastAction,
    );
  }

  @override
  List<Object?> get props =>
      [products, isLoading, errorMessage, successMessage, lastAction];
}
