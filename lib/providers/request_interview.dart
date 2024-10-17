import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as storage;
import 'package:flutter/material.dart';
import 'package:miel_work_request_interview_web/common/functions.dart';
import 'package:miel_work_request_interview_web/models/user.dart';
import 'package:miel_work_request_interview_web/services/fm.dart';
import 'package:miel_work_request_interview_web/services/mail.dart';
import 'package:miel_work_request_interview_web/services/request_interview.dart';
import 'package:miel_work_request_interview_web/services/user.dart';
import 'package:path/path.dart' as p;

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
    required List<PlatformFile> pickedAttachedFiles,
    required String remarks,
  }) async {
    String? error;
    if (companyName == '') return '申込会社名は必須入力です';
    if (companyUserName == '') return '申込担当者名は必須入力です';
    if (companyUserEmail == '') return '申込担当者メールアドレスは必須入力です';
    if (companyUserTel == '') return '申込担当者電話番号は必須入力です';
    try {
      await FirebaseAuth.instance.signInAnonymously().then((value) async {
        String id = _interviewService.id();
        List<String> attachedFiles = [];
        if (pickedAttachedFiles.isNotEmpty) {
          int i = 0;
          for (final file in pickedAttachedFiles) {
            String ext = p.extension(file.name);
            storage.UploadTask uploadTask;
            storage.Reference ref = storage.FirebaseStorage.instance
                .ref()
                .child('requestInterview')
                .child('/${id}_$i$ext');
            uploadTask = ref.putData(file.bytes!);
            await uploadTask.whenComplete(() => null);
            String url = await ref.getDownloadURL();
            attachedFiles.add(url);
          }
        }
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
          'attachedFiles': attachedFiles,
          'remarks': remarks,
          'memo': '',
          'approval': 0,
          'approvedAt': DateTime.now(),
          'approvalUsers': [],
          'createdAt': DateTime.now(),
        });
      });
      String interviewedAtText = '';
      if (interviewedAtPending) {
        interviewedAtText = '未定';
      } else {
        interviewedAtText =
            '${dateText('yyyy/MM/dd HH:mm', interviewedStartedAt)}〜${dateText('yyyy/MM/dd HH:mm', interviewedEndedAt)}';
      }
      String interviewedReservedText = '';
      if (interviewedReserved) {
        interviewedReservedText = '必要';
      }
      String locationText = '';
      if (location) {
        String locationAtText = '';
        if (locationAtPending) {
          locationAtText = '未定';
        } else {
          locationAtText =
              '${dateText('yyyy/MM/dd HH:mm', locationStartedAt)}〜${dateText('yyyy/MM/dd HH:mm', locationEndedAt)}';
        }
        locationText = '''
■ロケハン情報
【ロケハン予定日時】$locationAtText
【ロケハン担当者名】$locationUserName
【ロケハン担当者電話番号】$locationUserTel
【いらっしゃる人数】$locationVisitors
【ロケハン内容・備考】
$locationContent

        ''';
      }
      String insertText = '';
      if (insert) {
        String insertedAt = '';
        if (insertedAtPending) {
          insertedAt = '未定';
        } else {
          insertedAt =
              '${dateText('yyyy/MM/dd HH:mm', insertedStartedAt)}〜${dateText('yyyy/MM/dd HH:mm', insertedEndedAt)}';
        }
        String insertedReservedText = '';
        if (insertedReserved) {
          insertedReservedText = '必要';
        }
        insertText = '''
■インサート撮影情報
【撮影予定日時】$insertedAt
【撮影担当者名】$insertedUserName
【撮影担当者電話番号】$insertedUserTel
【席の予約】$insertedReservedText
【撮影店舗】$insertedShopName
【いらっしゃる人数】$insertedVisitors
【撮影内容・備考】
$insertedContent

        ''';
      }
      String message = '''
★★★このメールは自動返信メールです★★★

取材申込が完了いたしました。
以下申込内容を確認し、ご返信させていただきますので今暫くお待ちください。
取材内容の精査にはお時間がかかりますので、ご了承ください。
弊社担当より、取材の可否又は取材日程の調整について折り返しご連絡を差し上げます。申込＝取材許可ではございませんのでご注意ください。
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
■申込者情報
【申込会社名】$companyName
【申込担当者名】$companyUserName
【申込担当者メールアドレス】$companyUserEmail
【申込担当者電話番号】$companyUserTel
【媒体名】$mediaName
【番組・雑誌名】$programName
【出演者情報】$castInfo
【特集内容・備考】
$featureContent
【OA・掲載予定日】
$publishedAt

■取材当日情報
【取材予定日時】$interviewedAtText
【取材担当者名】$interviewedUserName
【取材担当者電話番号】$interviewedUserTel
【席の予約】$interviewedReservedText
【取材店舗】$interviewedShopName
【いらっしゃる人数】$interviewedVisitors
【取材内容・備考】
$interviewedContent

$locationText
$insertText
【その他連絡事項】
$remarks

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
      ''';
      _mailService.create({
        'id': _mailService.id(),
        'to': companyUserEmail,
        'subject': '【自動送信】取材申込完了のお知らせ',
        'message': message,
        'createdAt': DateTime.now(),
        'expirationAt': DateTime.now().add(const Duration(hours: 1)),
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
