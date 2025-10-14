import 'package:dfa_shop/core/use_case/base_use_case.dart';
import 'package:dfa_shop/core/use_case/stream_use_case.dart';
import 'package:dfa_shop/features/chat/domain/models/message_model.dart';
import 'package:dfa_shop/features/chat/domain/repository/chat_repository.dart';

class GetMessagesStreamUseCase implements StreamUseCase<List<MessageModel>, NoParams> {
  final ChatRepository repository;

  GetMessagesStreamUseCase(this.repository);

  @override
  Stream<List<MessageModel>> call(NoParams params) {
    return repository.getMessages();
  }
}
