import 'package:flutter/material.dart';
import 'package:flutter_chat_app/presentation/core/colors/app_colors.dart';
import 'package:flutter_chat_app/presentation/logic/search/chat_search/chat_search.dart';
import 'package:flutter_chat_app/presentation/logic/services/socket/socket_service.dart';
import 'package:flutter_chat_app/presentation/views/pages/chat/home/chat_home_controller.dart';
import 'package:provider/provider.dart';

class ChatHomePage extends StatefulWidget {
  static const String routeName = "chathome";
  const ChatHomePage({Key? key}) : super(key: key);

  @override
  State<ChatHomePage> createState() => _ChatHomePageState();
}

class _ChatHomePageState extends State<ChatHomePage> {
  final ChatHomeController _chatHomeController = ChatHomeController();
  String query = '';

  @override
  Widget build(BuildContext context) {
    final socketService = Provider.of<SocketService>(context, listen: false);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.tertiaryAppColor,
        child: const Icon(Icons.add),
        onPressed: () {
        },
      ),
      backgroundColor: AppColors.secondaryAppColor,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SafeArea(
              child: Container(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Wrap(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: AppColors.tertiaryAppColor,
                          ),
                        ),
                        const SizedBox(width: 20),
                        const Text(
                          'Chats',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.logout,
                          size: 30.0,
                          color: AppColors.white,
                        ))
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              padding: const EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.secondaryAppColor,
                  boxShadow: const [
                    BoxShadow(
                        color: AppColors.primaryAppColor,
                        offset: Offset(1, 1),
                        blurRadius: 4,
                        blurStyle: BlurStyle.inner),
                    BoxShadow(
                        color: AppColors.hintTextColor,
                        offset: Offset(-1, -1),
                        blurRadius: 4,
                        blurStyle: BlurStyle.inner),
                  ]),
              width: double.infinity,
              child: TextButton(
                onPressed: () async {
                  final user =
                      await showSearch(context: context, delegate: Search());
                  if (user != null) {
                    socketService.emit("getRoom", {"user": user.id});
                  }
                },
                child: const Text(
                  "Buscar",
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
            // SearchWidget(
            //   text: query,
            //   onChanged: (newValue) {
            //     final users = _chatListSearching.where((user) {
            //       final userNameLower = user.firstName.toLowerCase();
            //       final searchLower = query.toLowerCase();
            //       return userNameLower.contains(searchLower);
            //     }).toList();
            //     setState(() {
            //       query = newValue;
            //       _chatListSearching = users;
            //     });
            //   },
            // ),
            Expanded(
              child: SizedBox(
                child: SingleChildScrollView(
                  child: Column(
                    children: [],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
