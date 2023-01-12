import 'package:flutter/material.dart';

class ToastUtils {
  static void successMessage(
      {required BuildContext context, required String message}) {
    /*showFlash(
        context: context,
        duration: const Duration(seconds: 2),
        builder: (context, controller) {
          return Flash.bar(
            position: FlashPosition.top,
            behavior: FlashBehavior.floating,
            controller: controller,
            margin: const EdgeInsets.only(top: 10),
            backgroundColor: Colors.greenAccent,
            child: FlashBar(
              content: Center(
                child: Text(
                  message,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          );
        });*/
  }

  static void errorMessage(
      {required BuildContext context, required String message}) {
    /*showFlash(
        context: context,
        duration: const Duration(seconds: 2),
        builder: (context, controller) {
          return Flash.bar(
            position: FlashPosition.top,
            behavior: FlashBehavior.floating,
            controller: controller,
            margin: const EdgeInsets.only(top: 10),
            backgroundColor: Colors.redAccent,
            child: FlashBar(
              content: Center(
                child: Text(
                  message,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          );
        });*/
  }
}
