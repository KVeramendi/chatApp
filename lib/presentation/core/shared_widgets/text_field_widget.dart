import 'package:flutter/material.dart';
import 'package:flutter_chat_app/presentation/core/colors/app_colors.dart';

class TextFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final String textValue;
  final Color cursorColor;
  final String? Function(String)? validator;
  final TextInputType keyboardType;
  final bool filled;
  const TextFieldWidget(
      {Key? key,
      required this.controller,
      required this.textValue,
      this.cursorColor = AppColors.tertiaryAppColor,
      this.validator,
      required this.keyboardType,
      this.filled = true})
      : super(key: key);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  bool _isTextVisible = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 15.0),
          hintText: widget.textValue,
          hintStyle: const TextStyle(color: AppColors.hintTextColor),
          suffixIcon: widget.keyboardType.index == 7
              ? IconButton(
                  onPressed: () =>
                      setState(() => _isTextVisible = !_isTextVisible),
                  icon: _isTextVisible
                      ? const Icon(Icons.visibility_off_rounded)
                      : const Icon(Icons.visibility_rounded))
              : null,
          filled: widget.filled,
          fillColor: widget.filled ? AppColors.primaryAppColor : null,
          focusedBorder: widget.filled
              ? OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: AppColors.tertiaryAppColor),
                  borderRadius: BorderRadius.circular(20.0))
              : InputBorder.none,
          border: widget.filled
              ? OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))
              : InputBorder.none),
      obscureText: widget.keyboardType.index == 7 ? _isTextVisible : false,
      validator: (value) => widget.validator!(value ?? ''),
      cursorColor: widget.cursorColor,
    );
  }
}
