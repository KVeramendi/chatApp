import 'package:flutter/material.dart';
import 'package:flutter_chat_app/presentation/views/pages/auth/login/login_page.dart';
import 'package:flutter_chat_app/presentation/views/pages/auth/sign_in/sign_in_page.dart';
import 'package:flutter_chat_app/presentation/views/pages/chat/home/chat_home_page.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  LoginPage.routeName: (_) => const LoginPage(),
  SignInPage.routeName: (_) => const SignInPage(),
  ChatHomePage.routeName: (_) => const ChatHomePage(),
};
