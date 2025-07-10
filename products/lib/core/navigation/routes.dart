import 'package:flutter/material.dart';
import 'package:products/feature/products/domain/models/product.dart';
import 'package:products/feature/products/presentation/pages/product_details_page.dart';
import 'package:products/feature/products/presentation/pages/product_grid_page.dart';

/// Defines all the routes in the application
class Routes {
  static const String home = '/';
  static const String productDetails = '/product-details';

  /// Route generator for the application
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(
          builder: (_) => const ProductGridPage(),
        );
      case productDetails:
        final product = settings.arguments as Product;
        return MaterialPageRoute<Product>(
          builder: (_) => ProductDetailsPage(product: product),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
