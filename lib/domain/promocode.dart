import 'package:cloud_firestore/cloud_firestore.dart';

class PromoCode {
  final int promo;
  final String details;
  final String image;
  final String color;

  PromoCode({
    required this.promo,
    required this.details,
    required this.image,
    required this.color,
  });

  Map<String, dynamic> toJson() {
    return {
      'promo': promo,
      'details': details,
      'image': image,
      'color': color,
    };
  }

  static Future<void> addPromoCode({
    required int percent,
    required String details,
    required String image,
    required String color,
  }) async {
    final promoDoc = FirebaseFirestore.instance
        .collection('Gestapo')
        .doc('Admin')
        .collection('PromoCode')
        .doc('Promo$percent');

    final promoCode = PromoCode(
      promo: percent,
      details: details,
      image: image,
      color: '0xFF$color',
    );
    final json = promoCode.toJson();
    await promoDoc.set(json);
  }

  static PromoCode fromJson(Map<String, dynamic> json) {
    return PromoCode(
      promo: json['promo'],
      details: json['details'],
      image: json['image'],
      color: json['color'],
    );
  }

  static Stream<List<PromoCode>> getStreamPromoCode() {
    return FirebaseFirestore.instance
        .collection('Gestapo')
        .doc('Admin')
        .collection('PromoCode')
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((snapshot) => PromoCode.fromJson(snapshot.data()))
            .toList());
  }
}
