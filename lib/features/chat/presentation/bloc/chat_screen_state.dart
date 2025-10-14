part of 'chat_screen_bloc.dart';

abstract class ChatScreenState {}

class InitialChatScreenState extends ChatScreenState {}

class LoadingChatScreenState extends ChatScreenState {}

class LoadedChatScreenState extends ChatScreenState {
  LoadedChatScreenState({required this.messages});

  final List<MessageModel> messages;
}

class ErrorChatScreenState extends ChatScreenState {
  ErrorChatScreenState(this.message);

  final String message;
}
