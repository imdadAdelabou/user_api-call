import 'package:http/http.dart' as http;
import '../config/config.dart';
import 'dart:convert';

class User {
  String id;
  String name;
  String age;
  String password;
  String about;
  User(
      {required this.id,
      required this.name,
      required this.age,
      required this.about,
      required this.password});
  factory User.fromJson(Map<String, dynamic> json) => User(
      id: json["id"],
      name: json["name"],
      age: json["age"],
      about: json["about"],
      password: json["password"]);

  Future<List<User>> fetchUsers() async {
    final response = await http.get(Uri.parse(urlGetAlUser));
    if (response.statusCode == 200) {
      Map<String, dynamic> mapResponse = json.decode(response.body);
      if (mapResponse["success" == "true"]) {
        final users = mapResponse["message"].cast<Map<String, dynamic>>();
        final listOfUsers =
            await users.map<User>((json) => User.fromJson(json)).toList();
        return listOfUsers;
      } else {
        return [];
      }
    } else {
      throw Exception("Failed to get all user from the internet");
    }
  }
}
