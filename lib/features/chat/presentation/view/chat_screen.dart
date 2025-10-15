import 'package:dfa_shop/core/utils/app_theme.dart';
import 'package:dfa_shop/features/chat/domain/models/message_model.dart';
import 'package:dfa_shop/features/chat/presentation/bloc/chat_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({required this.bloc, super.key});

  final ChatScreenBloc bloc;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();

  List<MessageModel> messages = [];
  String? errorMessage;

  void _blocListener(BuildContext context, ChatScreenState state) {
    switch (state) {
      case LoadedChatScreenState():
        messages = state.messages;

      case ErrorChatScreenState():
        errorMessage = state.message;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Общение')),
      body: BlocConsumer<ChatScreenBloc, ChatScreenState>(
        bloc: widget.bloc,
        listener: _blocListener,
        builder: (context, state) {
          if (state is ErrorChatScreenState) {
            return Center(child: Text('Возникла ошибка: $errorMessage'));
          } else if (state is InitialChatScreenState || state is LoadingChatScreenState) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: ListView(children: [...messages.map((e) => message(e))])),
                  const SizedBox(height: 24),
                  Form(
                    child: TextFormField(
                      controller: _controller,
                      decoration: const InputDecoration(labelText: 'Напишите сообщение...'),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          widget.bloc.add(SendMessageChatScreenEvent(_controller.text));
          _controller.clear();
        },
        tooltip: 'Send message',
        child: const Icon(Icons.send),
      ),
    );
  }

  Widget message(MessageModel message) => Padding(
    padding: const EdgeInsets.all(4.0),
    child: Align(
      alignment: message.senderId == '10001' ? Alignment.centerRight : Alignment.centerLeft, 
      child: Container(
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(message.message, style: AppTheme.s12w400,),
            SizedBox(height: 4,),
            Text(DateFormat.Hm().format(message.timestamp), style: AppTheme.s10w400.copyWith(fontSize: 8),)
          ],
        ),
      ),
    ),
  );
}
