
part of 'models.dart';

class MyListModel {

  final String name;
  final String username;
  final String profilePicture;

  MyListModel({
    required this.name, 
    required this.username, 
    required this.profilePicture
  });

  factory MyListModel.fromJsonMap(Map<String, dynamic> json) => MyListModel(
    name: json["name"] ?? 'no name', 
    username: json["username"] ?? 'no user name', 
    profilePicture: json["profilePicture"] ?? 'no profile picture'
  );

  MyList toMyListPostEntity() => MyList(
    name: name, 
    username: username, 
    profilePicture: profilePicture
  );

}