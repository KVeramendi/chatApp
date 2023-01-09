import 'package:flutter/material.dart';
import 'package:flutter_chat_app/presentation/views/pages/auth/sign_in/sign_in_page.dart';

class LoginController {
  BuildContext? context;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  // final AuthRepository _repository = AuthRepositoryImpl(AuthApi());
  LoginController({this.context});

  void init({required BuildContext context}) {
    this.context = context;
  }

  void submit() async {
    final bool _isValid = formKey.currentState!.validate();
    if (_isValid) {
      //   final loginOk = await _repository.login(
      //       email: emailController.text, password: passwordController.text);
      //   if (loginOk) {
      //     Navigator.pushNamed(context!, SplashPage.routeName);
      //   }
    }
  }

  void toRegister() {
    Navigator.pushNamed(context!, SignInPage.routeName);
  }
}
