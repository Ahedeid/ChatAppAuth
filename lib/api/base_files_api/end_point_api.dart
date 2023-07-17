class EndPoints {
  static const String baseUrl = "https://chatapp2-dg0k.onrender.com/api/";
  static const int receiveTimeout = 35000;
  static const int connectTimeout = 35000;
  static const int offset = 0;
  static const int limit = 10;
  static const String signUp = 'auth/Signup';
  static const String login = 'auth/login';
  static const String getFriend = 'user/get-my-friend';
  static const String searchFriends = 'user/search-user';
  static const String showProfile = 'user/show-profile/';
  static const String getAllUser = 'user/listing';
  static const String addFriends = 'user/send-friend-request';
}
