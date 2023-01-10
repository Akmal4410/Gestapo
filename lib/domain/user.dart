import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String firstName;
  final String lastName;
  final String phone;
  final String email;
  final String image;

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.email,
    required this.image,
  });

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'phone': phone,
      'email': email,
      'image': image
    };
  }

  static Future<void> createUser(
      {required String firstName,
      required String lastName,
      required String phone,
      required String email,
      required String image}) async {
    final userDoc = FirebaseFirestore.instance
        .collection('Gestapo')
        .doc('Users')
        .collection('Profile')
        .doc(email);

    final user = UserModel(
      firstName: firstName,
      lastName: lastName,
      phone: phone,
      email: email,
      image: image,
    );

    final json = user.toJson();
    await userDoc.set(json);
  }
}
