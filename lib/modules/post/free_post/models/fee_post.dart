import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class FeePost {
  final String userId;
  final String title;
  final String description;
  final List<String> images;
  FeePost({
    required this.userId,
    required this.title,
    required this.description,
    required this.images,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'title': title,
      'description': description,
      'images': images,
    };
  }

  factory FeePost.fromMap(Map<String, dynamic> map) {
    return FeePost(
      userId: map['userId'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      images: List<String>.from(map['images']),
    );
  }

  String toJson() => json.encode(toMap());

  factory FeePost.fromJson(String source) =>
      FeePost.fromMap(json.decode(source) as Map<String, dynamic>);
}
