import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_chat_app/presentation/core/colors/app_colors.dart';
import 'package:flutter_chat_app/presentation/core/shared_widgets/button_submit_widget.dart';
import 'package:flutter_chat_app/presentation/core/shared_widgets/text_field_widget.dart';
import 'package:flutter_chat_app/presentation/core/utils/validators.dart';
import 'package:flutter_chat_app/presentation/views/pages/auth/login/login_controller.dart';

class LoginPage extends StatefulWidget {
  static const routeName = 'login';
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginController _loginController = LoginController();

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance?.addPostFrameCallback((timeStamp) {
      _loginController.init(context: context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            SizedBox(
              width: 250,
              height: 250,
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Image.asset('assets/login.png'),
              ),
            ),
            const SizedBox(height: 50),
            Form(
              key: _loginController.formKey,
              child: Column(children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.email_rounded,
                      size: 36.0,
                      color: AppColors.primaryAppColor,
                    ),
                    const SizedBox(width: 10.0),
                    Expanded(
                      child: TextFieldWidget(
                        controller: _loginController.emailController,
                        textValue: 'Email',
                        validator: (value) => Validators.validateEmail(value),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.lock_rounded,
                      size: 36.0,
                      color: AppColors.primaryAppColor,
                    ),
                    const SizedBox(width: 10.0),
                    Expanded(
                      child: TextFieldWidget(
                        keyboardType: TextInputType.emailAddress,
                        controller: _loginController.passwordController,
                        textValue: 'Password',
                        validator: (value) =>
                            Validators.validatePassword(value),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                ButtonSubmit(
                  "Login",
                  function: () {
                    _loginController.submit();
                  },
                ),
                const SizedBox(height: 40.0),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const Text(
                    '¿Aún no tienes cuenta?',
                    style: TextStyle(
                      color: AppColors.primaryAppColor,
                      fontSize: 16.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () => _loginController.toRegister(),
                    child: const Text(
                      'Regístrate',
                      style: TextStyle(
                        color: AppColors.tertiaryAppColor,
                        fontSize: 16.0,
                      ),
                    ),
                  )
                ])
              ]),
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
          ],
        ),
      ),
      backgroundColor: AppColors.secondaryAppColor,
    );
  }
}
