import 'package:cloud_firestore/cloud_firestore.dart';

class Address {
  final String addressName;
  final String addressDetails;

  Address({
    required this.addressName,
    required this.addressDetails,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': addressName,
      'details': addressDetails,
    };
  }

  static Future<void> addNewAddress({
    required String user,
    required String addressName,
    required String addressDetails,
  }) async {
    final addressDoc = FirebaseFirestore.instance
        .collection('Gestapo')
        .doc('Users')
        .collection('Profile')
        .doc(user)
        .collection('Address')
        .doc(addressName);

    final address = Address(
      addressName: addressName,
      addressDetails: addressDetails,
    );

    final json = address.toJson();
    await addressDoc.set(json);
  }

  static Address fromJson(Map<String, dynamic> json) {
    return Address(
      addressName: json['name'],
      addressDetails: json['details'],
    );
  }

  static Stream<List<Address>> getAddressStream(String user) {
    return FirebaseFirestore.instance
        .collection('Gestapo')
        .doc('Users')
        .collection('Profile')
        .doc(user)
        .collection('Address')
        .snapshots()
        .map((snapsnot) => snapsnot.docs
            .map(
              (doc) => Address.fromJson(doc.data()),
            )
            .toList());
  }
}
