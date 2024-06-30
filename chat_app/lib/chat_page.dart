import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_learn/models/image_model.dart';
import 'package:flutter_learn/widgets/chat_bubble.dart';
import 'package:flutter_learn/widgets/chat_input.dart';
import 'package:http/http.dart' as http;

import 'models/chat_message_entity.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  //initiate state of messages
  List<ChatMessageEntity> _messages = [];

  _loadInitialMessages() async {
    // loadString returns Future object.
    // so we need await or a .then method, we can also nest then
    // Now user should not wait for long async function
    rootBundle.loadString('assets/mock_messages.json').then((response) {
      final List<dynamic> decodedList = jsonDecode(response) as List;

      final List<ChatMessageEntity> chatMessages = decodedList.map((listItem) {
        return ChatMessageEntity.fromJson(listItem);
      }).toList();

      if (kDebugMode) {
        print(chatMessages.length);
      }

      //final state of the messages
      setState(() {
        _messages = chatMessages;
      });
    });

    // Then Do something
    // This section will not wait for previous Asyn operation
  }

  // on send msg btn press, add new message in message list and set new state
  onMessageSent(ChatMessageEntity entity) {
    _messages.add(entity);
    setState(() {});
  }

  // TODO : get http request and show image library
  Future<List<PixelfordImage>> _getNetworkImages() async {
    var endPointUrl = Uri.parse('https://pixelford.com/api2/images');
    final response = await http.get(endPointUrl);

    if (response.statusCode == 200) {
      final List<dynamic> decodedList = jsonDecode(response.body) as List;

      final List<PixelfordImage> imageList = decodedList.map((listItem) {
        return PixelfordImage.fromJson(listItem);
      }).toList();

      if (kDebugMode) {
        print(imageList[0].urlFullSize);
      }
      return imageList;
    } else {
      throw Exception('API is not working');
    }
  }

  @override
  void initState() {
    _loadInitialMessages();
    _getNetworkImages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final username = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Hi $username!'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/');
                if (kDebugMode) {
                  print('Icon pressed!');
                }
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Column(
        children: [
          FutureBuilder<List<PixelfordImage>>(
              future: _getNetworkImages(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<PixelfordImage>> snapshot) {
                if (snapshot.hasData) {
                  return Image.network(snapshot.data![0].urlFullSize);
                } else {
                  return const Text('Sorry API not working!');
                }
                //return const CircularProgressIndicator();
              }),
          Expanded(
              child: ListView.builder(
                  itemCount: _messages.length,
                  itemBuilder: (context, index) {
                    return ChatBubble(
                        alignment:
                            _messages[index].author.userName == 'poojab26'
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                        entity: _messages[index]);
                  })),
          ChatInput(
            onSubmit: onMessageSent,
          ),
        ],
      ),
    );
  }
}
