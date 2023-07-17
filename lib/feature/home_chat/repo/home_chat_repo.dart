
import 'package:chat_app_auth/api/base_files_api/base_client.dart';
import 'package:chat_app_auth/api/base_files_api/end_point_api.dart';
import 'package:chat_app_auth/feature/home_chat/model/my_friends_model.dart';
import 'package:chat_app_auth/utils/helper.dart';
import 'package:dio/dio.dart';

class HomeChatRepo {
  //-----------------------------getMyFriends---------------------------------

  static Future<List<Friends>> getMyFriends() async {
    try {
      var response = await BaseClient().get(EndPoints.getFriend);
      final List data = response.data['data']['friends'];
      final List<Friends> values =
          data.map((e) => Friends.fromJson(e)).toList();
      UtilsConfig.showSnackBarMessage(
        message: response.data['message'],
        status: true,
      );
      return values;
    } catch (e) {
      rethrow;
    }
  }

//-----------------------------searchFriends---------------------------------

  static Future<List<Friends>> searchFriends(
      {required String searchText}) async {
    final Response response =
        await BaseClient().get(EndPoints.searchFriends, queryParameters: {
      'search': searchText,
    });

    final List data = response.data['data'];
    final List<Friends> friends = data.map((e) => Friends.fromJson(e)).toList();
    return friends;
  }
}
