import 'package:dfa_shop/features/banners/domain/models/banner_model.dart';
import 'package:flutter/material.dart';

class BannerItem extends StatelessWidget {
  const BannerItem({required this.banner, super.key});

  final BannerModel banner;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13),
      child: Container(
        height: 144,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.redAccent, // Placeholder color
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            image: NetworkImage(banner.image),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
