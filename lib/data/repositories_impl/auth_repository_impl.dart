import 'package:flutter_chat_app/data/datasources/api/auth_api.dart';
import 'package:flutter_chat_app/data/models/user_model.dart';
import 'package:flutter_chat_app/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthApi _api;
  AuthRepositoryImpl(this._api);

  @override
  Future<bool> login({required String email, required String password}) {
    return _api.login(email: email, password: password);
  }

  @override
  Future<bool> signUp({required UserModel model}) {
    return _api.signUp(data: model);
  }
}
