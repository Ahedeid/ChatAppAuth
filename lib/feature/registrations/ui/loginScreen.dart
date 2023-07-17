import 'package:chat_app_auth/feature/registrations/provider/loginProvider.dart';
import 'package:chat_app_auth/routes/app_router.dart';
import 'package:chat_app_auth/routes/screen_name.dart';
import 'package:chat_app_auth/sheared/widget/CustomeSvg.dart';
import 'package:chat_app_auth/sheared/widget/custom_button.dart';
import 'package:chat_app_auth/sheared/widget/custom_textFeild.dart';
import 'package:chat_app_auth/utils/resources/colors_manger.dart';
import 'package:chat_app_auth/utils/resources/font_size.dart';
import 'package:chat_app_auth/utils/resources/icons_constant.dart';
import 'package:chat_app_auth/utils/resources/sizes_in_app.dart';
import 'package:chat_app_auth/utils/resources/strings_in_app.dart';
import 'package:chat_app_auth/utils/validate_extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus &&
              currentFocus.focusedChild != null) {
            currentFocus.focusedChild!.unfocus();
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppSizes.paddingHorizontal),
          child: Consumer<LoginProvider>(
            builder: (context, value, child) => Form(
              key: value.loginFormKey,
              child: SingleChildScrollView(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: MediaQuery.sizeOf(context).height * 0.3),
                    RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: AppStrings.welcome,
                            style: TextStyle(
                              color: ColorManager.white,
                              fontSize: FontSize.s30,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            text: AppStrings.back,
                            style: TextStyle(
                                color: ColorManager.backGroundButton,
                                fontSize: FontSize.s30,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                    CustomTextField(
                      controller: emailController,
                      validator: (val) => val!.validateEmail(),
                      hintText: AppStrings.email,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: CustomSvgAssets(
                        path: AppIcons.email,
                        color: ColorManager.primary,
                      ),
                    ),
                    const SizedBox(height: 14),
                    CustomTextField(
                      controller: passwordController,
                      suffix: GestureDetector(
                        onTap: () {
                          value.isVisibility();
                        },
                        child: value.visibility
                            ? const Icon(
                                Icons.visibility_off,
                                color: ColorManager.white,
                                size: 18,
                              )
                            : const Icon(
                                Icons.visibility,
                                color: ColorManager.white,
                                size: 18,
                              ),
                      ),
                      validator: (val) => val!.validatePassword(),
                      obscureText: value.visibility,
                      hintText: AppStrings.password,
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.next,
                      prefixIcon: CustomSvgAssets(
                        path: AppIcons.lock,
                        color: ColorManager.primary,
                      ),
                    ),
                    const SizedBox(height: 35),
                    CustomButtonWidget(
                      isLoading: value.isLoading,
                      title: AppStrings.logIn,
                      backGroundColor: ColorManager.backGroundButton,
                      onPressed: () {
                        value.login(
                          email: emailController.text,
                          password: passwordController.text,
                        );
                      },
                    ),
                    SizedBox(height: MediaQuery.sizeOf(context).height * 0.1),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: InkWell(
                        onTap: () {
                          AppRouter.goTo(screenName: ScreenName.signUpScreen);
                        },
                        child: RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                  text: AppStrings.haveAnAccount,
                                  style: TextStyle(
                                      color: ColorManager.white,
                                      fontSize: FontSize.s16,
                                      fontWeight: FontWeight.w600)),
                              TextSpan(
                                text: " ${AppStrings.signUp}",
                                style: TextStyle(
                                    color: ColorManager.primary,
                                    fontSize: FontSize.s16,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
