import 'package:chat_app_auth/logic/localData/shared_pref.dart';
import 'package:chat_app_auth/routes/app_router.dart';
import 'package:chat_app_auth/routes/screen_name.dart';
import 'package:chat_app_auth/sheared/widget/CustomeSvg.dart';
import 'package:chat_app_auth/utils/resources/colors_manger.dart';
import 'package:chat_app_auth/utils/resources/icons_constant.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLogIn = SharedPrefController().getLogedin();
  bool onBoardingShows = SharedPrefController().getShowOnce();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
        const Duration(seconds: 3),
        () => AppRouter.goToAndRemove(
              screenName: isLogIn
                  ? ScreenName.homeChatScreen
                  : onBoardingShows
                      ? ScreenName.loginScreen
                      : ScreenName.onBoardingScreen,
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backGroundSplashScreen,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomSvgAssets(
              width: 180,
              height: 180,
              path: AppIcons.logo,
            ),
            const SizedBox(height: 20),
            const Text(
              'CHAT APP',
              style: TextStyle(
                fontSize: 22,
                color: ColorManager.white,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
