import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_chat_app/data/models/session_model.dart';
import 'package:flutter_chat_app/presentation/views/pages/auth/login/login_page.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Auth{
  Auth._internal();
  static final Auth _instance = Auth._internal();
  static Auth get instance => _instance;

  final _storage = const FlutterSecureStorage();
  final key = 'SESSION';

  Completer? _completer;

  Future<void> setSesion(Map<String, dynamic> data) async{
    final SessionModel session = SessionModel(
      token: data['token'], 
      createdAt: DateTime.now(), 
      expiresIn: int.parse(data['expiresIn'])
    );

    final String value = jsonEncode(session.toJson());
    await _storage.write(key: key, value: value);
  }

  Future<SessionModel?> getSession() async{
    final String? value = await _storage.read(key: key);
    if(value != null){
      final Map<String,dynamic> json = jsonDecode(value);
      final session = SessionModel.fromJson(json);
      return session;
    }
    else{
      return null;
    }
  }

  Future<String?> get accessToken async{
    if(_completer != null){
      await _completer!.future;
    }

    _completer = Completer();

    final SessionModel? session = await getSession();

    if(session != null && session.token != null && session.expiresIn != null){
      final DateTime currentDate = DateTime.now();
      final DateTime createdAt = session.createdAt;
      final int expiresIn = session.expiresIn;
      final int diff = currentDate.difference(createdAt).inSeconds;
      final int time = expiresIn-diff;
      if (time >= 360) {
        _completer!.complete();
        return session.token;
      } 
      else{

        //Refresh Token
        /*final Map<String, dynamic> data = await AuthenticationApi.instance.refresh(session.token);
        final rolUser = await Auth._instance.rolUser;
        if (data != null) {
          await this.setSession(data:data,rolUser: rolUser);
          _complete();
          return data['token'];
        }
        _complete();*/
        return null;
      }
    }

  }

  Future<void> logOut(BuildContext context) async{
    await this._storage.delete(key: key);
    Navigator.pushReplacementNamed(context, LoginPage.routeName);
  }
}