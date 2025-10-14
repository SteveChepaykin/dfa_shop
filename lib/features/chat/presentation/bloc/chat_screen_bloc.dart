import 'dart:async';

import 'package:dfa_shop/core/use_case/base_use_case.dart';
import 'package:dfa_shop/features/chat/domain/models/message_model.dart';
import 'package:dfa_shop/features/chat/domain/models/params/send_message_params.dart';
import 'package:dfa_shop/features/chat/domain/use_cases/get_messages_stream_use_case.dart';
import 'package:dfa_shop/features/chat/domain/use_cases/send_message_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'chat_screen_event.dart';
part 'chat_screen_state.dart';

class ChatScreenBloc extends Bloc<ChatScreenEvent, ChatScreenState> {
  ChatScreenBloc({required GetMessagesStreamUseCase getMessagesStreamUseCase, required SendMessageUseCase sendMessageUseCase})
    : _getMessagesStreamUseCase = getMessagesStreamUseCase,
      _sendMessageUseCase = sendMessageUseCase,
      super(InitialChatScreenState()) {
    on<InitializeChatScreenEvent>(_onInitializeChatScreenEvent);
    on<LoadChatScreenEvent>(_onLoadChatScreenEvent);
    on<SendMessageChatScreenEvent>(_onSendMessageChatScreenEvent);
    on<NewMessageChatScreenEvent>(_onNewMessageChatScreenEvent);
    on<ErrorChatScreenEvent>(_onErrorChatScreenEvent);

    _webSocketSubscription = _getMessagesStreamUseCase.call(NoParams()).listen((messages) {
      add(NewMessageChatScreenEvent(messages: messages));
    });
  }

  final GetMessagesStreamUseCase _getMessagesStreamUseCase;
  final SendMessageUseCase _sendMessageUseCase;

  StreamSubscription<dynamic>? _webSocketSubscription;

  List<MessageModel> messages = [];

  FutureOr<void> _onInitializeChatScreenEvent(InitializeChatScreenEvent event, Emitter<ChatScreenState> emit) {}

  FutureOr<void> _onLoadChatScreenEvent(LoadChatScreenEvent event, Emitter<ChatScreenState> emit) {
    emit(LoadedChatScreenState(messages: messages));
  }

  FutureOr<void> _onSendMessageChatScreenEvent(SendMessageChatScreenEvent event, Emitter<ChatScreenState> emit) async {
    var sentResult = await _sendMessageUseCase.call(SendMessageParams(
      message: event.message,
      senderId: (messages.length % 2).toString(),
      time: DateTime.now(),
    ));
    sentResult.fold(
      (f) {
        add(ErrorChatScreenEvent(f.toString()));
      }, 
      (_) {},
    );
  }

  FutureOr<void> _onNewMessageChatScreenEvent(NewMessageChatScreenEvent event, Emitter<ChatScreenState> emit) {
    messages = event.messages;
    emit(LoadedChatScreenState(messages: messages));
  }

  FutureOr<void> _onErrorChatScreenEvent(ErrorChatScreenEvent event, Emitter<ChatScreenState> emit) {
    emit(ErrorChatScreenState(event.errorMessage));
  }

  @override
  Future<void> close() {
    _webSocketSubscription?.cancel();
    return super.close();
  }
}
