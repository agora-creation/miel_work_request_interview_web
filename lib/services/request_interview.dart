import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:miel_work_request_interview_web/models/request_interview.dart';

class RequestInterviewService {
  String collection = 'requestInterview';
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  String id() {
    return firestore.collection(collection).doc().id;
  }

  void create(Map<String, dynamic> values) {
    firestore.collection(collection).doc(values['id']).set(values);
  }

  Future<RequestInterviewModel?> selectData(String id) async {
    RequestInterviewModel? ret;
    await firestore.collection(collection).doc(id).get().then((value) {
      ret = RequestInterviewModel.fromSnapshot(value);
    });
    return ret;
  }
}
