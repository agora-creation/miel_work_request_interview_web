import 'package:cloud_firestore/cloud_firestore.dart';

class RequestInterviewService {
  String collection = 'requestInterview';
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  String id() {
    return firestore.collection(collection).doc().id;
  }

  void create(Map<String, dynamic> values) {
    firestore.collection(collection).doc(values['id']).set(values);
  }
}
