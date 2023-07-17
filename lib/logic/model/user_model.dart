class UserModel {
  final Token token;
  final Usert user;

  UserModel({
    required this.token,
    required this.user,
  });

  factory UserModel.fromJson(Map<String, dynamic> jsonMap) {
    return UserModel(
      token: Token.fromJson(jsonMap['token']),
      user: Usert.fromJson(jsonMap['user']),
    );
  }

  Map<String, dynamic> toJson() => {
        'token': token.toJson(),
        'user': user.toJson(),
      };
}

class Token {
  String accessToken;
  String refreshToken;

  Token({required this.accessToken, required this.refreshToken});

  factory Token.fromJson(Map<String, dynamic> json) {
    return Token(
      accessToken: json['access_Token'] ?? '',
      refreshToken: json['refresh_token'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'access_Token': accessToken,
        'refresh_token': refreshToken,
      };
}

class Usert {
  String sId;
  String name;
  String email;
  String password;
  List<String> friends;
  bool isDeleted;
  int iV;

  Usert({
    required this.sId,
    required this.name,
    required this.email,
    required this.password,
    required this.friends,
    required this.isDeleted,
    required this.iV,
  });

  factory Usert.fromJson(Map<String, dynamic> json) {
    return Usert(
      sId: json['_id'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      friends: json['friends'].cast<String>(),
      isDeleted: json['isDeleted'],
      iV: json['__v'],
    );
  }

  Map<String, dynamic> toJson() => {
        '_id': sId,
        'name': name,
        'email': email,
        'password': password,
        'friends': friends,
        'isDeleted': isDeleted,
        '__v': iV,
      };
}