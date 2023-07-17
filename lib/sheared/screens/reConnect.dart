
import 'package:chat_app_auth/sheared/widget/custom_button.dart';
import 'package:chat_app_auth/utils/resources/colors_manger.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

// import 'package:udemy_flutter/shared/styles/color.dart';

class NetworkDisconnected extends StatelessWidget {
  final GestureTapCallback onPress;

  const NetworkDisconnected({Key? key, required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: const EdgeInsets.only(right: 15.0, left: 15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 200,
            width: double.infinity,
            child: LottieBuilder.asset(
                'assets/animations/disconnected_network.json'),
          ),
          const SizedBox(
            height: 20.0,
          ),
          const SizedBox(height: 24),
          CustomButtonWidget(
            title: "Retry",
            onPressed: onPress,
            textColor: Colors.white,
            backGroundColor: ColorManager.primary,
          )
          // InkWell(
          //   onTap: onPress,
          //   child: Container(
          //     width: 60,
          //     height: 60,
          //     decoration: BoxDecoration(
          //       shape: BoxShape.circle,
          //       boxShadow: [
          //         BoxShadow(
          //           color: Colors.grey.withOpacity(0.3),
          //           spreadRadius: 1,
          //           blurRadius: 1,
          //           offset: const Offset(0, 1),
          //         ),
          //       ],
          //       color: Colors.white30,
          //     ),
          //     child: const Icon(
          //       Icons.refresh,
          //       color: ColorManager.primaryGreen,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
