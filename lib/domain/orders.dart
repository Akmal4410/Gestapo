import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gestapo/domain/cart.dart';

class Orders {
  final String orderId;
  final String productName;
  final String image;
  final int size;
  final int price;
  final int cartCount;
  final String payment;
  final String address;
  final String userEmail;
  final bool isCompleted;
  final int deliveryProcess;
  final bool isCancelled;

  Orders({
    required this.orderId,
    required this.productName,
    required this.image,
    required this.size,
    required this.price,
    required this.cartCount,
    required this.payment,
    required this.address,
    required this.userEmail,
    this.isCompleted = false,
    this.deliveryProcess = 0,
    this.isCancelled = false,
  });

  Map<String, dynamic> toJson() {
    return {
      'orderId': orderId,
      'productName': productName,
      'image': image,
      'size': size,
      'price': price,
      'cartCount': cartCount,
      'payment': payment,
      'address': address,
      'isCompleted': isCompleted,
      'deliveryProcess': deliveryProcess,
      'userEmail': userEmail,
      'isCancelled': isCancelled,
    };
  }

  static Future<void> addOrder({
    required String email,
    required String id,
    required Cart cartItem,
    required int price,
    required String payment,
    required String address,
  }) async {
    final orderDoc = FirebaseFirestore.instance
        .collection('Gestapo')
        .doc('Admin')
        .collection('Orders')
        .doc(id);

    final order = Orders(
      orderId: id,
      productName: cartItem.productName,
      image: cartItem.image,
      size: cartItem.size,
      price: price,
      cartCount: cartItem.cartCount,
      payment: payment,
      address: address,
      userEmail: email,
    );

    final json = order.toJson();
    await orderDoc.set(json);
  }

  static Orders fromJson(Map<String, dynamic> json) {
    return Orders(
      orderId: json['orderId'],
      productName: json['productName'],
      image: json['image'],
      size: json['size'],
      price: json['price'],
      cartCount: json['cartCount'],
      payment: json['payment'],
      address: json['address'],
      isCompleted: json['isCompleted'],
      deliveryProcess: json['deliveryProcess'],
      userEmail: json['userEmail'],
      isCancelled: json['isCancelled'],
    );
  }

  static Stream<List<Orders>> getAllOrders() {
    return FirebaseFirestore.instance
        .collection('Gestapo')
        .doc('Admin')
        .collection('Orders')
        .snapshots()
        .map(
          (snapshot) =>
              snapshot.docs.map((doc) => Orders.fromJson(doc.data())).toList(),
        );
  }

  static Future<void> updateOrderStatus(
      {required Orders order, required int newProccess}) async {
    final orderDoc = FirebaseFirestore.instance
        .collection('Gestapo')
        .doc('Admin')
        .collection('Orders')
        .doc(order.orderId);

    final newOrder = Orders(
      orderId: order.orderId,
      productName: order.productName,
      image: order.image,
      size: order.size,
      price: order.price,
      cartCount: order.cartCount,
      payment: order.payment,
      address: order.address,
      userEmail: order.userEmail,
      isCompleted: (newProccess <= 3) ? false : true,
      deliveryProcess: newProccess,
    );

    final json = newOrder.toJson();
    await orderDoc.update(json);
  }

  static Future<void> cancelOrder({required Orders order}) async {
    final orderDoc = FirebaseFirestore.instance
        .collection('Gestapo')
        .doc('Admin')
        .collection('Orders')
        .doc(order.orderId);

    final newOrder = Orders(
      orderId: order.orderId,
      productName: order.productName,
      image: order.image,
      size: order.size,
      price: order.price,
      cartCount: order.cartCount,
      payment: order.payment,
      address: order.address,
      userEmail: order.userEmail,
      isCompleted: order.isCompleted,
      deliveryProcess: order.deliveryProcess,
      isCancelled: true,
    );

    final json = newOrder.toJson();
    await orderDoc.update(json);
  }
}
