import 'package:flutter/material.dart';
import 'package:flutter_chat_app/presentation/core/colors/app_colors.dart';

class ButtonSubmit extends StatefulWidget {
  final String text;
  final VoidCallback? function;
  const ButtonSubmit(this.text, {Key? key, this.function}) : super(key: key);

  @override
  State<ButtonSubmit> createState() => _ButtonSubmitState();
}

class _ButtonSubmitState extends State<ButtonSubmit> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: widget.function,
      style: ButtonStyle(
          overlayColor: MaterialStateProperty.all<Color>(
              AppColors.secondaryAppColor.withOpacity(0.1)),
          backgroundColor:
              MaterialStateProperty.all<Color>(AppColors.tertiaryAppColor),
          minimumSize: MaterialStateProperty.all<Size>(const Size(300, 50)),
          maximumSize: MaterialStateProperty.all<Size>(const Size(300, 50)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ))
          //padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 80,vertical: 10)),
          ),
      child: Text(
        widget.text,
        style: const TextStyle(
          color: AppColors.white,
          fontSize: 18.0,
        ),
      ),
    );
  }
}
