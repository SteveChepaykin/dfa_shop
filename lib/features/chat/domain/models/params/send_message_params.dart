final class SendMessageParams {
  SendMessageParams({
    required this.message,
    required this.senderId,
    required DateTime? time,
  }) {
    timeStamp = time ?? DateTime.now();
  }

  final String message;
  final String senderId;
  late final DateTime? timeStamp;
}