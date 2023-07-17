import 'package:chat_app_auth/feature/home_chat/provider/home_chat_provider.dart';
import 'package:chat_app_auth/feature/home_chat/ui/home_chat_screen.dart';
import 'package:chat_app_auth/feature/on_bording_screen/onBoardingPage.dart';
import 'package:chat_app_auth/feature/registrations/provider/loginProvider.dart';
import 'package:chat_app_auth/feature/registrations/provider/signUpProvider.dart';
import 'package:chat_app_auth/feature/registrations/ui/loginScreen.dart';
import 'package:chat_app_auth/feature/registrations/ui/signUpScreen.dart';
import 'package:chat_app_auth/feature/splash_screen.dart';
import 'package:chat_app_auth/routes/screen_name.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RouteGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    Widget result;
    switch (settings.name) {
      // --------------------------- splashScreen ------------------------------
      case ScreenName.splashScreen:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      // --------------------------- SignUpScreen ------------------------------
      case ScreenName.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
            create: (context) => SignUpProvider(),
            child: const SignUpScreen(),
          ),
        );
      // --------------------------- LoginScreen -------------------------------
      case ScreenName.loginScreen:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
            create: (context) => LoginProvider(),
            child: const LoginScreen(),
          ),
        );
      // --------------------------- HomeChatScreen ----------------------------
      case ScreenName.homeChatScreen:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
            create: (context) => HomeChatProvider(),
            child: const HomeChatScreen(),
          ),
        );
      // -------------------------- OnBoardingScreen ------------------------
      case ScreenName.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingPage(),
        );

      default:
        result = const Scaffold(
          body: Center(
            child: Text(
              'Wrong path',
              style: TextStyle(color: Colors.black, fontSize: 25),
            ),
          ),
        );
    }
    return MaterialPageRoute(builder: (context) => result);
  }
}

class ScreenArguments {
  final String title;
  final int id;

  ScreenArguments({required this.title, required this.id});
}
