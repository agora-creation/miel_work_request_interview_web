import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:miel_work_request_interview_web/models/approval_user.dart';

class RequestInterviewModel {
  String _id = '';
  String _company = '';
  String _companyUser = '';
  String _media = '';
  String _program = '';
  String _cast = '';
  String _featureContent = '';
  String _publishedAt = '';
  String _interviewedAt = '';
  String _interviewedUser = '';
  String _interviewedTime = '';
  bool _interviewedReserved = false;
  String _interviewedShop = '';
  String _interviewedVisitors = '';
  String _interviewedContent = '';
  String _locationAt = '';
  String _locationUser = '';
  String _locationVisitors = '';
  String _locationContent = '';
  String _insertedAt = '';
  String _insertedUser = '';
  String _insertedTime = '';
  bool _insertedReserved = false;
  String _insertedShop = '';
  String _insertedVisitors = '';
  String _insertedContent = '';
  int _approval = 0;
  DateTime _approvedAt = DateTime.now();
  List<ApprovalUserModel> approvalUsers = [];
  DateTime _createdAt = DateTime.now();

  String get id => _id;
  String get company => _company;
  String get companyUser => _companyUser;
  String get media => _media;
  String get program => _program;
  String get cast => _cast;
  String get featureContent => _featureContent;
  String get publishedAt => _publishedAt;
  String get interviewedAt => _interviewedAt;
  String get interviewedUser => _interviewedUser;
  String get interviewedTime => _interviewedTime;
  bool get interviewedReserved => _interviewedReserved;
  String get interviewedShop => _interviewedShop;
  String get interviewedVisitors => _interviewedVisitors;
  String get interviewedContent => _interviewedContent;
  String get locationAt => _locationAt;
  String get locationUser => _locationUser;
  String get locationVisitors => _locationVisitors;
  String get locationContent => _locationContent;
  String get insertedAt => _insertedAt;
  String get insertedUser => _insertedUser;
  String get insertedTime => _insertedTime;
  bool get insertedReserved => _insertedReserved;
  String get insertedShop => _insertedShop;
  String get insertedVisitors => _insertedVisitors;
  String get insertedContent => _insertedContent;
  int get approval => _approval;
  DateTime get approvedAt => _approvedAt;
  DateTime get createdAt => _createdAt;

  RequestInterviewModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    Map<String, dynamic>? data = snapshot.data();
    if (data == null) return;
    _id = data['id'] ?? '';
    _company = data['company'] ?? '';
    _companyUser = data['companyUser'] ?? '';
    _media = data['media'] ?? '';
    _program = data['program'] ?? '';
    _cast = data['cast'] ?? '';
    _featureContent = data['featureContent'] ?? '';
    _publishedAt = data['publishedAt'] ?? '';
    _interviewedAt = data['interviewedAt'] ?? '';
    _interviewedUser = data['interviewedUser'] ?? '';
    _interviewedTime = data['interviewedTime'] ?? '';
    _interviewedReserved = data['interviewedReserved'] ?? false;
    _interviewedShop = data['interviewedShop'] ?? '';
    _interviewedVisitors = data['interviewedVisitors'] ?? '';
    _interviewedContent = data['interviewedContent'] ?? '';
    _locationAt = data['locationAt'] ?? '';
    _locationUser = data['locationUser'] ?? '';
    _locationVisitors = data['locationVisitors'] ?? '';
    _locationContent = data['locationContent'] ?? '';
    _insertedAt = data['insertedAt'] ?? '';
    _insertedUser = data['insertedUser'] ?? '';
    _insertedTime = data['insertedTime'] ?? '';
    _insertedReserved = data['insertedReserved'] ?? false;
    _insertedShop = data['insertedShop'] ?? '';
    _insertedVisitors = data['insertedVisitors'] ?? '';
    _insertedContent = data['insertedContent'] ?? '';
    _approval = data['approval'] ?? 0;
    _approvedAt = data['approvedAt'].toDate() ?? DateTime.now();
    approvalUsers = _convertApprovalUsers(data['approvalUsers']);
    _createdAt = data['createdAt'].toDate() ?? DateTime.now();
  }

  List<ApprovalUserModel> _convertApprovalUsers(List list) {
    List<ApprovalUserModel> converted = [];
    for (Map data in list) {
      converted.add(ApprovalUserModel.fromMap(data));
    }
    return converted;
  }
}
