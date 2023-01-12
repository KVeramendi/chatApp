// import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/data/datasources/api/auth_api.dart';
import 'package:flutter_chat_app/data/repositories_impl/auth_repository_impl.dart';
import 'package:flutter_chat_app/domain/repositories/auth_repository.dart';
import 'package:flutter_chat_app/presentation/core/colors/app_colors.dart';
import 'package:flutter_chat_app/presentation/core/utils/toast.dart';
import 'package:flutter_chat_app/presentation/views/pages/auth/sign_up/sign_up_page.dart';

class LoginController {
  BuildContext? context;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  final AuthRepository _repository = AuthRepositoryImpl(AuthApi());
  // final AuthRepository _repository = AuthRepositoryImpl(AuthApi());
  LoginController({this.context});

  void init({required BuildContext context}) {
    this.context = context;
  }

  void submit() async {
    final bool _isValid = formKey.currentState!.validate();
    if (_isValid) {
      showDialog(
          context: context!,
          builder: (context) {
            return const Center(
                child: CircularProgressIndicator(
              color: AppColors.tertiaryAppColor,
            ));
          });
      final loginOk = await _repository.login(
        email: emailController.text,
        password: passwordController.text,
      );
      Navigator.pop(context!);
      if (loginOk) {
        ToastUtils.successToast("Login realizado exitosamente!");
        Navigator.pushNamed(context!, SignUpPage.routeName);
      } else {
        ToastUtils.errorToast("Correo de usuario o contraseña incorrecta!");
      }
    }
  }

  void toRegister() {
    Navigator.pushNamed(context!, SignUpPage.routeName);
  }
}
