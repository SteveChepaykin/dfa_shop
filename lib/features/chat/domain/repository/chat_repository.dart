import 'package:dfa_shop/features/chat/domain/models/message_model.dart';

abstract class ChatRepository {
  Stream<List<MessageModel>> getMessages();

  Future<void> sendMessage(String message, String senderId, DateTime sendTime);
}
