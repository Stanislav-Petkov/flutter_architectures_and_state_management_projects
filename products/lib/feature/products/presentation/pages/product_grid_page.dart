import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/models/product.dart';
import '../cubit/product_list_cubit.dart';
import '../components/product_tile.dart';

class ProductGridPage extends StatefulWidget {
  const ProductGridPage({Key? key}) : super(key: key);

  @override
  State<ProductGridPage> createState() => _ProductGridPageState();
}

class _ProductGridPageState extends State<ProductGridPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    context.read<ProductListCubit>().loadMore();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      context.read<ProductListCubit>().loadMore();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'add') {
                showDialog(
                  context: context,
                  builder: (_) => AddProductDialog(),
                );
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'add',
                child: Text('Add Product'),
              ),
            ],
          ),
        ],
      ),
      body: BlocBuilder<ProductListCubit, ProductListState>(
        builder: (context, state) {
            if (state.products.isEmpty && state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            return GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              controller: _scrollController,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                final product = state.products[index];
                return Dismissible(
                  key: ValueKey(product.id),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                  onDismissed: (_) {
                    context.read<ProductListCubit>().removeProduct(product.id);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Removed "${product.title}"')),
                    );
                  },
                  child: ProductTile(product: product),
                );
              },
            );
          },
        ),
      );
    }
}

class AddProductDialog extends StatefulWidget {
  const AddProductDialog({super.key});

  @override
  State<AddProductDialog> createState() => _AddProductDialogState();
}

class _AddProductDialogState extends State<AddProductDialog> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Product'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Title'),
              autofocus: true,
              validator: (value) => (value == null || value.trim().isEmpty)
                  ? 'Enter a title'
                  : null,
            ),
            TextFormField(
              controller: _descController,
              decoration: const InputDecoration(labelText: 'Description'),
              validator: (value) => (value == null || value.trim().isEmpty)
                  ? 'Enter a description'
                  : null,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              final title = _titleController.text.trim();
              final desc = _descController.text.trim();
              context.read<ProductListCubit>().addProduct(title, desc);
              _titleController.clear();
              _descController.clear();
              FocusScope.of(context).unfocus();
              Navigator.of(context).pop();
            }
          },
          child: const Text('Add'),
        ),
      ],
    );
  }
}
