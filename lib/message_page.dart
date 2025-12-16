import 'package:chat_app/core/theme.dart';
import 'package:flutter/material.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Messages', style: Theme.of(context).textTheme.titleLarge),
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 70,
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {
              // Action for search button
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: .start,
        children: [
          Padding(
            padding: .symmetric(horizontal: 15.0),
            child: Text('Recent', style: Theme.of(context).textTheme.bodySmall),
          ),
          Container(
            height: 100,
            padding: .all(5),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildRecentContact('Alice', context),
                _buildRecentContact('Bob', context),
                _buildRecentContact('Charlie', context),
                _buildRecentContact('Diana', context),
                _buildRecentContact('Eve', context),
              ],
            ),
          ),

          SizedBox(height: 10),
          
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: DefaultColors.messageListPage,
                borderRadius: .only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: ListView(
                children: [
                  _buildMessageTile('Alice', 'Hey, how are you?', '2:30 PM'),
                  _buildMessageTile(
                    'Bob',
                    'Let\'s catch up tomorrow.',
                    '1:15 PM',
                  ),
                  _buildMessageTile(
                    'Charlie',
                    'Did you see the game last night?',
                    '12:45 PM',
                  ),
                  _buildMessageTile('Diana', 'Happy Birthday!', 'Yesterday'),
                  _buildMessageTile(
                    'Eve',
                    'Call me when you can.',
                    'Yesterday',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageTile(String name, String message, String time) {
    return ListTile(
      contentPadding: .symmetric(horizontal: 20.0, vertical: 10.0),
      leading: CircleAvatar(
        radius: 30,
        backgroundImage: NetworkImage(
          'https://randomuser.me/api/portraits/women/65.jpg',
        ),
      ),
      title: Text(
        name,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        message,
        style: TextStyle(color: Colors.grey),
        overflow: .ellipsis,
      ),
      trailing: Text(time, style: TextStyle(color: Colors.grey, fontSize: 12)),
    );
  }

  Widget _buildRecentContact(String name, BuildContext context) {
    return Padding(
      padding: .symmetric(horizontal: 10),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(
              'https://randomuser.me/api/portraits/women/65.jpg',
            ),
          ),
          SizedBox(height: 5),
          Text(name, style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}
