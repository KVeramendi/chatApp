import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {

  final TextEditingController controller;
  final String textValue;
  const TextFieldWidget({ Key? key, required this.controller, required this.textValue }) : super(key: key);

  //tareas cuando esten seleccionado poder elegir el color
  //definir un color primario, secuandario y terciario para la app
  //agregar validaciones 1 mayuscula 1 minuscula y un numero
  //agregar icono y poneler un color

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xffD9D9D9),
          borderRadius: BorderRadius.circular(20)
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.access_alarm),
            hintText: textValue,
            border: InputBorder.none
          ),
        ),
      ),
    );
  }
}