import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Category {
  final String category;
  final String image;

  Category({
    required this.image,
    required this.category,
  });

  Map<String, dynamic> toJason() => {
        'category': category,
        'image': image,
      };

  static Category fromJson(Map<String, dynamic> json) => Category(
        image: json['image'],
        category: json['category'],
      );

  static Stream<List<Category>> getCategories() {
    return FirebaseFirestore.instance
        .collection('Gestapo')
        .doc('Admin')
        .collection('Category')
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map(
              (doc) => Category.fromJson(doc.data()),
            )
            .toList());
  }

  static Future<void> addCategory({
    required String category,
    required String image,
  }) async {
    final docCategory = FirebaseFirestore.instance
        .collection('Gestapo')
        .doc('Admin')
        .collection('Category')
        .doc(category);

    final categories = Category(
      category: category,
      image: image,
    );

    final json = categories.toJason();
    await docCategory.set(json);
  }
}
