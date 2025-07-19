import 'package:equatable/equatable.dart';
import 'package:products/core/injection_container.dart';
import 'package:products/core/services/uuid_service.dart';

class Product extends Equatable {
  final String id;
  final String title;
  final String description;
  final bool isFavorite;

  const Product({
    required this.id,
    required this.title,
    required this.description,
    this.isFavorite = false,
  });

  factory Product.create({
    required String title,
    required String description,
    bool isFavorite = false,
  }) {
    final uuidService = getIt<UuidService>();
    return Product(
      id: uuidService.generate(),
      title: title,
      description: description,
      isFavorite: isFavorite,
    );
  }

  Product copyWith({
    String? id,
    String? title,
    String? description,
    bool? isFavorite,
  }) =>
      Product(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        isFavorite: isFavorite ?? this.isFavorite,
      );

  @override
  List<Object?> get props => [id, title, description, isFavorite];
}
