import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gestapo/domaina/product.dart';

class Wishlist {
  static Future<void> addToWishList(String user, Product product) async {
    final wishDoc = FirebaseFirestore.instance
        .collection('Gestapo')
        .doc('Users')
        .collection('Profile')
        .doc(user)
        .collection('Wishlist')
        .doc(product.productName);

    final json = product.toJason();
    await wishDoc.set(json);
  }

  static Future<void> removeFromWishList(String user, Product product) async {
    await FirebaseFirestore.instance
        .collection('Gestapo')
        .doc('Users')
        .collection('Profile')
        .doc(user)
        .collection('Wishlist')
        .doc(product.productName)
        .delete();
  }

  static Stream<List<Product>> getWishList(String user) {
    return FirebaseFirestore.instance
        .collection('Gestapo')
        .doc('Users')
        .collection('Profile')
        .doc(user)
        .collection('Wishlist')
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((docs) => Product.fromJson(docs.data()))
              .toList(),
        );
  }
}
