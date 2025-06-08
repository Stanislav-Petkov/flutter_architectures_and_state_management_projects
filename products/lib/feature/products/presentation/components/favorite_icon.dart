import 'package:flutter/material.dart';

class FavoriteIcon extends StatelessWidget {
  final bool isFavorite;
  final VoidCallback onTap;
  const FavoriteIcon({Key? key, required this.isFavorite, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: isFavorite ? Colors.red : null,
      ),
      onPressed: onTap,
    );
  }
}
