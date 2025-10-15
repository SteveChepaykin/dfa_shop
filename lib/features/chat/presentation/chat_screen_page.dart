import 'package:dfa_shop/core/bloc/bloc_disposer.dart';
import 'package:dfa_shop/core/utils/base_page.dart';
import 'package:dfa_shop/features/chat/presentation/bloc/chat_screen_bloc.dart';
import 'package:dfa_shop/features/chat/presentation/view/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

final class ChatScreenPage extends BasePage {
  @override
  Widget get getScreen =>
    BlocDisposer<ChatScreenBloc>(
      create: (_) => getIt.get<ChatScreenBloc>(), 
      builder: (context, bloc) {
        return ChatScreen(bloc: bloc);
      }
    );
}