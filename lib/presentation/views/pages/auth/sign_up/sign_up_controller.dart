import 'package:flutter/material.dart';
import 'package:flutter_chat_app/data/datasources/api/auth_api.dart';
import 'package:flutter_chat_app/data/repositories_impl/auth_repository_impl.dart';
import 'package:flutter_chat_app/domain/repositories/auth_repository.dart';
import 'package:flutter_chat_app/presentation/views/pages/chat/home/chat_home_page.dart';

class SignUpController {
  BuildContext? context;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  final AuthRepository _authRepository = AuthRepositoryImpl(AuthApi());
  //  final AuthRepository _repository = AuthRepositoryImpl(AuthApi());
  SignUpController({this.context});

  void init({required BuildContext context}) {
    this.context = context;
  }

  void submit() async {
    final bool _isValid = formKey.currentState!.validate();
    if (_isValid) {
      // final loginOk = await _authRepository.signUp(model: model)
      // final loginOk = await _repository.login(
      //     email: emailController.text, password: passwordController.text);
      // if (loginOk) {
      //   Navigator.pushNamed(context!, ChatHomePage.routeName);
      // }
    }
  }
}
