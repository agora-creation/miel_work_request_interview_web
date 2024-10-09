import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:miel_work_request_interview_web/services/request_interview.dart';

class RequestInterviewProvider with ChangeNotifier {
  final RequestInterviewService _interviewService = RequestInterviewService();

  Future<String?> create({
    required String companyName,
    required String companyUserName,
    required String companyUserEmail,
    required String companyUserTel,
    required String mediaName,
    required String programName,
    required String castInfo,
    required String featureContent,
    required String publishedAt,
    required String interviewedAt,
    required String interviewedUserName,
    required String interviewedUserTel,
    required String interviewedTime,
    required bool interviewedReserved,
    required String interviewedShopName,
    required String interviewedVisitors,
    required String interviewedContent,
    required String locationAt,
    required String locationUserName,
    required String locationUserTel,
    required String locationVisitors,
    required String locationContent,
    required String insertedAt,
    required String insertedUserName,
    required String insertedUserTel,
    required String insertedTime,
    required bool insertedReserved,
    required String insertedShopName,
    required String insertedVisitors,
    required String insertedContent,
    required String remarks,
  }) async {
    String? error;
    if (companyName == '') return '会社名は必須入力です';
    if (companyUserName == '') return '担当者名は必須入力です';
    if (companyUserEmail == '') return '担当者メールアドレスは必須入力です';
    if (companyUserTel == '') return '担当者電話番号は必須入力です';
    try {
      await FirebaseAuth.instance.signInAnonymously().then((value) {
        String id = _interviewService.id();
        _interviewService.create({
          'id': id,
          'companyName': companyName,
          'companyUserName': companyUserName,
          'companyUserEmail': companyUserEmail,
          'companyUserTel': companyUserTel,
          'mediaName': mediaName,
          'programName': programName,
          'castInfo': castInfo,
          'featureContent': featureContent,
          'publishedAt': publishedAt,
          'interviewedAt': interviewedAt,
          'interviewedUserName': interviewedUserName,
          'interviewedUserTel': interviewedUserTel,
          'interviewedTime': interviewedTime,
          'interviewedReserved': interviewedReserved,
          'interviewedShopName': interviewedShopName,
          'interviewedVisitors': interviewedVisitors,
          'interviewedContent': interviewedContent,
          'locationAt': locationAt,
          'locationUserName': locationUserName,
          'locationUserTel': locationUserTel,
          'locationVisitors': locationVisitors,
          'locationContent': locationContent,
          'insertedAt': insertedAt,
          'insertedUserName': insertedUserName,
          'insertedUserTel': insertedUserTel,
          'insertedTime': insertedTime,
          'insertedReserved': insertedReserved,
          'insertedShopName': insertedShopName,
          'insertedVisitors': insertedVisitors,
          'insertedContent': insertedContent,
          'remarks': remarks,
          'approval': 0,
          'approvedAt': DateTime.now(),
          'approvalUsers': [],
          'createdAt': DateTime.now(),
        });
      });
      //メール送信

      //通知
    } catch (e) {
      error = '申込に失敗しました';
    }
    return error;
  }
}
