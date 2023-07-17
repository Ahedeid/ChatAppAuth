import 'dart:async';
import 'package:chat_app_auth/api/base_files_api/app_handelExeption.dart';
import 'package:chat_app_auth/feature/home_chat/model/my_friends_model.dart';
import 'package:chat_app_auth/feature/home_chat/repo/home_chat_repo.dart';
import 'package:chat_app_auth/utils/helper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class HomeChatProvider extends ChangeNotifier {
  bool isLoadingGetFriends = false;
  List<Friends> friendsList = [];

  //----------------------------- Get Friends to User --------------------------

  setLoadingGetFriends(bool value) {
    isLoadingGetFriends = value;
    notifyListeners();
  }

  Future<void> getMyFriends() async {
    try {
      setLoadingGetFriends(true);
      friendsList = await HomeChatRepo.getMyFriends();
      setLoadingGetFriends(false);
    } on DioError catch (e) {
      setLoadingGetFriends(false);
      final errorMessage = DioExceptions.fromDioError(e);
      UtilsConfig.showSnackBarMessage(message: errorMessage, status: false);
    }
  }

//----------------------------------- Search -----------------------------------

  Timer? debounce;
  String searchText = "";
  bool isLoadingSearch = false;

  setLoadingSearch(bool value) {
    isLoadingSearch = value;
    notifyListeners();
  }

  Future<void> searchFriends({required String searchTextUser}) async {
    debugPrint("This is inside onSearch ==> \n\n");
    if (debounce?.isActive ?? false) debounce?.cancel();
    debounce = Timer(const Duration(seconds: 2), () async {
      if (searchText != searchTextUser && searchTextUser.isNotEmpty) {
        try {
          setLoadingSearch(true);
          debugPrint("This is first time request ==> \n\n");
          // friendsList = [];
          friendsList =
              await HomeChatRepo.searchFriends(searchText: searchTextUser);
          setLoadingSearch(false);
        } on DioError catch (e) {
          final errorMessage = DioExceptions.fromDioError(e);
          UtilsConfig.showSnackBarMessage(message: errorMessage, status: false);
          setLoadingSearch(false);
        }
      } else {
        getMyFriends();
      }
      searchText = searchTextUser;
      notifyListeners();
    });
  }
}
