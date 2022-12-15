import 'package:flutter/material.dart';

import 'post_filter.dart';

class PostFilters with ChangeNotifier {
  List<PostFilter> postFilters = [
    PostFilter(
      id: 'pf1',
      userId: 'user-1',
      searchContent: ['Cảm xúc tiêu cực'],
      minPrice: 100000,
      maxPrice: 200000,
      isFullTime: true,
      isDate: false,
      isHour: false,
      isMonth: false,
      isYear: false,
    ),
    PostFilter(
      id: 'pf2',
      userId: 'user-1',
      searchContent: ['Cảm xúc buồn'],
      minPrice: 100000,
      maxPrice: 200000,
      isFullTime: true,
      isDate: false,
      isHour: false,
      isMonth: false,
      isYear: false,
    ),
  ];

  List<PostFilter> get getPostFilters {
    return [...postFilters];
  }

  PostFilter findById(String id) {
    return postFilters.firstWhere((postFilter) => postFilter.id == id);
  }

  void add(PostFilter postFilter) {
    postFilters.insert(0, postFilter);
    notifyListeners();
  }

  void remove(PostFilter postFilter) {
    postFilters.remove(postFilter);
    notifyListeners();
  }
}
