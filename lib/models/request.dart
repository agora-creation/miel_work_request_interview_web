import 'package:miel_work_request_interview_web/models/approval_user.dart';

class RequestModel {
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

  int _approval = 0;
  DateTime _approvedAt = DateTime.now();
  List<ApprovalUserModel> approvalUsers = [];
  DateTime _createdAt = DateTime.now();
}
