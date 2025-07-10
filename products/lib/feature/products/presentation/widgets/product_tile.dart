import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products/feature/products/presentation/cubit/product_list_cubit.dart';
import 'package:products/feature/products/domain/models/product.dart';
import 'package:products/core/navigation/routes.dart';
import 'favorite_icon.dart';

class ProductTile extends StatelessWidget {
  final Product product;

  const ProductTile({super.key, required this.product});

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () async {
          final updatedProduct = await Navigator.of(context).pushNamed<Product>(
            Routes.productDetails,
            arguments: product,
          );

          if (!context.mounted) return;

          if (updatedProduct != null && updatedProduct.id == product.id) {
            if (updatedProduct.isFavorite != product.isFavorite) {
              context.read<ProductListCubit>().refreshProduct(updatedProduct);
            }
          }
        },
        onLongPress: () {
          context.read<ProductListCubit>().removeProduct(product.id);
        },
        child: SizedBox(
          width: double.infinity,
          child: Card(
            margin: EdgeInsets.zero,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  Text(
                    product.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    product.description,
                    style: const TextStyle(fontSize: 12),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Spacer(),
                  FavoriteIcon(
                    isFavorite: product.isFavorite,
                    onTap: () {
                      context
                          .read<ProductListCubit>()
                          .toggleFavorite(product.id);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
