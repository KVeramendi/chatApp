import 'package:flutter_chat_app/presentation/core/colors/app_colors.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastUtils {
  static void successToast(String text) {
    Fluttertoast.showToast(
      msg: text,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: AppColors.success,
    );
  }

  static void errorToast(String text) {
    Fluttertoast.showToast(
      msg: text,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: AppColors.error,
    );
  }
}
