import 'package:flutter_chat_app/domain/entities/session.dart';

class SessionModel extends Session{
  SessionModel({
    required String token,
    required DateTime createdAt,
    required int expiresIn
  }) 
  : super(token: token,createdAt: createdAt,expiresIn: expiresIn);

  factory SessionModel.fromJson(Map<String,dynamic> json){
    return SessionModel(
      token: json['token'], 
      createdAt: DateTime.parse(json['createdAt']), 
      expiresIn: json['expiresIn']
    );
  }

   Map<String, dynamic> toJson() {
    return {
      "token": token,
      "expiresIn": expiresIn,
      "createdAt": createdAt.toString(),
    };
  }
}