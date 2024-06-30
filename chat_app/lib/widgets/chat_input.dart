import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/models/chat_message_entity.dart';

// TODO: Here it was stateless Widget in Pooja's code, It was working for her,
//  when I select Type your message field, then since long it was not tested
//  and I had to change to stateful widget -> there was mistake in Chat_App in Build _loadInitialMessages was also used.
// _loadInitialMessages should be just in initState
class ChatInput extends StatelessWidget {
  // Function which takes ChatMessageEntity named onSubmit
  // onSubmit should be passed from caller of ChatInput
  final Function(ChatMessageEntity) onSubmit;

  ChatInput({super.key, required this.onSubmit});

  final chatMessageController = TextEditingController();

  void onSendButtonPressed() {
    if (kDebugMode) {
      print('ChatMessage: ${chatMessageController.text}');
    }
    //TODO: Add this new message to the default list
    final newMessage = ChatMessageEntity(
        text: chatMessageController.text,
        id: '111',
        createdAt: DateTime.now().millisecond,
        author: Author(userName: 'Kd1994'));

    onSubmit(newMessage);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Message Add button
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),

          // text field where message can be typed
          Expanded(
              child: TextField(
            keyboardType: TextInputType.multiline,
            maxLines: 5,
            minLines: 1,
            controller: chatMessageController,
            textCapitalization: TextCapitalization.sentences,
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
                hintText: "Type your message",
                hintStyle: TextStyle(color: Colors.blueGrey),
                border: InputBorder.none),
          )),

          // message send button
          IconButton(
            onPressed: onSendButtonPressed,
            icon: const Icon(
              Icons.send,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
