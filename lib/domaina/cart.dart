import 'package:cloud_firestore/cloud_firestore.dart';

class Cart {
  final String productName;
  final String image;
  final int size;
  final int price;
  final int cartCount;

  Cart({
    required this.productName,
    required this.image,
    required this.size,
    required this.price,
    required this.cartCount,
  });

  Map<String, dynamic> toJson() {
    return {
      'productName': productName,
      'image': image,
      'size': size,
      'price': price,
      'cartCount': cartCount,
    };
  }

  static Cart fromJson(Map<String, dynamic> json) {
    return Cart(
      productName: json['productName'],
      image: json['image'],
      size: json['size'],
      price: json['price'],
      cartCount: json['cartCount'],
    );
  }

  static Future<void> addToCart({
    required String user,
    required String productName,
    required String image,
    required int size,
    required int price,
    required int cartCount,
  }) async {
    final cartDoc = FirebaseFirestore.instance
        .collection('Gestapo')
        .doc('Users')
        .collection('Profile')
        .doc(user)
        .collection('Cart')
        .doc(productName + size.toString());

    final cart = Cart(
      productName: productName,
      image: image,
      size: size,
      price: price,
      cartCount: cartCount,
    );

    final json = cart.toJson();
    await cartDoc.set(json);
  }

  static Future<void> updateCart(
      {required Cart cartItem,
      required int quantity,
      required String user}) async {
    final cartDoc = FirebaseFirestore.instance
        .collection('Gestapo')
        .doc('Users')
        .collection('Profile')
        .doc(user)
        .collection('Cart')
        .doc(cartItem.productName + cartItem.size.toString());

    final cart = Cart(
      productName: cartItem.productName,
      image: cartItem.image,
      size: cartItem.size,
      price: cartItem.price,
      cartCount: quantity,
    );
    final json = cart.toJson();
    await cartDoc.update(json);
  }

  static Future<void> deleteCartItem(
      {required String user, required Cart cartItem}) async {
    await FirebaseFirestore.instance
        .collection('Gestapo')
        .doc('Users')
        .collection('Profile')
        .doc(user)
        .collection('Cart')
        .doc(cartItem.productName + cartItem.size.toString())
        .delete();
  }

  static Stream<List<Cart>> getCartItems(String user) {
    return FirebaseFirestore.instance
        .collection('Gestapo')
        .doc('Users')
        .collection('Profile')
        .doc(user)
        .collection('Cart')
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map(
              (doc) => Cart.fromJson(doc.data()),
            )
            .toList());
  }
}
