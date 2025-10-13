import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  final int id;
  final String image;
  final String name;
  final double price;
  final String description;

  const ProductModel({
    required this.id,
    required this.image,
    required this.name,
    required this.price,
    required this.description,
  });

  @override
  List<Object?> get props => [id, image, name, price, description];
}
