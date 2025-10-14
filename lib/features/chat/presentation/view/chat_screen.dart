import 'package:dfa_shop/features/chat/presentation/bloc/chat_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({required this.bloc, super.key});

  final ChatScreenBloc bloc;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();

  void _blocListener(BuildContext context, ChatScreenState state) {
    switch (state) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chat')),
      body: BlocConsumer<ChatScreenBloc, ChatScreenState>(
        bloc: widget.bloc,
        listener: _blocListener,
        builder: (context, state) {
          if(state is InitialChatScreenState || state is LoadingChatScreenState) {
            return const Center(child: CircularProgressIndicator());
          }
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: ListView(
                  children: [],
                )),
                const SizedBox(height: 24),
                Form(
                  child: TextFormField(
                    controller: _controller,
                    decoration: const InputDecoration(labelText: 'Send a message'),
                  ),
                ),
              ],
            ),
          );
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
}
