import 'package:dfa_shop/features/chat/domain/models/message_model.dart';

abstract class ChatRepository {
  Stream<MessageModel> getMessages();

  Future<void> sendMessage(MessageModel message);
}
