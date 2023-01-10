import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String email;
  final String message;
  final String time;

  Message({
    required this.email,
    required this.message,
    required this.time,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'message': message,
      'time': time,
    };
  }

  static Message fromJson(Map<String, dynamic> json) {
    return Message(
      email: json['email'],
      message: json['message'],
      time: json['time'],
    );
  }

  static Future sendMessage(
      {required String senderemail,
      required String docEmail,
      required String text,
      required String time}) async {
    final messageDoc = FirebaseFirestore.instance
        .collection('Gestapo')
        .doc('Users')
        .collection('Profile')
        .doc(docEmail)
        .collection('Chats')
        .doc();

    final message = Message(
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
        .orderBy('time', descending: false)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((docs) => Message.fromJson(docs.data()))
            .toList());
  }
}
