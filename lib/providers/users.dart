import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class User with ChangeNotifier {
  String id;
  String name;
  String avatarURL;
  List<String> emotion;
  List<String> postIdWatched;
  String password;

  User({
    required this.id,
    required this.name,
    required this.avatarURL,
    required this.emotion,
    required this.postIdWatched,
    required this.password,
  });
}

class Users with ChangeNotifier {
  List<User> users = [
    User(
      id: 'user-1',
      name: 'Thị Yến',
      avatarURL:
          'https://afamilycdn.com/2018/10/3/photo1538392226601-15383922266012085392896-15385363281151390636916.jpg',
      emotion: ['Thất tình'],
      postIdWatched: ['p1'],
      password: '',
    ),
    User(
      id: 'user-2',
      name: 'Châu Hoàng',
      avatarURL:
          'https://afamilycdn.com/2018/10/3/photo1538392226601-15383922266012085392896-15385363281151390636916.jpg',
      emotion: ['Thất tình'],
      postIdWatched: ['p1'],
      password: '',
    ),
    User(
      id: 'user-3',
      name: 'Hải Quỳnh',
      avatarURL:
          'https://afamilycdn.com/2018/10/3/photo1538392226601-15383922266012085392896-15385363281151390636916.jpg',
      emotion: ['Thất tình'],
      postIdWatched: ['p1'],
      password: '',
    ),
  ];

  List<User> get getUsers {
    return [...users];
  }

  User findById(String id) {
    return users.firstWhere((post) => post.id == id);
  }

  void addPostIdWathed(String userId, String postId) {
    int index = users.indexWhere((user) => user.id == userId);
    users[index].postIdWatched.insert(0, postId);
    notifyListeners();
  }

  Future<void> fetchAndSetUsers() async {
    final url = Uri.parse('https://loviser.herokuapp.com/auth/getAllUser');
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return;
      }
      print(extractedData["message"]);
      final List<User> loadedProducts = [];

      // users = extractedData["message"].map<User>((prodData) {
      //   print(prodData["name"]);
      //   return User(
      //     id: prodData["_id"],
      //     name: 'ABC',
      //     avatarURL:
      //         'https://afamilycdn.com/2018/10/3/photo1538392226601-15383922266012085392896-15385363281151390636916.jpg',
      //     emotion: ['Thất tình'],
      //     postIdWatched: ['p1'],
      //     password: prodData["password"],
      //     // title: prodData['title'],
      //     // description: prodData['description'],
      //     // price: prodData['price'],
      //     // isFavorite: prodData['isFavorite'],
      //     // imageUrl: prodData['imageUrl'],
      //   );
      // }).toList();

      print(users);
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }
}
