import 'package:flutter/material.dart';
import 'package:miel_work_request_interview_web/common/style.dart';
import 'package:miel_work_request_interview_web/providers/request_interview.dart';
import 'package:miel_work_request_interview_web/screens/step3.dart';
import 'package:miel_work_request_interview_web/widgets/custom_button.dart';
import 'package:miel_work_request_interview_web/widgets/form_label.dart';
import 'package:miel_work_request_interview_web/widgets/form_value.dart';
import 'package:miel_work_request_interview_web/widgets/link_text.dart';
import 'package:miel_work_request_interview_web/widgets/responsive_box.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class Step2Screen extends StatefulWidget {
  const Step2Screen({super.key});

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
                'WEB申込フォーム(取材)',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'SourceHanSansJP-Bold',
                ),
              ),
              const SizedBox(height: 24),
              ResponsiveBox(
                children: [
                  FormLabel(
                    '会社名',
                    child: FormValue(''),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '担当者名',
                    child: FormValue(''),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '媒体名',
                    child: FormValue(''),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '番組・雑誌名',
                    child: FormValue(''),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '出演者情報',
                    child: FormValue(''),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '特集内容',
                    child: FormValue(''),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    'OA・掲載予定日',
                    child: FormValue(''),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    '取材当日情報',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'SourceHanSansJP-Bold',
                    ),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '予定日時',
                    child: FormValue(''),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '担当者名',
                    child: FormValue(''),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '取材時間',
                    child: FormValue(''),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '席予約',
                    child: FormValue(''),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '取材店舗',
                    child: FormValue(''),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '訪問人数',
                    child: FormValue(''),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '取材内容',
                    child: FormValue(''),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'ロケハン情報',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'SourceHanSansJP-Bold',
                    ),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '予定日時',
                    child: FormValue(''),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '担当者',
                    child: FormValue(''),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '訪問人数',
                    child: FormValue(''),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    'ロケハン内容',
                    child: FormValue(''),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'インサート撮影情報',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'SourceHanSansJP-Bold',
                    ),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '予定日時',
                    child: FormValue(''),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '担当者',
                    child: FormValue(''),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '撮影時間',
                    child: FormValue(''),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '席予約',
                    child: FormValue(''),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '取材店舗',
                    child: FormValue(''),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '訪問人数',
                    child: FormValue(''),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '撮影内容',
                    child: FormValue(''),
                  ),
                  const SizedBox(height: 32),
                  CustomButton(
                    type: ButtonSizeType.lg,
                    label: '上記内容で申し込む',
                    labelColor: kWhiteColor,
                    backgroundColor: kBlueColor,
                    onPressed: () async {
                      // String? error = await interviewProvider.create();
                      // if (error != null) {
                      //   if (!mounted) return;
                      //   showMessage(context, error, false);
                      //   return;
                      // }
                      // if (!mounted) return;
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: Step3Screen(),
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
