import 'package:dfa_shop/core/utils/base_page.dart';
import 'package:dfa_shop/features/chat/presentation/bloc/chat_screen_bloc.dart';
import 'package:dfa_shop/features/chat/presentation/view/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

final class ChatScreenPage extends BasePage {
  @override
  Widget getScreen() {
    return ChatScreen(bloc: getIt<ChatScreenBloc>());
  }
}