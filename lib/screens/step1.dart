import 'package:flutter/material.dart';
import 'package:miel_work_request_interview_web/common/functions.dart';
import 'package:miel_work_request_interview_web/common/style.dart';
import 'package:miel_work_request_interview_web/providers/request_interview.dart';
import 'package:miel_work_request_interview_web/widgets/animation_background.dart';
import 'package:miel_work_request_interview_web/widgets/custom_button.dart';
import 'package:miel_work_request_interview_web/widgets/custom_text_field.dart';
import 'package:miel_work_request_interview_web/widgets/form_label.dart';
import 'package:miel_work_request_interview_web/widgets/responsive_box.dart';
import 'package:provider/provider.dart';

class Step1Screen extends StatefulWidget {
  const Step1Screen({super.key});

  @override
  State<Step1Screen> createState() => _Step1ScreenState();
}

class _Step1ScreenState extends State<Step1Screen> {
  @override
  Widget build(BuildContext context) {
    final interviewProvider = Provider.of<RequestInterviewProvider>(context);
    return Scaffold(
      body: Stack(
        children: [
          const AnimationBackground(),
          SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  const Text(
                    'WEB申込フォーム(取材)',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'SourceHanSansJP-Bold',
                    ),
                  ),
                  const SizedBox(height: 16),
                  ResponsiveBox(
                    children: [
                      FormLabel(
                        '会社名',
                        child: CustomTextField(
                          controller: TextEditingController(),
                          textInputType: TextInputType.text,
                          maxLines: 1,
                        ),
                      ),
                      const SizedBox(height: 8),
                      FormLabel(
                        '担当者名',
                        child: CustomTextField(
                          controller: TextEditingController(),
                          textInputType: TextInputType.text,
                          maxLines: 1,
                        ),
                      ),
                      const SizedBox(height: 8),
                      FormLabel(
                        '媒体名',
                        child: CustomTextField(
                          controller: TextEditingController(),
                          textInputType: TextInputType.text,
                          maxLines: 1,
                        ),
                      ),
                      const SizedBox(height: 8),
                      FormLabel(
                        '番組・雑誌名',
                        child: CustomTextField(
                          controller: TextEditingController(),
                          textInputType: TextInputType.text,
                          maxLines: 1,
                        ),
                      ),
                      const SizedBox(height: 8),
                      FormLabel(
                        '出演者情報など',
                        child: CustomTextField(
                          controller: TextEditingController(),
                          textInputType: TextInputType.text,
                          maxLines: 1,
                        ),
                      ),
                      const SizedBox(height: 8),
                      FormLabel(
                        '特集内容',
                        child: CustomTextField(
                          controller: TextEditingController(),
                          textInputType: TextInputType.text,
                          maxLines: 1,
                        ),
                      ),
                      const SizedBox(height: 8),
                      FormLabel(
                        'OA・掲載予定日',
                        child: CustomTextField(
                          controller: TextEditingController(),
                          textInputType: TextInputType.text,
                          maxLines: 1,
                        ),
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
                        child: CustomTextField(
                          controller: TextEditingController(),
                          textInputType: TextInputType.text,
                          maxLines: 1,
                        ),
                      ),
                      const SizedBox(height: 8),
                      FormLabel(
                        '担当者名',
                        child: CustomTextField(
                          controller: TextEditingController(),
                          textInputType: TextInputType.text,
                          maxLines: 1,
                        ),
                      ),
                      const SizedBox(height: 8),
                      FormLabel(
                        '取材時間',
                        child: CustomTextField(
                          controller: TextEditingController(),
                          textInputType: TextInputType.text,
                          maxLines: 1,
                        ),
                      ),
                      const SizedBox(height: 8),
                      FormLabel(
                        '席予約',
                        child: CustomTextField(
                          controller: TextEditingController(),
                          textInputType: TextInputType.text,
                          maxLines: 1,
                        ),
                      ),
                      const SizedBox(height: 8),
                      FormLabel(
                        '取材店舗',
                        child: CustomTextField(
                          controller: TextEditingController(),
                          textInputType: TextInputType.text,
                          maxLines: 1,
                        ),
                      ),
                      const SizedBox(height: 8),
                      FormLabel(
                        '訪問人数',
                        child: CustomTextField(
                          controller: TextEditingController(),
                          textInputType: TextInputType.text,
                          maxLines: 1,
                        ),
                      ),
                      const SizedBox(height: 8),
                      FormLabel(
                        '取材内容',
                        child: CustomTextField(
                          controller: TextEditingController(),
                          textInputType: TextInputType.text,
                          maxLines: 1,
                        ),
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
                        child: CustomTextField(
                          controller: TextEditingController(),
                          textInputType: TextInputType.text,
                          maxLines: 1,
                        ),
                      ),
                      const SizedBox(height: 8),
                      FormLabel(
                        '担当者',
                        child: CustomTextField(
                          controller: TextEditingController(),
                          textInputType: TextInputType.text,
                          maxLines: 1,
                        ),
                      ),
                      const SizedBox(height: 8),
                      FormLabel(
                        '訪問人数',
                        child: CustomTextField(
                          controller: TextEditingController(),
                          textInputType: TextInputType.text,
                          maxLines: 1,
                        ),
                      ),
                      const SizedBox(height: 8),
                      FormLabel(
                        'ロケハン内容',
                        child: CustomTextField(
                          controller: TextEditingController(),
                          textInputType: TextInputType.text,
                          maxLines: 1,
                        ),
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
                        child: CustomTextField(
                          controller: TextEditingController(),
                          textInputType: TextInputType.text,
                          maxLines: 1,
                        ),
                      ),
                      const SizedBox(height: 8),
                      FormLabel(
                        '担当者',
                        child: CustomTextField(
                          controller: TextEditingController(),
                          textInputType: TextInputType.text,
                          maxLines: 1,
                        ),
                      ),
                      const SizedBox(height: 8),
                      FormLabel(
                        '撮影時間',
                        child: CustomTextField(
                          controller: TextEditingController(),
                          textInputType: TextInputType.text,
                          maxLines: 1,
                        ),
                      ),
                      const SizedBox(height: 8),
                      FormLabel(
                        '席予約',
                        child: CustomTextField(
                          controller: TextEditingController(),
                          textInputType: TextInputType.text,
                          maxLines: 1,
                        ),
                      ),
                      const SizedBox(height: 8),
                      FormLabel(
                        '取材店舗',
                        child: CustomTextField(
                          controller: TextEditingController(),
                          textInputType: TextInputType.text,
                          maxLines: 1,
                        ),
                      ),
                      const SizedBox(height: 8),
                      FormLabel(
                        '訪問人数',
                        child: CustomTextField(
                          controller: TextEditingController(),
                          textInputType: TextInputType.text,
                          maxLines: 1,
                        ),
                      ),
                      const SizedBox(height: 8),
                      FormLabel(
                        '撮影内容',
                        child: CustomTextField(
                          controller: TextEditingController(),
                          textInputType: TextInputType.text,
                          maxLines: 1,
                        ),
                      ),
                      const SizedBox(height: 24),
                      CustomButton(
                        type: ButtonSizeType.lg,
                        label: '入力内容を確認',
                        labelColor: kWhiteColor,
                        backgroundColor: kBlueColor,
                        onPressed: () async {
                          String? error = await interviewProvider.create();
                          if (error != null) {
                            if (!mounted) return;
                            showMessage(context, error, false);
                            return;
                          }
                          if (!mounted) return;
                          showMessage(context, '申込が完了しました', true);
                        },
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                  const SizedBox(height: 80),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
