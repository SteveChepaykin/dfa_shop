
import 'package:dfa_shop/features/chat/presentation/view/chat_screen.dart';
import 'package:dfa_shop/features/delivery/presentation/view/delivery_screen.dart';
import 'package:dfa_shop/features/main/presentation/view/main_screen.dart';
import 'package:dfa_shop/features/shops/presentation/view/shops_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    MainScreen(),
    DeliveryScreen(),
    ShopsScreen(),
    ChatScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.shop),
            label: 'Главная',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Доставка',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Магазины',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Общение',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
