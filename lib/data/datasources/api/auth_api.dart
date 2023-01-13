import 'package:dio/dio.dart';
import 'package:flutter_chat_app/data/datasources/local/auth_local.dart';
import 'package:flutter_chat_app/data/models/user_model.dart';
import 'package:flutter_chat_app/presentation/core/environment_config/environment_config.dart';

class AuthApi {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: '${host}api/auth', //'$backendHost/auth',
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
      print(response.data);
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
      return null;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<UserModel?>> getUsersByName(String name) async {
    try {
      final Response response = await _dio.get("/find/$name");
      print(response.data);
      if (response.statusCode == 200) {
        final users = UsersModels.fromJsonList(response.data);
        return users.items;
      }
      return [];
    } catch (e) {
      return [];
    }
  }
}
