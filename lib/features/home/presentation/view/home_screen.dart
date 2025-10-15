
import 'package:dfa_shop/core/utils/app_theme.dart';
import 'package:dfa_shop/features/chat/presentation/chat_screen_page.dart';
import 'package:dfa_shop/features/delivery/presentation/view/delivery_screen.dart';
import 'package:dfa_shop/features/main/presentation/main_screen_page.dart';
import 'package:dfa_shop/features/shops/presentation/view/shops_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  late final List<Widget> _widgetOptions;

  @override
  void initState() {
    super.initState();
    _widgetOptions = <Widget>[
      MainScreenPage().getScreen,
      DeliveryScreen(),
      ShopsScreen(),
      ChatScreenPage().getScreen,
    ]; 
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildBottomBarItem(index: 0, iconPath: 'assets/svg/home_icon.svg', label: 'Главная',),
            _buildBottomBarItem(index: 1, iconPath: 'assets/svg/cart_icon.svg', label: 'Доставка',),
            SizedBox(width: MediaQuery.of(context).size.width * 0.15,),
            _buildBottomBarItem(index: 2, iconPath: 'assets/svg/delivery_icon.svg', label: 'Магазины',),
            _buildBottomBarItem(index: 3, iconPath: 'assets/svg/chat_icon.svg', label: 'Общение',),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomBarItem({required int index, required String iconPath, required String label}) {
    bool isActive = index == _selectedIndex;
    Color currentColor = isActive ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.secondary;
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(iconPath, height: 24, width: 24, colorFilter: ColorFilter.mode(currentColor, BlendMode.srcIn),),
          const SizedBox(height: 5,),
          Text(label, style: AppTheme.s10w400.copyWith(color: currentColor),)
        ],
      ),
    );  
  }
}
