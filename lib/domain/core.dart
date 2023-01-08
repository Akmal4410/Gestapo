import 'package:cloud_firestore/cloud_firestore.dart';

Future<List<String>> getAllUsersId() async {
  List<String> idList = [];
  var querySnapshot = await FirebaseFirestore.instance
      .collection('Gestapo')
      .doc('Users')
      .collection('Profile')
      .get();

  for (var snapshot in querySnapshot.docs) {
    var documentID = snapshot.id; // <-- Document ID
    idList.add(documentID);
  }
  return idList;
}
