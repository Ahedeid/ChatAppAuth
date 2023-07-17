import 'package:chat_app_auth/feature/registrations/provider/signUpProvider.dart';
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
import 'package:chat_app_auth/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool selected = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
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
        child: Consumer<SignUpProvider>(
          builder: (context, value, child) => Form(
            key: value.signUpFormKey,
            child: ListView(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.paddingHorizontal),
              children: [
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.1),
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'Sign',
                        style: TextStyle(
                          color: ColorManager.white,
                          fontSize: FontSize.s40,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: 'Up',
                        style: TextStyle(
                            color: ColorManager.primary,
                            fontSize: FontSize.s40,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  AppStrings.createANewAccount,
                  style: TextStyle(
                      fontSize: FontSize.s24, color: ColorManager.white),
                ),
                const SizedBox(height: 40),
                CustomTextField(
                  validator: (val) => Validator2.validateName(val ?? ''),
                  textInputAction: TextInputAction.next,
                  controller: nameController,
                  hintText: AppStrings.fullName,
                  keyboardType: TextInputType.name,
                  prefixIcon: CustomSvgAssets(
                    path: AppIcons.profile,
                    color: ColorManager.primary,
                  ),
                ),
                const SizedBox(height: 14),
                CustomTextField(
                  controller: emailController,
                  validator: (val) => Validator2.validateEmail(val ?? ''),
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
                  controller: phoneController,
                  // validator: (val) =>
                  //     Validator2.validatePhoneNumber(val ?? ''),
                  hintText: AppStrings.phone,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  prefixIcon: CustomSvgAssets(
                    path: AppIcons.lock,
                    color: ColorManager.primary,
                  ),
                ),
                const SizedBox(height: 14),
                CustomTextField(
                  controller: passwordController,
                  // validator: (val) => Validator.passwordCorrect(val ?? ''),
                  suffix: GestureDetector(
                    onTap: () {
                      value.isVisibility();
                    },
                    child: value.visibility
                        ? const Icon(
                            Icons.visibility_off,
                            size: 18,
                          )
                        : const Icon(Icons.visibility, size: 18),
                  ),
                  obscureText: true,
                  hintText: AppStrings.password,
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.next,
                  prefixIcon: CustomSvgAssets(
                    path: AppIcons.lock,
                    color: ColorManager.primary,
                  ),
                ),
                const SizedBox(height: 15),
                CheckboxListTile(
                    contentPadding: EdgeInsets.zero,
                    controlAffinity: ListTileControlAffinity.leading,
                    activeColor: ColorManager.primary,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    title: const Text(
                      AppStrings.agreeWithTramsAndCondition,
                      style: TextStyle(
                          fontSize: FontSize.s16, color: ColorManager.white),
                    ),
                    value: selected,
                    onChanged: (value) {
                      setState(() {
                        selected = value!;
                      });
                    }),
                const SizedBox(height: 25),
                CustomButtonWidget(
                  isLoading: value.isLoading,
                  title: AppStrings.signUp,
                  backGroundColor: ColorManager.backGroundButton,
                  onPressed: () {
                    value.signUp(
                        name: nameController.text,
                        email: emailController.text,
                        password: passwordController.text);
                  },
                ),
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.1),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: InkWell(
                    onTap: () {
                      AppRouter.goTo(screenName: ScreenName.loginScreen);
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
                            text: " ${AppStrings.logIn}",
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
                const SizedBox(height: 10)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
