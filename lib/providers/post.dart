import 'package:flutter/foundation.dart';

class Post with ChangeNotifier {
  String id;
  String userId;
  String description;
  List<String> emotion;
  List<String> attachmentsURL;
  double price;
  DateTime time;
  String content;
  bool isFullTime;
  bool isDate;
  bool isHour;
  bool isMonth;
  bool isYear;

  Post({
    required this.id,
    required this.userId,
    required this.description,
    required this.emotion,
    required this.attachmentsURL,
    required this.price,
    required this.time,
    required this.content,
    required this.isFullTime,
    required this.isDate,
    required this.isHour,
    required this.isMonth,
    required this.isYear,
  });
}
