class Review {
  final String image;
  final String userName;
  final String userEmail;
  final double rating;
  final String review;

  Review({
    required this.image,
    required this.userName,
    required this.userEmail,
    required this.rating,
    required this.review,
  });

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'userName': userName,
      'userEmail': userEmail,
      'rating': rating,
      'review': review,
    };
  }
}
