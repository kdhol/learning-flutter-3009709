import 'package:flutter/material.dart';
import 'package:flutter_learn/chat_page.dart';
import 'package:flutter_learn/login_page.dart';

void main() {
  runApp(ChatApp());
}
class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "My first Chatapp",
      theme: ThemeData(primarySwatch: Colors.amber),
      home: const ChatPage()
    );
  }
}



