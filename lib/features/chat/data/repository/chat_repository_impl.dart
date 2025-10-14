import 'package:dfa_shop/features/chat/domain/models/message_model.dart';
import 'package:dfa_shop/features/chat/domain/repository/chat_repository.dart';
import 'package:dfa_shop/features/chat/data/data_source/chat_remote_data_source.dart';

class ChatRepositoryImpl implements ChatRepository {
  final ChatRemoteDataSource remoteDataSource;

  ChatRepositoryImpl({required this.remoteDataSource});

  @override
  Stream<List<MessageModel>> getMessages() {
    return remoteDataSource.getMessages().map((messages) {
      return messages.map((message) {
        return MessageModel(
          id: message.id,
          message: message.message,
          senderId: message.senderId,
          timestamp: message.timestamp,
        );
      }).toList();
    });
  }

  @override
  Future<void> sendMessage(String message, String senderId, DateTime sendTime) async {
    return remoteDataSource.sendMessage(message);
  }
}