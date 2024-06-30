import 'dart:convert';

import 'package:chat_app/widgets/chat_bubble.dart';
import 'package:chat_app/widgets/chat_input.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'models/chat_message_entity.dart';

class ChatPage extends StatefulWidget {
  ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  // initial state of messages
  List<ChatMessageEntity> _messages = [];

  // load the json file
  _loadInitialMessages() async {
    // get response back from json
    final response = await rootBundle.loadString('assets/mock_messages.json');

    // decode the response
    // jsonDecode is a dynmaic list, so make sure with type hint as list
    final List<dynamic> decodeList = jsonDecode(response) as List;

    // we need now a ListChatMessageEntity which takes response as input and returns List
    //  decodeList.map iterates over all items in list and create a single map
    final List<ChatMessageEntity> _chatMessages = decodeList.map((listItem) {
      return ChatMessageEntity.fromJson(listItem);
    }).toList();

    // final state of messages
    setState(() {
      _messages = _chatMessages;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _loadInitialMessages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _loadInitialMessages();

    // get the arguments of LoginPage
    // 2 - we don't need username in construction any more.
    // ModalRoute returns current route with arguments
    // if ModalRoute.of(context) is null then setting can not be applied,
    // therefore ! is added, as login page is not null
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
                // '/' means homepage of app
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
              //
              //TODO: Create a dynamic sized list
              //
              child: ListView.builder(
                  itemCount: _messages.length,
                  itemBuilder: (context, index) {
                    // chatBubble will be created
                    return ChatBubble(
                      alignment: index % 2 == 0
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      entity: _messages[index],
                    );
                  })),
          ChatInput()
        ],
      ),
    );
  }
}
