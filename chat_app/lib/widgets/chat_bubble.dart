import 'package:flutter/material.dart';

import '../models/chat_message_entity.dart';

class ChatBubble extends StatelessWidget {
  final ChatMessageEntity entity;
  final Alignment alignment;

  const ChatBubble({super.key, required this.entity, required this.alignment});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Container(
        //
        // TODO: What is MediaQuery?
        // width: MediaQuery.of(context).size.width * 0.5,
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.5),
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(40),
        decoration: const BoxDecoration(
            color: Colors.blueGrey,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              entity.text,
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),

            // render image if is not null
            if (entity.imageUrl != null)
              // if image is given, then only render it
              Image.network(
                '${entity.imageUrl}',
                height: 100,
              )
          ],
        ),
      ),
    );
  }
}
