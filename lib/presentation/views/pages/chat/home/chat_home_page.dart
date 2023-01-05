import 'package:flutter/material.dart';
import 'package:flutter_chat_app/presentation/core/colors/app_colors.dart';

class ChatHomePage extends StatefulWidget {
  const ChatHomePage({ Key? key }) : super(key: key);

  @override
  State<ChatHomePage> createState() => _ChatHomePageState();
}

class _ChatHomePageState extends State<ChatHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryAppColor,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SafeArea(
              child: Container(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: AppColors.tertiaryAppColor
                          ),
                        ),
                        const SizedBox(width: 20),
                        const Text('Chats', style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold))
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.secondaryAppColor,
                boxShadow: const [
                  BoxShadow(
                    color: AppColors.primaryAppColor,
                    offset: Offset(1,1),
                    blurRadius: 4,
                    blurStyle: BlurStyle.inner
                  ),
                ]
              ),
              child: const TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search',
                  hintStyle: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w400)
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}