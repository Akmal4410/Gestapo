import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gestapo/domaina/user.dart';

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

  static Review fromJson(Map<String, dynamic> json) {
    return Review(
      image: json['image'],
      userName: json['userName'],
      userEmail: json['userEmail'],
      rating: json['rating'],
      review: json['review'],
    );
  }

  static Future<void> addReview({
    required String email,
    required String productName,
    required String review,
    required double rating,
  }) async {
    final user = await UserModel.getCurrentUserData(email: email);
    final reviewDoc = FirebaseFirestore.instance
        .collection('Gestapo')
        .doc('Admin')
        .collection('Products')
        .doc(productName)
        .collection('Reviews')
        .doc(email);

    final reviewModel = Review(
      image: user.image,
      userName: '${user.firstName} ${user.lastName}',
      userEmail: email,
      rating: rating,
      review: review,
    );

    final json = reviewModel.toJson();
    await reviewDoc.set(json);
  }

  static Stream<List<Review>> getAllReview({required String productName}) {
    return FirebaseFirestore.instance
        .collection('Gestapo')
        .doc('Admin')
        .collection('Products')
        .doc(productName)
        .collection('Reviews')
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map(
              (docs) => Review.fromJson(docs.data()),
            )
            .toList());
  }
}
