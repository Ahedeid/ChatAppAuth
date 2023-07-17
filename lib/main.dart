import 'package:chat_app_auth/logic/localData/shared_pref.dart';
import 'package:chat_app_auth/routes/app_router.dart';
import 'package:chat_app_auth/routes/router_generator.dart';
import 'package:chat_app_auth/routes/screen_name.dart';
import 'package:chat_app_auth/utils/helper.dart';
import 'package:chat_app_auth/utils/resources/colors_manger.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefController().init();
  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  //   systemNavigationBarColor: ColorManager.scaffoldColor,
  //   statusBarColor: ColorManager.scaffoldColor,
  //   statusBarIconBrightness: Brightness.dark,
  //   systemNavigationBarIconBrightness: Brightness.dark,
  // ));
  runApp(const ChatTestApp());
}

class ChatTestApp extends StatefulWidget {
  const ChatTestApp({Key? key}) : super(key: key);

  @override
  State<ChatTestApp> createState() => _ChatTestAppState();
}

class _ChatTestAppState extends State<ChatTestApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Raleway',
        scaffoldBackgroundColor: ColorManager.backGroundPrimary,
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.onGenerateRoute,
      initialRoute: ScreenName.splashScreen,
      navigatorKey: AppRouter.navigatorKey,
      scaffoldMessengerKey: UtilsConfig.scaffoldKey,
    );
  }
}
 /*
    "email" : "test@test.com",64762e7fec8ccc963654965c
    "password" : "123456"

    "email" : "a@a.com",6475fecb8a9a331f8b6a204b
    "password" : "123456"



  */