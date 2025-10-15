import 'dart:convert';
import 'dart:io';
import 'dart:developer' as developer;
import 'dart:math';

Future<void> main() async {
  final server = await HttpServer.bind(InternetAddress.loopbackIPv4, 2345);
  developer.log('Server listening on ws://${server.address.host}:${server.port}');
  print('Server listening on ws://${server.address.host}:${server.port}');

  await for (HttpRequest req in server) {
    if (WebSocketTransformer.isUpgradeRequest(req)) {
      final socket = await WebSocketTransformer.upgrade(req);
      developer.log('Client connected!');
      print('Client connected!');
      socket.listen((message) {
        developer.log('Received: $message');
        print('Received: $message');
        String jsonDataString = message.toString();
        final jsonData = jsonDecode(jsonDataString);
        socket.add(jsonEncode({
          'id': message.hashCode + Random().nextInt(1000),
          'message': 'Echo: ${jsonData['message']}',
          'senderId': 200202.toString(),
          'timestamp': DateTime.now().toIso8601String(),
        }));
      }, onDone: () {
        developer.log('Client disconnected');
        print('Client disconnected');
      });
    } else {
      req.response
        ..statusCode = HttpStatus.forbidden
        ..write('WebSocket connections only')
        ..close();
    }
  }
}
