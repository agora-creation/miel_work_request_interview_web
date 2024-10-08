import 'package:flutter/material.dart';
import 'package:miel_work_request_interview_web/common/style.dart';
import 'package:miel_work_request_interview_web/screens/step2.dart';
import 'package:miel_work_request_interview_web/widgets/custom_button.dart';
import 'package:miel_work_request_interview_web/widgets/custom_text_field.dart';
import 'package:miel_work_request_interview_web/widgets/dotted_divider.dart';
import 'package:miel_work_request_interview_web/widgets/form_label.dart';
import 'package:miel_work_request_interview_web/widgets/responsive_box.dart';
import 'package:page_transition/page_transition.dart';

class Step1Screen extends StatefulWidget {
  const Step1Screen({super.key});

  @override
  State<Step1Screen> createState() => _Step1ScreenState();
}

class _Step1ScreenState extends State<Step1Screen> {
  @override
  Widget build(BuildContext context) {
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
                    child: CustomTextField(
                      controller: TextEditingController(),
                      textInputType: TextInputType.text,
                      maxLines: 1,
                      hintText: '例）ひろめカンパニー',
                    ),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '担当者名',
                    child: CustomTextField(
                      controller: TextEditingController(),
                      textInputType: TextInputType.text,
                      maxLines: 1,
                      hintText: '例）田中太郎',
                    ),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '担当者メールアドレス',
                    child: CustomTextField(
                      controller: TextEditingController(),
                      textInputType: TextInputType.text,
                      maxLines: 1,
                      hintText: '例）tanaka@hirome.co.jp',
                    ),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '担当者電話番号',
                    child: CustomTextField(
                      controller: TextEditingController(),
                      textInputType: TextInputType.text,
                      maxLines: 1,
                      hintText: '例）090-0000-0000',
                    ),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '媒体名',
                    child: CustomTextField(
                      controller: TextEditingController(),
                      textInputType: TextInputType.text,
                      maxLines: 1,
                      hintText: '例）TV放送・WEB配信',
                    ),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '番組・雑誌名',
                    child: CustomTextField(
                      controller: TextEditingController(),
                      textInputType: TextInputType.text,
                      maxLines: 1,
                      hintText: '例）ひろめ市場へ行こう！',
                    ),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '出演者情報',
                    child: CustomTextField(
                      controller: TextEditingController(),
                      textInputType: TextInputType.text,
                      maxLines: 1,
                      hintText: '例）ひろめ太郎、ひろめ花子',
                    ),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '特集内容・備考',
                    child: CustomTextField(
                      controller: TextEditingController(),
                      textInputType: TextInputType.multiline,
                      maxLines: null,
                      hintText: '例）賑わうひろめ市場の様子と高知の名物料理特集',
                    ),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    'OA・掲載予定日',
                    child: CustomTextField(
                      controller: TextEditingController(),
                      textInputType: TextInputType.text,
                      maxLines: 1,
                      hintText: '例）令和元年11月1日10時から放送予定',
                    ),
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
                    child: CustomTextField(
                      controller: TextEditingController(),
                      textInputType: TextInputType.text,
                      maxLines: 1,
                      hintText: '例）令和元年9月30日14:00〜16:00',
                    ),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '担当者名',
                    child: CustomTextField(
                      controller: TextEditingController(),
                      textInputType: TextInputType.text,
                      maxLines: 1,
                      hintText: '例）山田二郎',
                    ),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '取材時間',
                    child: CustomTextField(
                      controller: TextEditingController(),
                      textInputType: TextInputType.text,
                      maxLines: 1,
                      hintText: '例）2時間程度',
                    ),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '席予約',
                    child: Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(color: kDisabledColor),
                          bottom: BorderSide(color: kDisabledColor),
                        ),
                      ),
                      child: CheckboxListTile(
                        title: const Text('必要な場合はチェックを入れてください'),
                        value: false,
                        onChanged: (value) {},
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '取材店舗',
                    child: CustomTextField(
                      controller: TextEditingController(),
                      textInputType: TextInputType.text,
                      maxLines: 1,
                      hintText: '例）明神丸、黒潮物産',
                    ),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '訪問人数',
                    child: CustomTextField(
                      controller: TextEditingController(),
                      textInputType: TextInputType.text,
                      maxLines: 1,
                      hintText:
                          '例）タレント2名(ひろめ太郎・ひろめくん)、スタッフ4名、カメラマン1名、ディレクター1名、AD2名',
                    ),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '取材内容・備考',
                    child: CustomTextField(
                      controller: TextEditingController(),
                      textInputType: TextInputType.multiline,
                      maxLines: null,
                      hintText:
                          '例）ひろめ太郎とゲストのひろめくんが館内を散策する様子とカツオのたたきや芋けんぴを食べる様子',
                    ),
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
                    child: CustomTextField(
                      controller: TextEditingController(),
                      textInputType: TextInputType.text,
                      maxLines: 1,
                      hintText: '例）令和元年9月20日14:00〜15:00',
                    ),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '担当者',
                    child: CustomTextField(
                      controller: TextEditingController(),
                      textInputType: TextInputType.text,
                      maxLines: 1,
                      hintText: '例）田中太郎',
                    ),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '訪問人数',
                    child: CustomTextField(
                      controller: TextEditingController(),
                      textInputType: TextInputType.text,
                      maxLines: 1,
                      hintText: '例）2名',
                    ),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    'ロケハン内容・備考',
                    child: CustomTextField(
                      controller: TextEditingController(),
                      textInputType: TextInputType.multiline,
                      maxLines: null,
                      hintText: '例）9/17(火)〜9/20(金)のいずれかの日程で14:00〜15:00',
                    ),
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
                    child: CustomTextField(
                      controller: TextEditingController(),
                      textInputType: TextInputType.text,
                      maxLines: 1,
                      hintText: '例）令和元年10月1日14:00〜15:00',
                    ),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '担当者',
                    child: CustomTextField(
                      controller: TextEditingController(),
                      textInputType: TextInputType.text,
                      maxLines: 1,
                      hintText: '例）山田太郎',
                    ),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '撮影時間',
                    child: CustomTextField(
                      controller: TextEditingController(),
                      textInputType: TextInputType.text,
                      maxLines: 1,
                      hintText: '例）1時間程度',
                    ),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '席予約',
                    child: Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(color: kDisabledColor),
                          bottom: BorderSide(color: kDisabledColor),
                        ),
                      ),
                      child: CheckboxListTile(
                        title: const Text('必要な場合はチェックを入れてください'),
                        value: false,
                        onChanged: (value) {},
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '取材店舗',
                    child: CustomTextField(
                      controller: TextEditingController(),
                      textInputType: TextInputType.text,
                      maxLines: 1,
                      hintText: '例）明神丸、黒潮物産',
                    ),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '訪問人数',
                    child: CustomTextField(
                      controller: TextEditingController(),
                      textInputType: TextInputType.text,
                      maxLines: 1,
                      hintText: '例）3名',
                    ),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '撮影内容・備考',
                    child: CustomTextField(
                      controller: TextEditingController(),
                      textInputType: TextInputType.multiline,
                      maxLines: null,
                      hintText: '例）ひろめ市場の内観・外観、カツオのたたきを焼いている映像',
                    ),
                  ),
                  const SizedBox(height: 24),
                  const DottedDivider(),
                  const SizedBox(height: 16),
                  FormLabel(
                    'その他連絡事項',
                    child: CustomTextField(
                      controller: TextEditingController(),
                      textInputType: TextInputType.multiline,
                      maxLines: null,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const DottedDivider(),
                  const SizedBox(height: 32),
                  CustomButton(
                    type: ButtonSizeType.lg,
                    label: '入力内容を確認',
                    labelColor: kWhiteColor,
                    backgroundColor: kBlueColor,
                    onPressed: () async {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: Step2Screen(),
                        ),
                      );
                    },
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
