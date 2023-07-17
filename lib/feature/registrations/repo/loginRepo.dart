import 'package:chat_app_auth/api/base_files_api/base_client.dart';
import 'package:chat_app_auth/api/base_files_api/end_point_api.dart';
import 'package:chat_app_auth/logic/model/user_model.dart';
import 'package:chat_app_auth/utils/helper.dart';


class LoginRepo {
  static Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    try {
      var response = await BaseClient().post(EndPoints.login, data: {
        'email': email,
        'password': password,
      });
      final data = response.data['data'];
      UtilsConfig.showSnackBarMessage(
        message: response.data['message'],
        status: true,
      );
      return UserModel.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }
}
