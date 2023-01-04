import 'package:flutter/material.dart';
import 'package:flutter_chat_app/presentation/core/colors/app_colors.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String textValue;
  final Color cursorColor;
  final String? Function(String) validator;
  const TextFieldWidget(
      {Key? key,
      required this.controller,
      required this.textValue,
      this.cursorColor = AppColors.tertiaryAppColor,
      required this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 15.0),
          hintText: textValue,
          hintStyle: const TextStyle(color: AppColors.hintTextColor),
          filled: true,
          fillColor: AppColors.primaryAppColor,
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.tertiaryAppColor),
              borderRadius: BorderRadius.circular(20.0)),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))),
      validator: (value) => validator(value ?? ''),
      cursorColor: cursorColor,
    );
  }
}
