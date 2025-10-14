
import 'package:dfa_shop/features/chat/presentation/chat_screen_page.dart';
import 'package:dfa_shop/features/delivery/presentation/view/delivery_screen.dart';
import 'package:dfa_shop/features/main/presentation/main_screen_page.dart';
import 'package:dfa_shop/features/shops/presentation/view/shops_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    MainScreenPage().getScreen(),
    DeliveryScreen(),
    ShopsScreen(),
    ChatScreenPage().getScreen(),
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
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Главная'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_basket), label: 'Доставка'),
          BottomNavigationBarItem(icon: Icon(Icons.store), label: 'Магазины'),
          BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline), label: 'Связаться'),
        ],
      ),
    );
  }
}
