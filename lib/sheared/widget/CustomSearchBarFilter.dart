
import 'package:chat_app_auth/sheared/widget/custom_textFeild.dart';
import 'package:chat_app_auth/utils/resources/strings_in_app.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar(
      {this.hintText = AppStrings.search,
      this.onChange,
      this.controller,
      Key? key})
      : super(key: key);
  final Function? onChange;
  final TextEditingController? controller;

  final String hintText;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      onFieldSubmitted: (_) => FocusScope.of(context).nearestScope,
      textInputAction: TextInputAction.next,
      hintText: hintText,
      keyboardType: TextInputType.name,
      prefixIcon: const Icon(
        Icons.search,
        color: Colors.grey,
      ),
      controller: controller,
      onChange: onChange,
    );
  }
}
