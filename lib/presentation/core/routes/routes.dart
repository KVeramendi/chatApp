import 'package:flutter/material.dart';
import 'package:flutter_chat_app/presentation/views/pages/auth/login/login_page.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  LoginPage.routeName: (_) => const LoginPage()
};