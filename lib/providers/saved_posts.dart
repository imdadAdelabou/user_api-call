import 'package:flutter/foundation.dart';

class SavedPost with ChangeNotifier {
  String id;
  String userId; // the one who make apply
  String postId;
  String status; // [ 'Bi tu choi','Da chap nhan', ....]

  SavedPost({
    required this.id,
    required this.userId,
    required this.postId,
    required this.status,
  });
}

class SavedPosts with ChangeNotifier {
  List<SavedPost> savePosts = [
    SavedPost(
      id: 'savedpost-1',
      userId: 'user-1',
      postId: 'p1',
      status: 'Đã đóng',
    ),
    SavedPost(
      id: 'savedpost-2',
      userId: 'user-1',
      postId: 'p2',
      status: 'Đang mở',
    ),
    SavedPost(
      id: 'savedpost-3',
      userId: 'user-1',
      postId: 'p3',
      status: 'Đã apply',
    ),
  ];

  List<SavedPost> get getUsers {
    return [...savePosts];
  }

  SavedPost findById(String id) {
    return savePosts.firstWhere((post) => post.id == id);
  }
}
