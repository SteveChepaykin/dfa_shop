import 'package:dfa_shop/core/bloc/bloc_disposer.dart';
import 'package:dfa_shop/core/utils/base_page.dart';
import 'package:dfa_shop/features/main/presentation/bloc/main_screen_bloc.dart';
import 'package:dfa_shop/features/main/presentation/view/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

final class MainScreenPage extends BasePage{
  @override
  Widget get getScreen => 
    BlocDisposer<MainScreenBloc>(
      create: (_) => getIt.get<MainScreenBloc>(), 
      builder: (context, bloc) {
        return MainScreen(bloc: bloc);
      }
    );
}