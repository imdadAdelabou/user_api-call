import 'package:flutter/foundation.dart';

class PostFilter with ChangeNotifier {
  String id;
  String userId;
  List<String> searchContent;
  double minPrice;
  double maxPrice;
  bool isFullTime;
  bool isDate;
  bool isHour;
  bool isMonth;
  bool isYear;

  PostFilter({
    required this.id,
    required this.userId,
    required this.searchContent,
    required this.minPrice,
    required this.maxPrice,
    required this.isFullTime,
    required this.isDate,
    required this.isHour,
    required this.isMonth,
    required this.isYear,
  });

  String sumSearchContent() {
    String res = '';
    for (var element in searchContent) {
      res = '$res$element ';
    }
    return res;
  }
}
