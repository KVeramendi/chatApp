import 'package:flutter/material.dart';
import 'package:flutter_chat_app/presentation/core/colors/app_colors.dart';
import 'package:flutter_chat_app/presentation/core/shared_widgets/button_submit_widget.dart';
import 'package:flutter_chat_app/presentation/core/shared_widgets/text_field_widget.dart';
import 'package:flutter_chat_app/presentation/core/utils/validators.dart';

class LoginPage extends StatelessWidget {
  static const routeName = 'login';
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Container(
              width: 250,
              height: 250,
              color: Colors.red,
            ),
            const SizedBox(height: 30),
            Form(
              key: _formKey,
              child: Column(
                children: [
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
                            controller: emailController,
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
                            controller: passwordController,
                            textValue: 'Password',
                            validator: (value) => Validators.validatePassword(value)
                        ),   
                      ),
                    ],
                  ),
                  ButtonSubmit(
                    function: (){
                      
                    },
                  )
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
