import 'package:chat_app_auth/api/base_files_api/app_handelExeption.dart';
import 'package:chat_app_auth/feature/registrations/repo/loginRepo.dart';
import 'package:chat_app_auth/logic/localData/shared_pref.dart';
import 'package:chat_app_auth/logic/model/user_model.dart';
import 'package:chat_app_auth/routes/app_router.dart';
import 'package:chat_app_auth/routes/screen_name.dart';
import 'package:chat_app_auth/utils/helper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class LoginProvider extends ChangeNotifier {
  bool isLoading = false;
  UserModel? user;

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  bool visibility = true;

  isVisibility() {
    visibility = !visibility;
    notifyListeners();
  }

  setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    if (loginFormKey.currentState!.validate()) {
      try {
        setLoading(true);
        UserModel res = await LoginRepo.login(email: email, password: password);
        SharedPrefController().setLogedin();
        SharedPrefController().save(res);
        AppRouter.goToAndRemove(screenName: ScreenName.homeChatScreen);
        user = res;
        setLoading(false);
      } on DioError catch (e) {
        setLoading(false);
        final errorMessage =
            e.response != null && e.response!.data["message"] != ""
                ? e.response!.data["message"]
                : DioExceptions.fromDioError(e).toString();
        UtilsConfig.showSnackBarMessage(
          message: errorMessage,
          status: false,
        );
      }
    }
  }
}
