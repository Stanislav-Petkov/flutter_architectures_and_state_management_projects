import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/models/product.dart';
import '../cubit/product_list_cubit.dart';
import '../pages/product_details_page.dart';
import 'favorite_icon.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  const ProductTile({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => ProductDetailsPage(product: product),
          ),
        );
      },
      onLongPress: () {
        context.read<ProductListCubit>().removeProduct(product.id);
      },
      child: Card(
        margin: EdgeInsets.zero, // Remove margin, use grid spacing only
        child: Padding(
          padding: const EdgeInsets.all(12), // Inner spacing for content
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                product.title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                product.description.length > 40
                    ? '${product.description.substring(0, 40)}...'
                    : product.description,
                style: const TextStyle(fontSize: 12),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const Spacer(),
              FavoriteIcon(
                isFavorite: product.isFavorite,
                onTap: () {
                  context.read<ProductListCubit>().toggleFavorite(product.id);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
