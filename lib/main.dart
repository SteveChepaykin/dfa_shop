import 'package:dfa_shop/core/utils/app_theme.dart';
import 'package:dfa_shop/features/home/presentation/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:dfa_shop/di/di_service.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        title: 'DFA Shop',
        themeMode: ThemeMode.system,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        home: const HomeScreen(),
      );
  }
}
