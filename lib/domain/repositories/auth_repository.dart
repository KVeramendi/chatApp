import 'package:flutter_chat_app/data/models/user_model.dart';

abstract class AuthRepository {
  Future<bool> login({required String email, required String password});

  Future<bool> signUp({required UserModel model});
}
