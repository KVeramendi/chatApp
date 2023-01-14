import 'package:flutter/material.dart';
import 'package:flutter_chat_app/data/datasources/api/auth_api.dart';
import 'package:flutter_chat_app/data/models/user_model.dart';
import 'package:flutter_chat_app/data/repositories_impl/auth_repository_impl.dart';
import 'package:flutter_chat_app/domain/repositories/auth_repository.dart';
import 'package:flutter_chat_app/presentation/core/colors/app_colors.dart';
import 'package:flutter_chat_app/presentation/core/utils/toast.dart';
import 'package:flutter_chat_app/presentation/views/pages/splash/splash_page.dart';

class ChatHomeController {
  BuildContext? context;
  final TextEditingController searchController = TextEditingController();

  ChatHomeController({this.context});

  void init({required BuildContext context}) {
    this.context = context;
  }
}
