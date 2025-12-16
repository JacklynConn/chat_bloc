import 'package:chat_app/core/theme.dart';
import 'package:flutter/material.dart';

import 'chat_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: ChatPage(),
    );
  }
}
