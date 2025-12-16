import 'package:chat_app/core/theme.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                'https://randomuser.me/api/portraits/women/65.jpg',
              ),
            ),
            SizedBox(width: 10),
            Text('Bob', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {
              // Action for more options button
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: .all(20),
              children: [
                _buildReceiverMessage(context, 'Hello! How are you?'),
                _buildSenderMessage(
                  context,
                  'I am good, thanks! How about you?',
                ),
                _buildReceiverMessage(context, 'Doing well, thank you!'),
                _buildSenderMessage(
                  context,
                  'Great to hear! What are your plans for today?',
                ),
              ],
            ),
          ),

          _buildMessageInput(context),
        ],
      ),
    );
  }

  Widget _buildReceiverMessage(BuildContext context, String message) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: .only(right: 30, top: 5, bottom: 5),
        padding: .all(15),
        decoration: BoxDecoration(
          color: DefaultColors.receiverMessage,
          borderRadius: .only(
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(0),
            bottomRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
        ),
        child: Text(message, style: Theme.of(context).textTheme.bodyMedium),
      ),
    );
  }

  Widget _buildSenderMessage(BuildContext context, String message) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: .only(left: 30, top: 5, bottom: 5),
        padding: .all(15),
        decoration: BoxDecoration(
          color: DefaultColors.senderMessage,
          borderRadius: .only(
            topLeft: Radius.circular(20),
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(0),
            topRight: Radius.circular(20),
          ),
        ),
        child: Text(message, style: Theme.of(context).textTheme.bodyMedium),
      ),
    );
  }

  Widget _buildMessageInput(BuildContext context) {
    return Container(
      margin: .all(25),
      padding: .symmetric(horizontal: 15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: DefaultColors.sendMessageInput,
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              // Action for camera button
            },
            child: Icon(Icons.camera_alt, color: Colors.grey),
          ),
          SizedBox(width: 10),
          Expanded(
            child: TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Type a message',
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(width: 10),
          GestureDetector(
            onTap: () {
              // Action for sending message
            },
            child: Icon(Icons.send, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
