import 'package:cboo_mobile_app/widgets/bubble_chat.dart';
import 'package:cboo_mobile_app/widgets/chat_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MessagePage extends StatelessWidget {
  final String userName;
  final String userEmail;

  MessagePage({super.key, required this.userName, required this.userEmail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop(); // Navigate back to previous screen
          },
          icon: Icon(Icons.arrow_back_ios_new_rounded),
        ),
        title: Text('Messages'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.home_rounded),
          ),
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
                            ? Alignment.centerLeft
                            : Alignment.centerRight,
                        message: "Hello world");
                  })),
          ChatInput(),
        ],
      ),
    );
  }
}
