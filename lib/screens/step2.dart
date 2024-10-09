import 'package:flutter/material.dart';
import 'package:miel_work_request_interview_web/common/functions.dart';
import 'package:miel_work_request_interview_web/common/style.dart';
import 'package:miel_work_request_interview_web/providers/request_interview.dart';
import 'package:miel_work_request_interview_web/screens/step3.dart';
import 'package:miel_work_request_interview_web/widgets/custom_button.dart';
import 'package:miel_work_request_interview_web/widgets/dotted_divider.dart';
import 'package:miel_work_request_interview_web/widgets/form_label.dart';
import 'package:miel_work_request_interview_web/widgets/form_value.dart';
import 'package:miel_work_request_interview_web/widgets/link_text.dart';
import 'package:miel_work_request_interview_web/widgets/responsive_box.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class Step2Screen extends StatefulWidget {
  final String companyName;
  final String companyUserName;
  final String companyUserEmail;
  final String companyUserTel;
  final String mediaName;
  final String programName;
  final String castInfo;
  final String featureContent;
  final String publishedAt;
  final String interviewedAt;
  final String interviewedUserName;
  final String interviewedUserTel;
  final String interviewedTime;
  final bool interviewedReserved;
  final String interviewedShopName;
  final String interviewedVisitors;
  final String interviewedContent;
  final String locationAt;
  final String locationUserName;
  final String locationUserTel;
  final String locationVisitors;
  final String locationContent;
  final String insertedAt;
  final String insertedUserName;
  final String insertedUserTel;
  final String insertedTime;
  final bool insertedReserved;
  final String insertedShopName;
  final String insertedVisitors;
  final String insertedContent;
  final String remarks;

  const Step2Screen({
    required this.companyName,
    required this.companyUserName,
    required this.companyUserEmail,
    required this.companyUserTel,
    required this.mediaName,
    required this.programName,
    required this.castInfo,
    required this.featureContent,
    required this.publishedAt,
    required this.interviewedAt,
    required this.interviewedUserName,
    required this.interviewedUserTel,
    required this.interviewedTime,
    required this.interviewedReserved,
    required this.interviewedShopName,
    required this.interviewedVisitors,
    required this.interviewedContent,
    required this.locationAt,
    required this.locationUserName,
    required this.locationUserTel,
    required this.locationVisitors,
    required this.locationContent,
    required this.insertedAt,
    required this.insertedUserName,
    required this.insertedUserTel,
    required this.insertedTime,
    required this.insertedReserved,
    required this.insertedShopName,
    required this.insertedVisitors,
    required this.insertedContent,
    required this.remarks,
    super.key,
  });

  @override
  State<Step2Screen> createState() => _Step2ScreenState();
}

class _Step2ScreenState extends State<Step2Screen> {
  @override
  Widget build(BuildContext context) {
    final interviewProvider = Provider.of<RequestInterviewProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 24),
              const Text(
                '取材申込フォーム',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'SourceHanSansJP-Bold',
                ),
              ),
              const SizedBox(height: 24),
              ResponsiveBox(
                children: [
                  const Text('以下の申込内容で問題ないかご確認ください。'),
                  const SizedBox(height: 8),
                  FormLabel(
                    '会社名',
                    child: FormValue(widget.companyName),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '担当者名',
                    child: FormValue(widget.companyUserName),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '担当者メールアドレス',
                    child: FormValue(widget.companyUserEmail),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '担当者電話番号',
                    child: FormValue(widget.companyUserTel),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '媒体名',
                    child: FormValue(widget.mediaName),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '番組・雑誌名',
                    child: FormValue(widget.programName),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '出演者情報',
                    child: FormValue(widget.castInfo),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '特集内容・備考',
                    child: FormValue(widget.featureContent),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    'OA・掲載予定日',
                    child: FormValue(widget.publishedAt),
                  ),
                  const SizedBox(height: 24),
                  const DottedDivider(),
                  const SizedBox(height: 16),
                  const Text(
                    '取材当日情報',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'SourceHanSansJP-Bold',
                    ),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '予定日時',
                    child: FormValue(widget.interviewedAt),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '担当者名',
                    child: FormValue(widget.interviewedUserName),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '担当者電話番号',
                    child: FormValue(widget.interviewedUserTel),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '取材時間',
                    child: FormValue(widget.interviewedTime),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '席の予約',
                    child: FormValue(widget.interviewedReserved ? '必要' : ''),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '取材店舗',
                    child: FormValue(widget.interviewedShopName),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '訪問人数',
                    child: FormValue(widget.interviewedVisitors),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '取材内容・備考',
                    child: FormValue(widget.interviewedContent),
                  ),
                  const SizedBox(height: 24),
                  const DottedDivider(),
                  const SizedBox(height: 16),
                  const Text(
                    'ロケハン情報',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'SourceHanSansJP-Bold',
                    ),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '予定日時',
                    child: FormValue(widget.locationAt),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '担当者名',
                    child: FormValue(widget.locationUserName),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '担当者電話番号',
                    child: FormValue(widget.locationUserTel),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '訪問人数',
                    child: FormValue(widget.locationVisitors),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    'ロケハン内容・備考',
                    child: FormValue(widget.locationContent),
                  ),
                  const SizedBox(height: 24),
                  const DottedDivider(),
                  const SizedBox(height: 16),
                  const Text(
                    'インサート撮影情報',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'SourceHanSansJP-Bold',
                    ),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '予定日時',
                    child: FormValue(widget.insertedAt),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '担当者名',
                    child: FormValue(widget.insertedUserName),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '担当者電話番号',
                    child: FormValue(widget.insertedUserTel),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '撮影時間',
                    child: FormValue(widget.insertedTime),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '席の予約',
                    child: FormValue(widget.insertedReserved ? '必要' : ''),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '取材店舗',
                    child: FormValue(widget.insertedShopName),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '訪問人数',
                    child: FormValue(widget.insertedVisitors),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '撮影内容・備考',
                    child: FormValue(widget.insertedContent),
                  ),
                  const SizedBox(height: 24),
                  const DottedDivider(),
                  const SizedBox(height: 16),
                  FormLabel(
                    'その他連絡事項',
                    child: FormValue(widget.remarks),
                  ),
                  const SizedBox(height: 16),
                  const DottedDivider(),
                  const SizedBox(height: 32),
                  CustomButton(
                    type: ButtonSizeType.lg,
                    label: '上記内容で申し込む',
                    labelColor: kWhiteColor,
                    backgroundColor: kBlueColor,
                    onPressed: () async {
                      String? error = await interviewProvider.create(
                        companyName: widget.companyName,
                        companyUserName: widget.companyUserName,
                        companyUserEmail: widget.companyUserEmail,
                        companyUserTel: widget.companyUserTel,
                        mediaName: widget.mediaName,
                        programName: widget.programName,
                        castInfo: widget.castInfo,
                        featureContent: widget.featureContent,
                        publishedAt: widget.publishedAt,
                        interviewedAt: widget.interviewedAt,
                        interviewedUserName: widget.interviewedUserName,
                        interviewedUserTel: widget.interviewedUserTel,
                        interviewedTime: widget.interviewedTime,
                        interviewedReserved: widget.interviewedReserved,
                        interviewedShopName: widget.interviewedShopName,
                        interviewedVisitors: widget.interviewedVisitors,
                        interviewedContent: widget.interviewedContent,
                        locationAt: widget.locationAt,
                        locationUserName: widget.locationUserName,
                        locationUserTel: widget.locationUserTel,
                        locationVisitors: widget.locationVisitors,
                        locationContent: widget.locationContent,
                        insertedAt: widget.insertedAt,
                        insertedUserName: widget.insertedUserName,
                        insertedUserTel: widget.insertedUserTel,
                        insertedTime: widget.insertedTime,
                        insertedReserved: widget.insertedReserved,
                        insertedShopName: widget.insertedShopName,
                        insertedVisitors: widget.insertedVisitors,
                        insertedContent: widget.insertedContent,
                        remarks: widget.remarks,
                      );
                      if (error != null) {
                        if (!mounted) return;
                        showMessage(context, error, false);
                        return;
                      }
                      if (!mounted) return;
                      Navigator.pushReplacement(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: const Step3Screen(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: LinkText(
                      label: '入力に戻る',
                      color: kBlueColor,
                      onTap: () => Navigator.pop(context),
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }
}
