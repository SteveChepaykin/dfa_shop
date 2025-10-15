import 'package:dfa_shop/core/utils/app_theme.dart';
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
          padding: const EdgeInsets.only(left: 13.0, bottom: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/png/season_hit_icon.png', width: 24, height: 24,),
              const SizedBox(width: 10,),
              Text(
                'Хит продаж',
                style: AppTheme.s16w500,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 198,
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                ...products.map((prod) => ProductItem(product: prod))
              ],
            ),
          ),
        ),
      ],
    );
  }
}
