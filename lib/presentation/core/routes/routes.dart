import 'package:flutter/material.dart';
import 'package:flutter_chat_app/presentation/views/pages/auth/login/login_page.dart';
import 'package:flutter_chat_app/presentation/views/pages/auth/sign_up/sign_up_page.dart';
import 'package:flutter_chat_app/presentation/views/pages/chat/home/chat_home_page.dart';
import 'package:flutter_chat_app/presentation/views/pages/splash/splash_page.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  LoginPage.routeName: (_) => const LoginPage(),
  SignUpPage.routeName: (_) => const SignUpPage(),
  ChatHomePage.routeName: (_) => const ChatHomePage(),
  SplashPage.routeName: (_) => const SplashPage(),
};
