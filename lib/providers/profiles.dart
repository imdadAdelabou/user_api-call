import 'package:flutter/foundation.dart';

class Profile with ChangeNotifier {
  String id;
  String userId;
  String name;
  String type;

  Profile({
    required this.id,
    required this.userId,
    required this.name,
    required this.type,
  });
}

class Profiles with ChangeNotifier {
  List<Profile> profiles = [
    Profile(
      id: 'profile-1',
      userId: 'user-1',
      name: 'Tư vấn thất tình',
      type: 'pdf',
    ),
    Profile(
      id: 'profile-2',
      userId: 'user-1',
      name: 'Tư vấn tán tỉnh',
      type: 'doc',
    ),
  ];

  List<Profile> get getUsers {
    return [...profiles];
  }

  Profile findById(String id) {
    return profiles.firstWhere((post) => post.id == id);
  }

  List<Profile> findWithUserId(String id) {
    return profiles.where((post) => post.userId == id).toList();
  }
}
