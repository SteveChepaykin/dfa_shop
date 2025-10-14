import 'package:dfa_shop/features/chat/data/models/message_data_model.dart';
// import 'package:web_socket_channel/web_socket_channel.dart';

abstract class ChatRemoteDataSource {
  Stream<List<MessageDataModel>> getMessages();
  Future<void> sendMessage(String message);
}

class ChatRemoteDataSourceImpl implements ChatRemoteDataSource {
  // late WebSocketChannel messagesChannel;

  ChatRemoteDataSourceImpl() {
    // messagesChannel = WebSocketChannel.connect(
    //   Uri.parse('wss://bxtest.dfa-media.ru/udachny/messages'),
    // );
  }

  @override
  Stream<List<MessageDataModel>> getMessages() {
    // return messagesChannel.stream.map((event) {
    //   return event.map((e) => MessageDataModel.fromJson(event));
    // });
    return Stream<List<MessageDataModel>>.empty();
  }

  @override
  Future<void> sendMessage(String message) async {
    // messagesChannel.sink.add(message);
    print("New message: $message");
  }
}
