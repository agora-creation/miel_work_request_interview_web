import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:miel_work_request_interview_web/models/user.dart';
import 'package:miel_work_request_interview_web/services/fm.dart';
import 'package:miel_work_request_interview_web/services/mail.dart';
import 'package:miel_work_request_interview_web/services/request_interview.dart';
import 'package:miel_work_request_interview_web/services/user.dart';

class RequestInterviewProvider with ChangeNotifier {
  final RequestInterviewService _interviewService = RequestInterviewService();
  final UserService _userService = UserService();
  final MailService _mailService = MailService();
  final FmService _fmService = FmService();

  Future<String?> check({
    required String companyName,
    required String companyUserName,
    required String companyUserEmail,
    required String companyUserTel,
  }) async {
    String? error;
    if (companyName == '') return '申込会社名は必須入力です';
    if (companyUserName == '') return '申込担当者名は必須入力です';
    if (companyUserEmail == '') return '申込担当者メールアドレスは必須入力です';
    if (companyUserTel == '') return '申込担当者電話番号は必須入力です';
    return error;
  }

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
    required DateTime interviewedStartedAt,
    required DateTime interviewedEndedAt,
    required bool interviewedAtPending,
    required String interviewedUserName,
    required String interviewedUserTel,
    required bool interviewedReserved,
    required String interviewedShopName,
    required String interviewedVisitors,
    required String interviewedContent,
    required bool location,
    required DateTime locationStartedAt,
    required DateTime locationEndedAt,
    required bool locationAtPending,
    required String locationUserName,
    required String locationUserTel,
    required String locationVisitors,
    required String locationContent,
    required bool insert,
    required DateTime insertedStartedAt,
    required DateTime insertedEndedAt,
    required bool insertedAtPending,
    required String insertedUserName,
    required String insertedUserTel,
    required bool insertedReserved,
    required String insertedShopName,
    required String insertedVisitors,
    required String insertedContent,
    required String remarks,
  }) async {
    String? error;
    if (companyName == '') return '申込会社名は必須入力です';
    if (companyUserName == '') return '申込担当者名は必須入力です';
    if (companyUserEmail == '') return '申込担当者メールアドレスは必須入力です';
    if (companyUserTel == '') return '申込担当者電話番号は必須入力です';
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
          'interviewedStartedAt': interviewedStartedAt,
          'interviewedEndedAt': interviewedEndedAt,
          'interviewedAtPending': interviewedAtPending,
          'interviewedUserName': interviewedUserName,
          'interviewedUserTel': interviewedUserTel,
          'interviewedReserved': interviewedReserved,
          'interviewedShopName': interviewedShopName,
          'interviewedVisitors': interviewedVisitors,
          'interviewedContent': interviewedContent,
          'location': location,
          'locationStartedAt': locationStartedAt,
          'locationEndedAt': locationEndedAt,
          'locationAtPending': locationAtPending,
          'locationUserName': locationUserName,
          'locationUserTel': locationUserTel,
          'locationVisitors': locationVisitors,
          'locationContent': locationContent,
          'insert': insert,
          'insertedStartedAt': insertedStartedAt,
          'insertedEndedAt': insertedEndedAt,
          'insertedAtPending': insertedAtPending,
          'insertedUserName': insertedUserName,
          'insertedUserTel': insertedUserTel,
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
      String message = '''
取材申込が完了いたしました。以下ご確認ください。
━━━━━━━━━━━━━━
■申込者情報
【申込会社名】
【申込担当者名】
【申込担当者メールアドレス】info@agora-c.com
【申込担当者電話番号】
【媒体名】
【番組・雑誌名】
【出演者情報】
【特集内容・備考】

【OA・掲載予定日】

■取材当日情報
【取材予定日時】
【取材担当者名】
【取材担当者電話番号】
【席の予約】
【取材店舗】
【いらっしゃる人数】
【取材内容・備考】


【その他連絡事項】

━━━━━━━━━━━━━━
      ''';
      _mailService.create({
        'id': _mailService.id(),
        'to': companyUserEmail,
        'subject': '【自動送信】取材申込完了のお知らせ',
        'message': message,
        'createdAt': DateTime.now(),
      });
      //通知
      List<UserModel> sendUsers = [];
      sendUsers = await _userService.selectList();
      if (sendUsers.isNotEmpty) {
        for (UserModel user in sendUsers) {
          _fmService.send(
            token: user.token,
            title: '社外申請',
            body: '取材の申込がありました',
          );
        }
      }
    } catch (e) {
      error = '申込に失敗しました';
    }
    return error;
  }
}
