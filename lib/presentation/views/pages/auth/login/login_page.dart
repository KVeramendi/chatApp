import 'package:flutter/material.dart';
import 'package:flutter_chat_app/presentation/core/shared_widgets/text_field_widget.dart';

class LoginPage extends StatelessWidget {

  static const routeName = 'login';
  const LoginPage({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: 250,
            height: 250,
            color: Colors.red,
          ),
          const SizedBox(height:30),
          TextFieldWidget(
            controller: emailController, 
            textValue: 'Email'
          ),
          TextFieldWidget(
            controller: passwordController, 
            textValue: 'Password'
          ),
        ],
      ),
    );
  }
}