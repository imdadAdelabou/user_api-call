import 'package:flutter/material.dart';

class Authentication extends ChangeNotifier {
  String userIdLogined = 'user-1';
  String accessToken = 'accessToken-String';

  String current_user_id = '';

  void setUserId(String userid) {
    current_user_id = userid;
    notifyListeners();
  }
}
