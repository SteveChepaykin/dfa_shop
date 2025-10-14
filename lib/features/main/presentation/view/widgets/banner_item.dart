import 'package:dfa_shop/features/banners/domain/models/banner_model.dart';
import 'package:flutter/material.dart';

class BannerItem extends StatelessWidget {
  const BannerItem({required this.banner, super.key});

  final BannerModel banner;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        height: 180,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.redAccent, // Placeholder color
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            image: NetworkImage(banner.image),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Сезон\nклубники',
                style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text('Прямо с фермы к столу', style: TextStyle(color: Colors.white, fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}
