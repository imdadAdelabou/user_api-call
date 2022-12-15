import 'package:flutter/material.dart';

import './post.dart';
import './post_filter.dart';

class Posts with ChangeNotifier {
  List<Post> posts = [
    Post(
      id: 'p1',
      userId: 'user-1',
      description:
          'Chào mọi người,\nEm hiện đang quen một anh sinh viên năm ba, tụi em đã quen nhau được 4 năm, cuộc tình của tụi em tưởng chừng như hoàn hảo cho đến khi em phát hiện rất nhiều biểu hiện lạ thường của người yêu của em, anh ấy dần lạnh nhạt với em, em cần tìm người có thể tư vấn cho em và giúp em vượt qua nổi đau này\nYêu cầu:\n  • Người có nhiều kinh nghiệm trong chuyện tình yêu\n  • Người cho mình được những lời khuyên mình nên cần làm gì tiếp theo\n',
      emotion: [
        'tiêu cực',
        'Test long string stringstringstringstringstringstring'
      ],
      attachmentsURL: [
        'https://th.bing.com/th/id/OIP.ryNi4Rvuamk39_6rh22nZAHaE8?pid=ImgDet&rs=1',
        'https://media.laodong.vn/Storage/NewsPortal/2020/11/10/853332/Tram-Cam.jpg',
        'https://th.bing.com/th/id/R.269587952bec6c39d577a5905b3657f7?rik=D3rMVwJ81vf8pg&pid=ImgRaw&r=0',
        'https://th.bing.com/th/id/OIP.C4oAQYVSrfRBSTBzRYQ_awHaER?pid=ImgDet&rs=1',
        'https://img.thuthuatphanmem.vn/uploads/2018/09/25/anh-che-that-tinh_110430451.jpg',
        'https://th.bing.com/th/id/R.8bd708cfca87d14c68d4321154ad6321?rik=Ttjj%2fs3ofyOJCg&pid=ImgRaw&r=0',
      ],
      price: 6200000,
      time: DateTime.parse("2021-12-23 11:47:00"),
      content: "Tôi ế quá cần sớm có ny",
      isFullTime: true,
      isDate: false,
      isHour: false,
      isMonth: false,
      isYear: false,
    ),
    Post(
      id: 'p2',
      userId: 'user-2',
      description:
          'Chào mọi người,\nEm hiện đang quen một anh sinh viên năm ba, tụi em đã quen nhau được 4 năm, cuộc tình của tụi em tưởng chừng như hoàn hảo cho đến khi em phát hiện rất nhiều biểu hiện lạ thường của người yêu của em, anh ấy dần lạnh nhạt với em, em cần tìm người có thể tư vấn cho em và giúp em vượt qua nổi đau này\nYêu cầu:\n  • Người có nhiều kinh nghiệm trong chuyện tình yêu\n  • Người cho mình được những lời khuyên mình nên cần làm gì tiếp theo\n',
      emotion: ['vui vẻ'],
      attachmentsURL: [
        'https://th.bing.com/th/id/OIP.ryNi4Rvuamk39_6rh22nZAHaE8?pid=ImgDet&rs=1',
        'https://media.laodong.vn/Storage/NewsPortal/2020/11/10/853332/Tram-Cam.jpg',
        'https://th.bing.com/th/id/R.269587952bec6c39d577a5905b3657f7?rik=D3rMVwJ81vf8pg&pid=ImgRaw&r=0',
        'https://th.bing.com/th/id/OIP.C4oAQYVSrfRBSTBzRYQ_awHaER?pid=ImgDet&rs=1',
        'https://img.thuthuatphanmem.vn/uploads/2018/09/25/anh-che-that-tinh_110430451.jpg',
        'https://th.bing.com/th/id/R.8bd708cfca87d14c68d4321154ad6321?rik=Ttjj%2fs3ofyOJCg&pid=ImgRaw&r=0',
      ],
      price: 300000,
      time: DateTime.parse("2018-09-12 10:57:00"),
      content: "Tôi vừa chia tay bạn trai và cần lời khuyên",
      isFullTime: false,
      isDate: true,
      isHour: false,
      isMonth: false,
      isYear: false,
    ),
    Post(
      id: 'p3',
      userId: 'user-3',
      description:
          'Chào mọi người,\nEm hiện đang quen một anh sinh viên năm ba, tụi em đã quen nhau được 4 năm, cuộc tình của tụi em tưởng chừng như hoàn hảo cho đến khi em phát hiện rất nhiều biểu hiện lạ thường của người yêu của em, anh ấy dần lạnh nhạt với em, em cần tìm người có thể tư vấn cho em và giúp em vượt qua nổi đau này\nYêu cầu:\n  • Người có nhiều kinh nghiệm trong chuyện tình yêu\n  • Người cho mình được những lời khuyên mình nên cần làm gì tiếp theo\n',
      emotion: ['Cảm xúc buồn'],
      attachmentsURL: [
        'https://th.bing.com/th/id/OIP.ryNi4Rvuamk39_6rh22nZAHaE8?pid=ImgDet&rs=1',
        'https://media.laodong.vn/Storage/NewsPortal/2020/11/10/853332/Tram-Cam.jpg',
        'https://th.bing.com/th/id/R.269587952bec6c39d577a5905b3657f7?rik=D3rMVwJ81vf8pg&pid=ImgRaw&r=0',
        'https://th.bing.com/th/id/OIP.C4oAQYVSrfRBSTBzRYQ_awHaER?pid=ImgDet&rs=1',
        'https://img.thuthuatphanmem.vn/uploads/2018/09/25/anh-che-that-tinh_110430451.jpg',
        'https://th.bing.com/th/id/R.8bd708cfca87d14c68d4321154ad6321?rik=Ttjj%2fs3ofyOJCg&pid=ImgRaw&r=0',
      ],
      price: 400000,
      time: DateTime.parse("2018-09-12 10:57:00"),
      content: "Tôi đang tán tỉnh một bạn nam",
      isFullTime: false,
      isDate: false,
      isHour: true,
      isMonth: false,
      isYear: false,
    ),
  ];
  
  List<Post> get getPosts {
    return [...posts];
  }

  Post findById(String id) {
    return posts.firstWhere((post) => post.id == id);
  }

  List<Post> getPostsWithPostWatchedIds(List<String> list) {
    return list.map((item) {
      return posts.firstWhere((element) => element.id == item);
    }).toList();
  }

  List<Post> getPostWithMaxAmout(int maxAmout) {
    if (posts.length <= maxAmout) {
      return posts;
    }

    return posts.getRange(0, maxAmout).toList();
  }

  List<Post> getPostWithFilterAndMaxAmout(PostFilter postFilter, int maxAmout) {
    List<Post> newPosts;

    newPosts = posts.where((post) {
      bool checkString = false;

      List<String> emotionPost = post.emotion.map((str) {
        return str.toLowerCase();
      }).toList();

      List<String> emotionFilter = postFilter.searchContent.map((str) {
        return str.toLowerCase();
      }).toList();

      for (var strFilter in emotionFilter) {
        for (var strPost in emotionPost) {
          if (strFilter.contains(strPost) || strPost.contains(strFilter)) {
            checkString = true;
          }
        }
      }

      return (checkString &&
          post.price >= postFilter.minPrice &&
          post.price <= postFilter.maxPrice &&
          ((post.isFullTime == true && postFilter.isFullTime == true) ||
              (post.isDate == true && postFilter.isDate == true) ||
              (post.isHour == true && postFilter.isHour == true) ||
              (post.isMonth == true && postFilter.isMonth == true) ||
              (post.isYear == true && postFilter.isYear == true)));
    }).toList();

    if (newPosts.length <= maxAmout) {
      return newPosts;
    }
    return newPosts.getRange(0, maxAmout).toList();
  }

  List<Post> getPostWithFilter(PostFilter postFilter) {
    return posts.where((post) {
      bool checkString = false;

      List<String> emotionPost = post.emotion.map((str) {
        return str.toLowerCase();
      }).toList();

      List<String> emotionFilter = postFilter.searchContent.map((str) {
        return str.toLowerCase();
      }).toList();

      for (var strFilter in emotionFilter) {
        for (var strPost in emotionPost) {
          if (strFilter.contains(strPost) || strPost.contains(strFilter)) {
            checkString = true;
          }
        }
      }

      return (checkString &&
          post.price >= postFilter.minPrice &&
          post.price <= postFilter.maxPrice &&
          ((post.isFullTime == true && postFilter.isFullTime == true) ||
              (post.isDate == true && postFilter.isDate == true) ||
              (post.isHour == true && postFilter.isHour == true) ||
              (post.isMonth == true && postFilter.isMonth == true) ||
              (post.isYear == true && postFilter.isYear == true)));
    }).toList();
  }
}
