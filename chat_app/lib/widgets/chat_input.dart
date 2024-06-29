import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ChatInput extends StatelessWidget {
  ChatInput({super.key});

  final chatMessageController = TextEditingController();

  void printChatMessage() {
    if (kDebugMode) {
      print("Chat message : ${chatMessageController.text}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: const BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        IconButton(
            onPressed: () {}, icon: const Icon(Icons.add, color: Colors.white)),
        Expanded(
            child: TextField(
          keyboardType: TextInputType.multiline,
          controller: chatMessageController,
          maxLines: 5,
          minLines: 1,
          textCapitalization: TextCapitalization.sentences,
          decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: "Type your message",
              hintStyle: TextStyle(color: Colors.white)),
        )),
        IconButton(
            onPressed: printChatMessage,
            icon: const Icon(Icons.send_rounded, color: Colors.white))
      ]),
    );
  }
}
