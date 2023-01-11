import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String email;
  final String message;
  final String time;
  final String originalTime;

  Message({
    required this.email,
    required this.message,
    required this.time,
    required this.originalTime,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'message': message,
      'time': time,
      'originalTime': originalTime
    };
  }

  static Message fromJson(Map<String, dynamic> json) {
    return Message(
      originalTime: json['originalTime'],
      email: json['email'],
      message: json['message'],
      time: json['time'],
    );
  }

  static Future sendMessage({
    required String senderemail,
    required String docEmail,
    required String text,
    required String time,
    required String originalTime,
  }) async {
    final messageDoc = FirebaseFirestore.instance
        .collection('Gestapo')
        .doc('Users')
        .collection('Profile')
        .doc(docEmail)
        .collection('Chats')
        .doc();

    final message = Message(
      originalTime: originalTime,
      email: senderemail,
      message: text,
      time: time,
    );

    final json = message.toJson();
    await messageDoc.set(json);
  }

  static Stream<List<Message>> getAllmessagess({required String email}) {
    return FirebaseFirestore.instance
        .collection('Gestapo')
        .doc('Users')
        .collection('Profile')
        .doc(email)
        .collection('Chats')
        .orderBy('originalTime', descending: false)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((docs) => Message.fromJson(docs.data()))
            .toList());
  }
}
