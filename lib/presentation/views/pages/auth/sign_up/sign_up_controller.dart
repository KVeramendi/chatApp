import 'package:flutter/material.dart';
import 'package:flutter_chat_app/data/datasources/api/auth_api.dart';
import 'package:flutter_chat_app/data/models/user_model.dart';
import 'package:flutter_chat_app/data/repositories_impl/auth_repository_impl.dart';
import 'package:flutter_chat_app/domain/repositories/auth_repository.dart';
import 'package:flutter_chat_app/presentation/core/colors/app_colors.dart';
import 'package:flutter_chat_app/presentation/core/utils/toast.dart';
import 'package:flutter_chat_app/presentation/views/pages/auth/sign_up/sign_up_page.dart';
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
  SignUpController({this.context});

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
      final signUp = await _authRepository.signUp(
          model: UserModel(
        email: emailController.text,
        firstName: nameController.text,
        lastName: lastnameController.text,
        online: false,
        password: passwordController.text,
      ));
      Navigator.pop(context!);
      if (signUp) {
        Navigator.pushNamed(context!, SignUpPage.routeName);
      } else {
        ToastUtils.errorToast("Falló el proceso de registro");
      }
    }
  }
}
