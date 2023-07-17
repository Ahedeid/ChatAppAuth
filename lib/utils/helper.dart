
import 'package:chat_app_auth/routes/app_router.dart';
import 'package:chat_app_auth/utils/resources/colors_manger.dart';
import 'package:chat_app_auth/utils/resources/font_size.dart';
import 'package:flutter/material.dart';

import 'package:flutter/foundation.dart';

log(message) {
  if (kDebugMode) {
    print('\x1B[32m $message \x1B[0m');
  }
}

class UtilsConfig {
  static final navigatorKey = GlobalKey<NavigatorState>();

  static final GlobalKey<ScaffoldMessengerState> scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();

  static showSnackBarMessage({required String message, required bool status}) {
    return scaffoldKey.currentState!.showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 3),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              status == true
                  ? Icons.check_circle_outline
                  : Icons.dangerous_outlined,
               color: ColorManager.white,
            ),
            const SizedBox(width: 5),
            Expanded(
              child: Text(
                message,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: FontSize.s16,
                  color: ColorManager.white,
                ),
              ),
            ),
          ],
        ),
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          // borderSide: BorderSide(
          //   color: status
          //       ? ColorManager.borderSnackBarTrue
          //       : ColorManager.borderSnackBarFalse,
          // ),
        ),
        elevation: 0,
        backgroundColor: status
            ? ColorManager.backGroundSnackBarTrue
            : ColorManager.backGroundSnackBarFalse,
      ),
    );
  }

  static showAlertDialog(BuildContext context, String title) {
    AlertDialog alert = AlertDialog(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      actionsAlignment: MainAxisAlignment.center,
      icon: Align(
        alignment: Alignment.topRight,
        child: InkWell(
          onTap: () {
            AppRouter.back();
          },
          child: const Icon(
            Icons.close,
            size: 20,
          ),
        ),
      ),
      iconPadding: const EdgeInsets.only(right: 10, top: 10),
      contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
      content: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            color: ColorManager.primaryTextColor,
          ),
        ),
      ),
      actions: [
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(7),
              ),
            ),
            onPressed: () => Navigator.pop(context, false),
            child: const Text(
              'No',
              style: TextStyle(color: ColorManager.primaryTextColor),
            )),
        ElevatedButton(
          onPressed: () {
            AppRouter.back();
            UtilsConfig.showSnackBarMessage(
                message: 'Bank account has been deleted.', status: true);
            //  bank.removeItem(index);
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 40),
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(7),
              )),
          child: const Text(
            'Yes',
            style: TextStyle(
              color: ColorManager.primaryTextColor,
            ),
          ),
        ),
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
