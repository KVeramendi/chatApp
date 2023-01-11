import 'package:dio/dio.dart';
import 'package:flutter_chat_app/data/datasources/local/auth_local.dart';
import 'package:flutter_chat_app/data/models/user_model.dart';
import 'package:flutter_chat_app/domain/entities/user.dart';

class AuthApi {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'http://192.168.0.6:3000/api/auth', //'$backendHost/auth',
    contentType: Headers.jsonContentType,
    responseType: ResponseType.json,
    validateStatus: (_) => true,
  ));

  Future<bool> login({required String email, required String password}) async {
    try {
      final Response response = await _dio
          .post('/login', data: {'email': email, 'password': password});
      print(response.data);
      if (response.statusCode == 200) {
        await Auth.instance.setSesion(response.data);
        return true;
      }
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> signUp({
    required UserModel data,
  }) async {
    try {
      final Response response = await _dio.post(
        '/signup',
        data: data.toSignUpJson(),
      );
      if (response.statusCode == 200) {
        await Auth.instance.setSesion(response.data);
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<UserModel?> getUserbyId(int id) async {
    try {
      final Response response = await _dio.get(
        '/users/$id',
      );
      if (response.statusCode == 200) {
        UserModel _user = UserModel.fromJson(response.data);
        return _user;
      }
    } catch (e) {
      rethrow;
    }
  }
}
