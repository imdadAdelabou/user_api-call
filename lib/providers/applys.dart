import 'package:flutter/foundation.dart';

class Apply with ChangeNotifier {
  String id;
  String userId; // the one who make apply
  String postId;
  String status; // [ 'Bi tu choi','Da chap nhan', ....]
  double price;
  List<String> profilesIdSelected;

  Apply({
    required this.id,
    required this.userId,
    required this.postId,
    required this.status,
    required this.price,
    required this.profilesIdSelected,
  });
}

class Applys with ChangeNotifier {
  List<Apply> applys = [
    Apply(
      id: 'apply-1',
      userId: 'user-1',
      postId: 'p1',
      status: 'Bị từ chối',
      price: 200,
      profilesIdSelected: ['profile-1'],
    ),
    Apply(
      id: 'apply-2',
      userId: 'user-1',
      postId: 'p2',
      status: 'Đã chấp nhận',
      price: 200,
      profilesIdSelected: ['profile-2'],
    ),
    Apply(
      id: 'apply-3',
      userId: 'user-1',
      postId: 'p3',
      status: 'Đã đánh giá',
      price: 200,
      profilesIdSelected: ['profile-1', 'profile-2'],
    ),
  ];

  List<Apply> get getUsers {
    return [...applys];
  }

  Apply findById(String id) {
    return applys.firstWhere((post) => post.id == id);
  }
}
