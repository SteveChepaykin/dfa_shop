import 'package:dfa_shop/core/utils/base_page.dart';
import 'package:dfa_shop/features/main/presentation/bloc/main_screen_bloc.dart';
import 'package:dfa_shop/features/main/presentation/view/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

final class MainScreenPage extends BasePage{
  @override
  Widget getScreen() {
    return MainScreen(bloc: getIt<MainScreenBloc>());
  }
}