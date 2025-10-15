import 'package:dfa_shop/core/utils/app_theme.dart';
import 'package:dfa_shop/features/product_details/presentation/view/product_details_screen.dart';
import 'package:dfa_shop/features/products/domain/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({required this.product, super.key});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => ProductDetailsScreen(product: product)));
        },
        child: Container(
          width: 114,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(product.image, height: 114, width: double.infinity, fit: BoxFit.cover),
              ),
              SizedBox(height: 5),
              Text(product.name, style: AppTheme.s10w400, maxLines: 3, overflow: TextOverflow.ellipsis),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${product.price.toString()}/${product.unitString}', style: AppTheme.s12w400.copyWith(color: AppTheme.primary)),
                  SvgPicture.asset('assets/svg/add-to-cart-button.svg', width: 32, height: 32, colorFilter: ColorFilter.mode(Colors.transparent, BlendMode.plus)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
