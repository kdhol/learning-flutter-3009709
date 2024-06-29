import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/widgets/chat_bubble.dart';
import 'package:flutter_learn/widgets/chat_input.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    // get the arguments of LoginPage
    // 2 - we dont need username in construction any more.
    // ModalRoute returns current route with arguments
    // if ModalRoute.of(context) is null then setting can not be applied,
    // therefore ! is added, as loginpage is not null
    final username = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        // TODO: Remove Hard coded Name here
        title: Text('Hi $username'),
        actions: [
          IconButton(
              onPressed: () {
                //TODO: Navigate back to LoginPage on logout
                // pop will get back us to the login page
                Navigator.pushReplacementNamed(context, '/');

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
