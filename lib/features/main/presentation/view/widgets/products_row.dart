import 'package:dfa_shop/features/main/presentation/view/widgets/product_item.dart';
import 'package:dfa_shop/features/products/domain/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductsRow extends StatelessWidget {
  const ProductsRow({required this.products, super.key});

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0, bottom: 10),
          child: Text(
            'Хит продаж',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        SizedBox(
          height: 250, // Height for product cards
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              ...products.map((prod) => ProductItem(product: prod))
            ],
          ),
        ),
      ],
    );
  }
}
