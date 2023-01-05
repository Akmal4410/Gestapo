import 'package:cloud_firestore/cloud_firestore.dart';

class PromoCode {
  final int promo;
  final String details;

  PromoCode({
    required this.promo,
    required this.details,
  });

  Map<String, dynamic> toJson() {
    return {
      'promo': promo,
      'details': details,
    };
  }

  static Future<void> addPromoCode({
    required int percent,
    required String details,
  }) async {
    final promoDoc = FirebaseFirestore.instance
        .collection('Gestapo')
        .doc('Admin')
        .collection('PromoCode')
        .doc('Promo$percent');

    final promoCode = PromoCode(
      promo: percent,
      details: details,
    );
    final json = promoCode.toJson();
    await promoDoc.set(json);
  }

  static PromoCode fromJson(Map<String, dynamic> json) {
    return PromoCode(
      promo: json['promo'],
      details: json['details'],
    );
  }

  static Stream<List<PromoCode>> getStreampromoCode() {
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
