import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/widgets/chat_bubble.dart';
import 'package:flutter_learn/widgets/chat_input.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    // get the arguments of LoginPage
    // final username = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hi Kishan'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context); // go to previous Rout?
                if (kDebugMode) {
                  print('Logout pressed');
                }
              },
              icon: const Icon(Icons.logout_sharp)),
          IconButton(
              onPressed: () {
                if (kDebugMode) {
                  print('help pressed');
                }
                //TODO: Navigate back to LoginPage on logout

                if (kDebugMode) {
                  print('Icon pressed!');
                }
              },
              icon: const Icon(Icons.help))
        ],
      ),
      body: Column(
        children: [
          Expanded(
              //TODO: Create a dynamic sized list
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return ChatBubble(
                        alignment: index % 2 == 0
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        message: "Hi");
                  })),
          ChatInput()
        ],
      ),
    );
  }
}
