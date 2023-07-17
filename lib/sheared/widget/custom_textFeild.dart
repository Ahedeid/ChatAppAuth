import 'package:chat_app_auth/utils/resources/colors_manger.dart';
import 'package:chat_app_auth/utils/resources/font_size.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.hintText,
    this.obscureText = false,
    required this.keyboardType,
    this.bottomMargin = 0,
    this.prefixIcon,
    this.suffix,
    this.suffixIcon,
    this.onChange,
    this.onSaved,
    this.width = double.infinity,
    this.validator,
    this.controller,
    //this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.maxLines = 1,
    this.minLines = 1,
    this.readOnly = false,
    this.textInputAction,
    this.backGroundColor = ColorManager.fillTextFiled,
    this.onFieldSubmitted,
    this.focusNode,
    Key? key,
  }) : super(key: key);

  final int maxLines;
  final int minLines;
  final String hintText;
  final bool obscureText;
  final double bottomMargin;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final Function? onChange;
  final TextEditingController? controller;
  final FocusNode? focusNode;

  //AutovalidateMode? autovalidateMode;
  final Widget? prefixIcon;
  final Widget? suffix;
  final Widget? suffixIcon;
  final double width;
  final bool readOnly;
  final TextInputAction? textInputAction;
  final Color? backGroundColor;
  final void Function(String)? onFieldSubmitted;
  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return Material(

      // elevation: 3,
      shadowColor: Colors.white,
      borderRadius: BorderRadius.circular(10),
      child: TextFormField(
        textInputAction: textInputAction,
        readOnly: readOnly,
        focusNode: focusNode,
        //enableInteractiveSelection: true,
        maxLines: maxLines,
        minLines: minLines,
        style: const TextStyle(color: ColorManager.white),
        onChanged: onChange as Function(String?)?,
        onFieldSubmitted: onFieldSubmitted,
        onSaved: onSaved,
        controller: controller,
        validator: validator,
        keyboardType: keyboardType,
        autovalidateMode: AutovalidateMode.disabled,
        obscureText: obscureText,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          suffix: suffix,
          prefixIcon: prefixIcon,
          hintText: hintText,
          // errorStyle: const TextStyle(fontSize: 12, height: 0.9),
          hintStyle: const TextStyle(
            color: ColorManager.grayText,
            fontSize: FontSize.s16,
          ),
          filled: true,
          fillColor: backGroundColor,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: ColorManager.fillTextFiled,
            ),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: ColorManager.backGroundButton,
              )),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: ColorManager.backGroundButton,
            ),
          ),
        ),
        //autofocus: true ,
      ),
    );
  }
}
