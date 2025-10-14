import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  final int id;
  final String image;
  final String name;
  final double price;
  final double salePrice;
  final int unitValue;
  final String unitString;

  const ProductModel({
    required this.id,
    required this.image,
    required this.name,
    required this.price,
    required this.salePrice,
    required this.unitValue,
    required this.unitString,
  });

  @override
  List<Object?> get props => [id, image, name, price, salePrice, unitValue, unitString];
}
