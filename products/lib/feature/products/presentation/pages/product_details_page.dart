import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products/feature/products/domain/models/product.dart';
import 'package:products/feature/products/domain/repositories/product_repository.dart';
import 'package:products/feature/products/presentation/cubit/product_details_cubit.dart';
import 'package:products/feature/products/presentation/cubit/product_details_state.dart';
import 'package:products/core/injection_container.dart';

class ProductDetailsPage extends StatelessWidget {
  final Product product;
  const ProductDetailsPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (_) => ProductDetailsCubit(getIt<ProductRepository>(), product),
        child: BlocConsumer<ProductDetailsCubit, ProductDetailsState>(
          listener: (context, state) {
            if (state.status == ProductDetailsStatus.error &&
                state.errorMessage != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.errorMessage!)),
              );
              context.read<ProductDetailsCubit>().clearError();
            }
          },
          builder: (context, state) => Scaffold(
            appBar: AppBar(
              title: Text(state.product.title),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.of(context).pop(state.product);
                },
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(state.product.title,
                      style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 16),
                  Text(state.product.description,
                      style: Theme.of(context).textTheme.bodyMedium),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (state.status == ProductDetailsStatus.loading)
                        const CircularProgressIndicator()
                      else
                        IconButton(
                          icon: Icon(
                            state.product.isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: state.product.isFavorite ? Colors.red : null,
                          ),
                          onPressed: () {
                            context
                                .read<ProductDetailsCubit>()
                                .toggleFavorite();
                          },
                        ),
                      const SizedBox(width: 8),
                      Text(state.product.isFavorite
                          ? 'Favorite'
                          : 'Not favorite'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}