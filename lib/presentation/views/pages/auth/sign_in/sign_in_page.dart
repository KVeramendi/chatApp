import 'package:flutter/material.dart';
import 'package:flutter_chat_app/presentation/core/colors/app_colors.dart';
import 'package:flutter_chat_app/presentation/core/shared_widgets/text_field_widget.dart';
import 'package:flutter_chat_app/presentation/core/utils/validators.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

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
            const SizedBox(height: 30),
            const Text(
              'CHAT APP',
              style: TextStyle(
                color: AppColors.tertiaryAppColor,
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 50),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Crea tu cuenta',
                style: TextStyle(
                  color: AppColors.primaryAppColor,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Form(
              key: _formKey,
              child: Column(children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.person_rounded,
                      size: 36.0,
                      color: AppColors.primaryAppColor,
                    ),
                    const SizedBox(width: 10.0),
                    Expanded(
                      child: TextFieldWidget(
                        controller: emailController,
                        textValue: 'Nombre',
                        validator: (value) => Validators.validateName(value),
                        keyboardType: TextInputType.name,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.person_rounded,
                      size: 36.0,
                      color: AppColors.primaryAppColor,
                    ),
                    const SizedBox(width: 10.0),
                    Expanded(
                      child: TextFieldWidget(
                        controller: passwordController,
                        textValue: 'Apellidos',
                        validator: (value) =>
                            Validators.validateLastName(value),
                        keyboardType: TextInputType.name,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
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
                        controller: passwordController,
                        textValue: 'Correo electrónico',
                        validator: (value) => Validators.validateEmail(value),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.password_outlined,
                      size: 36.0,
                      color: AppColors.primaryAppColor,
                    ),
                    const SizedBox(width: 10.0),
                    Expanded(
                      child: TextFieldWidget(
                        controller: passwordController,
                        textValue: 'Contraseña',
                        validator: (value) =>
                            Validators.validatePassword(value),
                        keyboardType: TextInputType.visiblePassword,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.password_outlined,
                      size: 36.0,
                      color: AppColors.primaryAppColor,
                    ),
                    const SizedBox(width: 10.0),
                    Expanded(
                      child: TextFieldWidget(
                        controller: passwordController,
                        textValue: 'Confirmar Contraseña',
                        validator: (value) =>
                            Validators.validatePassword(value),
                        keyboardType: TextInputType.visiblePassword,
                      ),
                    ),
                  ],
                ),
              ]),
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
            const SizedBox(height: 50),
            const Text(
              'ó regístrate con',
              style: TextStyle(
                color: AppColors.primaryAppColor,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            IconButton(
                onPressed: () {},
                icon: const FaIcon(
                  FontAwesomeIcons.google,
                  size: 34.0,
                  color: AppColors.tertiaryAppColor,
                )),
          ],
        ),
      ),
      backgroundColor: AppColors.secondaryAppColor,
    );
  }
}
