import 'package:flutter/material.dart';
import 'package:flutter_chat_app/presentation/core/colors/app_colors.dart';

class CardPersonWidget extends StatelessWidget {
  final Size size;
  const CardPersonWidget({ Key? key , required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.primaryAppColor,
            width: 0.5
          )
        )
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: AppColors.tertiaryAppColor
            ),
          ),
          SizedBox(
            width: size.width*0.65,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Jhon Doe',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w600)),
                SizedBox(height: 3),
                Text('Hola papu sale su lol ?',style: TextStyle(color: AppColors.primaryAppColor,fontSize: 14))
              ],
            ),
          ),
          SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('12:35',style: TextStyle(color: AppColors.tertiaryAppColor,fontSize: 14,fontWeight: FontWeight.w600)),
                const SizedBox(height: 5),
                Container(
                  width: 40,
                  height: 20,
                  decoration: BoxDecoration(
                    color: AppColors.tertiaryAppColor,
                    borderRadius: BorderRadius.circular(5)
                  ),
                  child: const Center(
                    child: Text('+99',style: TextStyle(color: AppColors.primaryAppColor,fontSize: 14,fontWeight: FontWeight.w600)),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}