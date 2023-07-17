import 'package:chat_app_auth/api/base_files_api/base_client.dart';
import 'package:chat_app_auth/api/base_files_api/end_point_api.dart';
import 'package:chat_app_auth/logic/model/user_model.dart';


class SignUpRepo {
  static Future<UserModel> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      var response = await BaseClient().post(EndPoints.signUp, data: {
        'name': name,
        'email': email,
        'password': password,
      });
      // if(response.statusCode == 200)
      final data = response.data['data'];
      return UserModel.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }
}
