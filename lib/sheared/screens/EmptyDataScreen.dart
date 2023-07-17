import 'package:chat_app_auth/sheared/widget/CustomeSvg.dart';
import 'package:chat_app_auth/utils/resources/colors_manger.dart';
import 'package:chat_app_auth/utils/resources/font_size.dart';
import 'package:chat_app_auth/utils/resources/icons_constant.dart';
import 'package:flutter/material.dart';


class ToEmptyDataWidget extends StatelessWidget {
  const ToEmptyDataWidget({
    super.key,
    required this.title,
    required this.subTitle,
  });

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 100, width: 100, child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: CustomSvgAssets(
              path: AppIcons.logo,
            ),
          )),
          const SizedBox(height: 15),
          const Text(
            'CHAT APP',
            style:
                TextStyle(fontSize: FontSize.s25, fontWeight: FontWeight.w600,color: ColorManager.white),
          ),
          const SizedBox(height: 15),
          Text(
            title,
            style: const TextStyle(
              fontSize: FontSize.s18,
                color: ColorManager.white,
            ),
          ),
          const SizedBox(height: 15),
          Text(
            subTitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: FontSize.s14, color: ColorManager.secondaryTextColor),
          ),
        ],
      ),
    );
  }
}
