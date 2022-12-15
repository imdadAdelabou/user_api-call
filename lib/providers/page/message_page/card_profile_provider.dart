import 'dart:convert';
import 'dart:ffi';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class User {
  late String username;
  late String password;
  late String email;
  late String name;
  String? about;

  User.fromJson(Map json) {
    username = json['username'];
    password = json['password'];
    name = json['name'];
    email = json['email'];
    about = json['about'];
  }
}

class CardProfileProvider with ChangeNotifier {
  User? user;
  Future<void> fetchCurrentUser(String current_user_id) async {
    final url =
        Uri.parse('http://localhost:5000/auth/getUser/$current_user_id');
    try {
      final response = await get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return;
      }
      user = User.fromJson(extractedData['message']);
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }

  Future<void> updatecurrentuser(String current_user_id, String about) async {
    final url = 'http://localhost:5000/auth/updateUser/$current_user_id';
    try {
      Response response = await put(Uri.parse(url), body: {'about': about});
    } catch (error) {
      throw (error);
    }
  }
}
