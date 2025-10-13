import 'package:flutter/material.dart';

class DeliveryScreen extends StatelessWidget {
  const DeliveryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Доставка'),
      ),
      body: Center(
        child: Text('Экран доставки!'),
      ),
    );
  }
}
