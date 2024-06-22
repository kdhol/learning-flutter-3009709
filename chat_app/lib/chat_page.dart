import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/widgets/chat_bubble.dart';
import 'package:flutter_learn/widgets/chat_input.dart'; // custom class

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyanAccent,
        title: Text("Hey Kishan!"),
        actions: [
          IconButton(
              onPressed: () {
                if (kDebugMode) {
                  print('Logout pressed');
                }
              },
              icon: Icon(Icons.logout_sharp)),
          IconButton(
              onPressed: () {
                if (kDebugMode) {
                  print('help pressed');
                }
              },
              icon: Icon(Icons.help))
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return ChatBubble(
                  alignment: index % 2 == 0
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  message: "Hi");
            },
          )),
          ChatInput()
        ],
      ),
    );
  }
}
