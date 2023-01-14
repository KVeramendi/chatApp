import 'package:flutter/material.dart';
import 'package:flutter_chat_app/presentation/core/colors/app_colors.dart';
import 'package:flutter_chat_app/presentation/core/shared_widgets/text_field_widget.dart';
import 'package:flutter_chat_app/presentation/core/shared_widgets/text_message_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChatPage extends StatelessWidget {
  static const routeName = "chatPage";
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController textController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          padding: const EdgeInsets.all(0),
          splashRadius: 20.0,
          onPressed: () {},
          icon: const FaIcon(
            FontAwesomeIcons.arrowLeft,
            color: AppColors.tertiaryAppColor,
          ),
        ),
        title: Row(
          children: const [
            CircleAvatar(
              backgroundImage: NetworkImage(
                'https://lastfm.freetls.fastly.net/i/u/770x0/d8d94a95bb504667a486d0ade0d237ed.gif',
              ),
            ),
            SizedBox(width: 15.0),
            Text("Calamardo"),
          ],
        ),
        actions: const [
          CircleAvatar(
            backgroundColor: AppColors.tertiaryAppColor,
            child: FaIcon(
              FontAwesomeIcons.phone,
              size: 20.0,
              color: AppColors.white,
            ),
          ),
          SizedBox(width: 15.0),
        ],
        elevation: 0,
        backgroundColor: AppColors.transparent,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: const [
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Hoy',
                  style: TextStyle(
                    color: AppColors.primaryAppColor,
                    fontSize: 16.0,
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              TextMessageWidget(text: "Hola ¿Cómo estás?"),
              SizedBox(height: 10.0),
              TextMessageWidget(
                text: "Hola Bob Esponja!",
                receiving: true,
              ),
              SizedBox(height: 10.0),
              TextMessageWidget(
                text: "¿Cómo has estado todo este tiempo",
                receiving: true,
              ),
              SizedBox(height: 10.0),
              TextMessageWidget(
                  text: "Este mensaje es un ejemplo de líneas múltiples"),
              SizedBox(height: 10.0),
              TextMessageWidget(
                text: "Buena idea Bob",
                receiving: true,
              ),
              SizedBox(height: 10.0),
            ],
          ),
        ),
      ),
      persistentFooterButtons: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.tertiaryAppColor),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 38.0,
                      child: IconButton(
                        padding: const EdgeInsets.all(0),
                        splashRadius: 20.0,
                        onPressed: () {},
                        icon: const FaIcon(
                          FontAwesomeIcons.faceSmile,
                          color: AppColors.tertiaryAppColor,
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextFieldWidget(
                        keyboardType: TextInputType.text,
                        controller: textController,
                        textValue: 'Escribe un mensaje...',
                        filled: false,
                      ),
                    ),
                    SizedBox(
                      width: 38.0,
                      child: IconButton(
                        padding: const EdgeInsets.all(0),
                        splashRadius: 20.0,
                        onPressed: () {},
                        icon: const FaIcon(
                          FontAwesomeIcons.paperclip,
                          color: AppColors.tertiaryAppColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 38.0,
                      child: IconButton(
                        padding: const EdgeInsets.all(0),
                        splashRadius: 20.0,
                        onPressed: () {},
                        icon: const FaIcon(
                          FontAwesomeIcons.camera,
                          color: AppColors.tertiaryAppColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 10.0),
            Ink(
              decoration: const BoxDecoration(
                color: AppColors.tertiaryAppColor,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                splashRadius: 24.0,
                onPressed: () {},
                icon: const FaIcon(
                  FontAwesomeIcons.solidPaperPlane,
                  size: 20.0,
                  color: AppColors.white,
                ),
              ),
            ),
          ],
        ),
      ],
      backgroundColor: AppColors.secondaryAppColor,
    );
  }
}
