import 'package:flutter_chat_app/data/models/user_model.dart';

class Room{
  String id;
  UserModel accept;
  UserModel invite;
  String? last_message;
  bool status;
  Room({
    required this.id,
    required this.accept,
    required this.invite,
    this.last_message,
    required this.status
  });
}