import 'package:chat_app_auth/logic/localData/shared_pref.dart';
import 'package:chat_app_auth/routes/app_router.dart';
import 'package:chat_app_auth/routes/screen_name.dart';
import 'package:chat_app_auth/sheared/widget/custom_button.dart';
import 'package:chat_app_auth/utils/resources/colors_manger.dart';
import 'package:chat_app_auth/utils/resources/font_size.dart';
import 'package:chat_app_auth/utils/resources/images_constant.dart';
import 'package:flutter/material.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SharedPrefController().setShowOnce(true);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 10,
            child: Container(
              // height: MediaQuery.sizeOf(context).height * 0.55,
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(30)),
              ),
              child: Image.asset(
                AppImage.imageBoarding,
                color: ColorManager.backGroundButton.withOpacity(0.8),
                colorBlendMode: BlendMode.modulate,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(height: 30),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 19),
            child: Column(
              children: [
                Text(
                  'Welcome to CHAT APP',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: FontSize.s26,
                    color: ColorManager.white,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'A platform for ordinary people with ideas that can can the world. Meet people, join groups, chat online and be a part of creating next big thing.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: FontSize.s16,
                    color: ColorManager.white,
                  ),
                ),
                SizedBox(height: 40),
              ],
            ),
          ),
          CustomButtonWidget(
            title: 'Next',
            textColor: ColorManager.white,
            fontWeight: FontWeight.w500,
            fontSize: 18,
            // width: 250,
            onPressed: () {
              AppRouter.goToAndRemove(screenName: ScreenName.loginScreen);
            },
            backGroundColor: ColorManager.backGroundButton,
          ),
          const Expanded(child: SizedBox(height: 1)),
        ],
      ),
    );
  }
}
