import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/data/datasources/local/auth_local.dart';
import 'package:flutter_chat_app/presentation/core/colors/app_colors.dart';
import 'package:flutter_chat_app/presentation/logic/services/socket/socket_service.dart';
import 'package:flutter_chat_app/presentation/views/pages/auth/login/login_page.dart';
import 'package:flutter_chat_app/presentation/views/pages/chat/home/chat_home_page.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  static const routeName = 'splash';
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with AfterLayoutMixin {
  @override
  void afterFirstLayout(BuildContext context) {
    _check();
  }

  _check() async {
    final socketService = Provider.of<SocketService>(context, listen: false);
    final String? token = await Auth.instance.accessToken;
    if (token != null) {
      socketService.connect();
      Navigator.pushReplacementNamed(context, ChatHomePage.routeName);
    } else {
      Navigator.pushReplacementNamed(context, LoginPage.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          color: AppColors.tertiaryAppColor,
        ),
      ),
    );
  }
}
