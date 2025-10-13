import 'package:flutter/material.dart';

class ShopsScreen extends StatelessWidget {
  const ShopsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Магазины'),
      ),
      body: Center(
        child: Text('Экран магазинов!'),
      ),
    );
  }
}
