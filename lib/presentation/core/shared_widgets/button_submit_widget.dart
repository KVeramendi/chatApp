import 'package:flutter/material.dart';

class ButtonSubmit extends StatefulWidget {
  final VoidCallback? function;
  const ButtonSubmit({ Key? key, this.function}) : super(key: key);

  @override
  State<ButtonSubmit> createState() => _ButtonSubmitState();
}

class _ButtonSubmitState extends State<ButtonSubmit> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: widget.function, 
      child: Text('Click me')
    );
  }
}