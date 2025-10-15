import 'dart:convert';

import 'package:dfa_shop/features/chat/data/models/message_data_model.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

abstract class ChatRemoteDataSource {
  Stream<dynamic> getMessages();

  Future<void> sendMessage(MessageDataModel message);
}

class ChatRemoteDataSourceImpl implements ChatRemoteDataSource {
  final WebSocketChannel? messagesChannel;

  ChatRemoteDataSourceImpl({required this.messagesChannel});

  @override
  Stream<dynamic> getMessages() {
    if (messagesChannel == null) {
      return Stream<MessageDataModel>.empty();
    }
    return messagesChannel!.stream.asBroadcastStream().map((e) => jsonDecode(e));
  }

  @override
  Future<void> sendMessage(MessageDataModel message) async {
    if(messagesChannel == null) {
      print("New message: ${message.message}");
      return;
    }
    messagesChannel!.sink.add(jsonEncode(message.toJson()));
  }
}
