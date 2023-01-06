import 'package:flutter/material.dart';
import 'package:flutter_chat_app/presentation/core/routes/routes.dart';
import 'package:flutter_chat_app/presentation/views/pages/auth/sign_in/sign_in_page.dart';
import 'package:flutter_chat_app/presentation/views/pages/chat/chat_page/chat_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      routes: appRoutes,
      home: const ChatPage(),
    );
  }
}
