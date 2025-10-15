import 'package:dartz/dartz.dart';
import 'package:dfa_shop/core/network/failure.dart';
import 'package:dfa_shop/core/use_case/base_use_case.dart';
import 'package:dfa_shop/features/chat/domain/models/message_model.dart';
import 'package:dfa_shop/features/chat/domain/models/params/send_message_params.dart';
import 'package:dfa_shop/features/chat/domain/repository/chat_repository.dart';

class SendMessageUseCase implements BaseUseCase<void, SendMessageParams> {
  final ChatRepository repository;

  SendMessageUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(SendMessageParams params) async {
    await repository.sendMessage(
      MessageModel(
        id: params.hashCode, 
        message: params.message, 
        senderId: params.senderId, 
        timestamp: params.timeStamp ?? DateTime.now()
      )
    );
    return const Right(null);
  }
}
