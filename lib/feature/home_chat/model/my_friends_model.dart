class MyFriendsModel {
  final String id;
  final String name;
  final String email;
  final bool isDeleted;
  final int v;
  List<Friends> friends;

  MyFriendsModel({
    required this.name,
    required this.isDeleted,
    required this.id,
    required this.email,
    required this.v,
    required this.friends,
  });

  factory MyFriendsModel.fromJson(Map<String, dynamic> map) {
    final List<dynamic> friend = map['friends'];
    return MyFriendsModel(
      name: map['name'],
      isDeleted: map['isDeleted'],
      id: map['_id'],
      email: map['email'],
      v: map['__v'],
      friends: friend.map((e) => Friends.fromJson(e)).toList(),
    );
  }
}

class Friends {
  String sId;
  String name;
  String email;
  List<String> friends;
  bool isDeleted;
  int iV;

  Friends({
    required this.sId,
    required this.name,
    required this.email,
    required this.friends,
    required this.isDeleted,
    required this.iV,
  });

  factory Friends.fromJson(Map<String, dynamic> json) {
    return Friends(
      sId: json['_id'] ?? '',
      name: json['name'],
      email: json['email'],
      friends: json['friends'].cast<String>(),
      isDeleted: json['isDeleted'],
      iV: json['__v'],
    );
  }
}

// void main() {
//    String jsonFormate = '''  {
//                     "_id": "64762e46ec8ccc9636549659",
//                     "name": "Test",
//                     "email": "ah@a2.com",
//                     "friends": ["ahed"],
//                     "isDeleted": false,
//                     "__v": 0
//                 }''';
//
//    final jsonDecoded = jsonDecode(jsonFormate);
//    MyFriends userModel = MyFriends.fromJson(jsonDecoded);
//
//    print(userModel.friends);
//  }
