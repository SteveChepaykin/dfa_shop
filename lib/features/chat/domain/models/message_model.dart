
import 'package:equatable/equatable.dart';

class MessageModel extends Equatable {
  final int id;
  final String message;
  final String senderId;
  final DateTime timestamp;

  const MessageModel({
    required this.id,
    required this.message,
    required this.senderId,
    required this.timestamp,
  });

  @override
  List<Object?> get props => [id, message, senderId, timestamp];
}
