import 'package:dfa_shop/features/chat/data/models/message_data_model.dart';
import 'package:dfa_shop/features/chat/domain/models/message_model.dart';
import 'package:dfa_shop/features/chat/domain/repository/chat_repository.dart';
import 'package:dfa_shop/features/chat/data/data_source/chat_remote_data_source.dart';

class ChatRepositoryImpl implements ChatRepository {
  final ChatRemoteDataSource remoteDataSource;

  ChatRepositoryImpl({required this.remoteDataSource});

  @override
  Stream<MessageModel> getMessages() {
    return remoteDataSource.getMessages().map((data) {
      final message = MessageDataModel.fromJson(data);
      return MessageModel(
        id: message.id,
        message: message.message,
        senderId: message.senderId,
        timestamp: message.timestamp,
      );
    });
  }

  @override
  Future<void> sendMessage(MessageModel message) async {
    await remoteDataSource.sendMessage(
      MessageDataModel(
        id: message.id, 
        message: message.message, 
        senderId: message.senderId, 
        timestamp: message.timestamp
      ),
    );
  }
}