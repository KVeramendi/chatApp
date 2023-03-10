import 'package:flutter/material.dart';
import 'package:flutter_chat_app/presentation/core/routes/routes.dart';
import 'package:flutter_chat_app/presentation/logic/services/socket/socket_service.dart';
import 'package:flutter_chat_app/presentation/views/pages/auth/login/login_page.dart';
import 'package:flutter_chat_app/presentation/views/pages/splash/splash_page.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SocketService()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        routes: appRoutes,
        home: const SplashPage(),
      ),
    );
  }
}
