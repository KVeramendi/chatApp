import 'package:flutter/material.dart';
import 'package:flutter_chat_app/presentation/core/colors/app_colors.dart';

class TextMessageWidget extends StatelessWidget {
  final String text;
  final bool receiving;
  const TextMessageWidget(
      {Key? key, required this.text, this.receiving = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: receiving ? Alignment.centerLeft : Alignment.centerRight,
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(
                left: 10.0, top: 10.0, right: 75.0, bottom: 10.0),
            decoration: BoxDecoration(
              color: receiving ? AppColors.black : AppColors.tertiaryAppColor,
              borderRadius: receiving
                  ? const BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0),
                    )
                  : const BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
                      bottomLeft: Radius.circular(10.0),
                    ),
            ),
            child: Text(
              text,
              style: const TextStyle(color: AppColors.white),
              textWidthBasis: TextWidthBasis.longestLine,
            ),
          ),
          Positioned(
            right: 8,
            bottom: 7,
            child: Text(
              TimeOfDay.now().format(context),
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 12.0,
              ),
            ),
          )
        ],
      ),
    );
  }
}
