import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Category {
  final String category;
  Category({required this.category});

  Map<String, dynamic> toJason() => {
        'category': category,
      };

  static Category fromJson(Map<String, dynamic> json) => Category(
        category: json['category'],
      );

  static Stream<List<Category>> getCategories() => FirebaseFirestore.instance
      .collection('Gestapo')
      .doc('Admin')
      .collection('Category')
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map(
            (doc) => Category.fromJson(doc.data()),
          )
          .toList());

  static Future<void> addCategory({required String category}) async {
    final docCategory = FirebaseFirestore.instance
        .collection('Gestapo')
        .doc('Admin')
        .collection('Category')
        .doc(category);
    final categories = Category(category: category);

    final json = categories.toJason();
    await docCategory.set(json);
  }
}
