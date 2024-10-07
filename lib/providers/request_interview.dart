import 'package:flutter/material.dart';
import 'package:miel_work_request_interview_web/services/request_interview.dart';

class RequestInterviewProvider with ChangeNotifier {
  final RequestInterviewService _interviewService = RequestInterviewService();

  Future<String?> create() async {
    String? error;
    try {
      String id = _interviewService.id();
      _interviewService.create({
        'id': id,
        'approval': 0,
        'approvedAt': DateTime.now(),
        'approvalUsers': [],
        'createdAt': DateTime.now(),
      });
    } catch (e) {
      error = '申込に失敗しました';
    }
    return error;
  }
}
