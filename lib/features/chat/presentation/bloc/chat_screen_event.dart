part of 'chat_screen_bloc.dart';

abstract class ChatScreenEvent {}

class InitializeChatScreenEvent extends ChatScreenEvent {}

class LoadChatScreenEvent extends ChatScreenEvent {}

class SendMessageChatScreenEvent extends ChatScreenEvent {
  SendMessageChatScreenEvent(this.message);

  final String message;
}

class NewMessageChatScreenEvent extends ChatScreenEvent {
  NewMessageChatScreenEvent({required this.messages});

  final List<MessageModel> messages;
}

class ErrorChatScreenEvent extends ChatScreenEvent {
  ErrorChatScreenEvent(this.errorMessage);

  final String errorMessage;
}
