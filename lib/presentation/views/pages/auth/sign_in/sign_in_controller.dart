import 'package:flutter/material.dart';
import 'package:flutter_chat_app/presentation/views/pages/chat/home/chat_home_page.dart';

class SignInController {
  BuildContext? context;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  //  final AuthRepository _repository = AuthRepositoryImpl(AuthApi());
  SignInController({this.context});

  void init({required BuildContext context}) {
    this.context = context;
  }

  void submit() {
    final bool _isValid = formKey.currentState!.validate();
    if (_isValid) {
      // final loginOk = await _repository.login(
      //     email: emailController.text, password: passwordController.text);
      // if (loginOk) {
      //   Navigator.pushNamed(context!, ChatHomePage.routeName);
      // }
    }
  }
}
