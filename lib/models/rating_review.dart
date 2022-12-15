class RatingReview {
  String id;
  String userId;
  String postId;
  double rating;
  DateTime rateTime;
  String review;
  RatingReview({
    required this.id,
    required this.userId,
    required this.postId,
    required this.rating,
    required this.rateTime,
    required this.review,
  });
}