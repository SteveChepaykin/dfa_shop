import 'package:dfa_shop/features/banners/domain/models/banner_model.dart';
import 'package:flutter/material.dart';

class Banners extends StatefulWidget {
  const Banners({required this.banners, super.key});

  final List<BannerModel> banners;

  @override
  State<Banners> createState() => _BannersState();
}

class _BannersState extends State<Banners> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Container(
            height: 180,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.redAccent, // Placeholder color
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                // You'll replace this with an actual image asset
                image: NetworkImage(
                  'https://images.unsplash.com/photo-1588265780516-724e527b14d8?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                ), // Example image
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
        ),
        SizedBox(height: 10),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [_buildPageIndicator(true), _buildPageIndicator(false), _buildPageIndicator(false)]),
        SizedBox(height: 20),
      ],
    );
  }

  Widget _buildPageIndicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      height: 8.0,
      width: isActive ? 24.0 : 8.0,
      decoration: BoxDecoration(color: isActive ? Colors.red : Colors.grey[300], borderRadius: BorderRadius.all(Radius.circular(12))),
    );
  }
}
