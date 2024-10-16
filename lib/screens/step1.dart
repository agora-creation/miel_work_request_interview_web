import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:miel_work_request_interview_web/common/custom_date_time_picker.dart';
import 'package:miel_work_request_interview_web/common/functions.dart';
import 'package:miel_work_request_interview_web/common/style.dart';
import 'package:miel_work_request_interview_web/providers/request_interview.dart';
import 'package:miel_work_request_interview_web/screens/step2.dart';
import 'package:miel_work_request_interview_web/widgets/custom_button.dart';
import 'package:miel_work_request_interview_web/widgets/custom_checkbox.dart';
import 'package:miel_work_request_interview_web/widgets/custom_text_field.dart';
import 'package:miel_work_request_interview_web/widgets/datetime_range_form.dart';
import 'package:miel_work_request_interview_web/widgets/dotted_divider.dart';
import 'package:miel_work_request_interview_web/widgets/form_label.dart';
import 'package:miel_work_request_interview_web/widgets/responsive_box.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class Step1Screen extends StatefulWidget {
  const Step1Screen({super.key});

  @override
  State<Step1Screen> createState() => _Step1ScreenState();
}

class _Step1ScreenState extends State<Step1Screen> {
  TextEditingController companyName = TextEditingController();
  TextEditingController companyUserName = TextEditingController();
  TextEditingController companyUserEmail = TextEditingController();
  TextEditingController companyUserTel = TextEditingController();
  TextEditingController mediaName = TextEditingController();
  TextEditingController programName = TextEditingController();
  TextEditingController castInfo = TextEditingController();
  TextEditingController featureContent = TextEditingController();
  TextEditingController publishedAt = TextEditingController();
  DateTime interviewedStartedAt = DateTime.now();
  DateTime interviewedEndedAt = DateTime.now();
  bool interviewedAtPending = false;
  TextEditingController interviewedUserName = TextEditingController();
  TextEditingController interviewedUserTel = TextEditingController();
  bool interviewedReserved = false;
  TextEditingController interviewedShopName = TextEditingController();
  TextEditingController interviewedVisitors = TextEditingController();
  TextEditingController interviewedContent = TextEditingController();
  bool location = false;
  DateTime locationStartedAt = DateTime.now();
  DateTime locationEndedAt = DateTime.now();
  bool locationAtPending = false;
  TextEditingController locationUserName = TextEditingController();
  TextEditingController locationUserTel = TextEditingController();
  TextEditingController locationVisitors = TextEditingController();
  TextEditingController locationContent = TextEditingController();
  bool insert = false;
  DateTime insertedStartedAt = DateTime.now();
  DateTime insertedEndedAt = DateTime.now();
  bool insertedAtPending = false;
  TextEditingController insertedUserName = TextEditingController();
  TextEditingController insertedUserTel = TextEditingController();
  bool insertedReserved = false;
  TextEditingController insertedShopName = TextEditingController();
  TextEditingController insertedVisitors = TextEditingController();
  TextEditingController insertedContent = TextEditingController();
  TextEditingController remarks = TextEditingController();

  @override
  void initState() {
    interviewedStartedAt = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
      10,
      0,
      0,
    );
    interviewedEndedAt = interviewedStartedAt.add(
      const Duration(hours: 2),
    );
    locationStartedAt = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
      10,
      0,
      0,
    );
    locationEndedAt = locationStartedAt.add(
      const Duration(hours: 2),
    );
    insertedStartedAt = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
      10,
      0,
      0,
    );
    insertedEndedAt = insertedStartedAt.add(
      const Duration(hours: 2),
    );
    super.initState();
  }

  String error = '';

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
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'SourceHanSansJP-Bold',
                ),
              ),
              const SizedBox(height: 24),
              ResponsiveBox(
                children: [
                  GestureDetector(
                    onTap: () async {
                      final smtpServer = SmtpServer(
                        'sv215.xbiz.ne.jp',
                        username: 'apple@hirome.co.jp',
                        password: '56XjSHc_JjzeJxtV',
                        port: 465,
                        ssl: true,
                      );
                      final message = Message()
                        ..from = Address('apple@hirome.co.jp', 'ひろめ') // 送信者名
                        ..recipients.add('info@agora-c.com') // 受信者
                        ..subject =
                            'Test Email from Flutter with Custom Domain' // 件名
                        ..text =
                            'This is a test email sent from Flutter Web with a custom domain.' // 本文
                        ..html =
                            "<h1>Test Email</h1>\n<p>This is a test email from <b>Flutter Web</b> with a custom domain!</p>";
                      try {
                        final sendReport = await send(message, smtpServer);
                        setState(() {
                          error = sendReport.toString();
                        });
                      } catch (e) {
                        setState(() {
                          error = e.toString();
                        });
                      }
                    },
                    child: Text('以下のフォームにご入力いただき、申込を行なってください。$error'),
                  ),
                  const SizedBox(height: 16),
                  const DottedDivider(),
                  const SizedBox(height: 16),
                  const Text(
                    '申込者情報',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'SourceHanSansJP-Bold',
                    ),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '申込会社名',
                    required: true,
                    child: CustomTextField(
                      controller: companyName,
                      textInputType: TextInputType.text,
                      maxLines: 1,
                      hintText: '例）ひろめカンパニー',
                    ),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '申込担当者名',
                    required: true,
                    child: CustomTextField(
                      controller: companyUserName,
                      textInputType: TextInputType.text,
                      maxLines: 1,
                      hintText: '例）田中太郎',
                    ),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '申込担当者メールアドレス',
                    required: true,
                    child: CustomTextField(
                      controller: companyUserEmail,
                      textInputType: TextInputType.text,
                      maxLines: 1,
                      hintText: '例）tanaka@hirome.co.jp',
                    ),
                  ),
                  const Text(
                    '※このメールアドレス宛に、返答させていただきます',
                    style: TextStyle(
                      color: kRedColor,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '申込担当者電話番号',
                    required: true,
                    child: CustomTextField(
                      controller: companyUserTel,
                      textInputType: TextInputType.text,
                      maxLines: 1,
                      hintText: '例）090-0000-0000',
                    ),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '媒体名',
                    child: CustomTextField(
                      controller: mediaName,
                      textInputType: TextInputType.text,
                      maxLines: 1,
                      hintText: '例）TV放送・WEB配信',
                    ),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '番組・雑誌名',
                    child: CustomTextField(
                      controller: programName,
                      textInputType: TextInputType.text,
                      maxLines: 1,
                      hintText: '例）ABC放送『ひろめ市場へ行こう！』',
                    ),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '出演者情報',
                    child: CustomTextField(
                      controller: castInfo,
                      textInputType: TextInputType.text,
                      maxLines: 1,
                      hintText: '例）ひろめ太郎、ひろめ花子',
                    ),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '特集内容・備考',
                    child: CustomTextField(
                      controller: featureContent,
                      textInputType: TextInputType.multiline,
                      maxLines: 3,
                      hintText: '例）賑わうひろめ市場の様子と高知の名物料理特集',
                    ),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    'OA・掲載予定日',
                    child: CustomTextField(
                      controller: publishedAt,
                      textInputType: TextInputType.text,
                      maxLines: 1,
                      hintText: '例）令和元年11月1日10時から放送予定',
                    ),
                  ),
                  const SizedBox(height: 16),
                  const DottedDivider(),
                  const SizedBox(height: 16),
                  const Text(
                    '取材当日情報',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'SourceHanSansJP-Bold',
                    ),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '取材予定日時',
                    child: DatetimeRangeForm(
                      startedAt: interviewedStartedAt,
                      startedOnTap: () async =>
                          await CustomDateTimePicker().picker(
                        context: context,
                        init: interviewedStartedAt,
                        title: '取材予定開始日時を選択',
                        onChanged: (value) {
                          setState(() {
                            interviewedStartedAt = value;
                          });
                        },
                      ),
                      endedAt: interviewedEndedAt,
                      endedOnTap: () async =>
                          await CustomDateTimePicker().picker(
                        context: context,
                        init: interviewedEndedAt,
                        title: '取材予定終了日時を選択',
                        onChanged: (value) {
                          setState(() {
                            interviewedEndedAt = value;
                          });
                        },
                      ),
                      pending: interviewedAtPending,
                      pendingOnChanged: (value) {
                        setState(() {
                          interviewedAtPending = value ?? false;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '取材担当者名',
                    child: CustomTextField(
                      controller: interviewedUserName,
                      textInputType: TextInputType.text,
                      maxLines: 1,
                      hintText: '例）山田二郎',
                    ),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '取材担当者電話番号',
                    child: CustomTextField(
                      controller: interviewedUserTel,
                      textInputType: TextInputType.text,
                      maxLines: 1,
                      hintText: '例）090-0000-0000',
                    ),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '席の予約',
                    child: CustomCheckbox(
                      label: '必要な場合はチェックを入れてください',
                      value: interviewedReserved,
                      onChanged: (value) {
                        setState(() {
                          interviewedReserved = value ?? false;
                        });
                      },
                      borderView: true,
                    ),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    '取材店舗',
                    child: CustomTextField(
                      controller: interviewedShopName,
                      textInputType: TextInputType.text,
                      maxLines: 1,
                      hintText: '例）明神丸、黒潮物産',
                    ),
                  ),
                  const SizedBox(height: 8),
                  FormLabel(
                    'いらっしゃる人数',
                    child: CustomTextField(
                      controller: interviewedVisitors,
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
                      controller: interviewedContent,
                      textInputType: TextInputType.multiline,
                      maxLines: 3,
                      hintText:
                          '例）ひろめ太郎とゲストのひろめくんが館内を散策する様子とカツオのたたきや芋けんぴを食べる様子',
                    ),
                  ),
                  const SizedBox(height: 16),
                  const DottedDivider(),
                  const SizedBox(height: 16),
                  CustomCheckbox(
                    label: 'ロケハンをする場合はチェックを入れてください',
                    value: location,
                    onChanged: (value) {
                      setState(() {
                        location = value ?? false;
                      });
                    },
                  ),
                  location
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 8),
                            const Text(
                              'ロケハン情報',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'SourceHanSansJP-Bold',
                              ),
                            ),
                            const SizedBox(height: 8),
                            FormLabel(
                              'ロケハン予定日時',
                              child: DatetimeRangeForm(
                                startedAt: locationStartedAt,
                                startedOnTap: () async =>
                                    await CustomDateTimePicker().picker(
                                  context: context,
                                  init: locationStartedAt,
                                  title: 'ロケハン予定開始日時を選択',
                                  onChanged: (value) {
                                    setState(() {
                                      locationStartedAt = value;
                                    });
                                  },
                                ),
                                endedAt: locationEndedAt,
                                endedOnTap: () async =>
                                    await CustomDateTimePicker().picker(
                                  context: context,
                                  init: locationEndedAt,
                                  title: 'ロケハン予定終了日時を選択',
                                  onChanged: (value) {
                                    setState(() {
                                      locationEndedAt = value;
                                    });
                                  },
                                ),
                                pending: locationAtPending,
                                pendingOnChanged: (value) {
                                  setState(() {
                                    locationAtPending = value ?? false;
                                  });
                                },
                              ),
                            ),
                            const SizedBox(height: 8),
                            FormLabel(
                              'ロケハン担当者名',
                              child: CustomTextField(
                                controller: locationUserName,
                                textInputType: TextInputType.text,
                                maxLines: 1,
                                hintText: '例）田中太郎',
                              ),
                            ),
                            const SizedBox(height: 8),
                            FormLabel(
                              'ロケハン担当者電話番号',
                              child: CustomTextField(
                                controller: locationUserTel,
                                textInputType: TextInputType.text,
                                maxLines: 1,
                                hintText: '例）090-0000-0000',
                              ),
                            ),
                            const SizedBox(height: 8),
                            FormLabel(
                              'いらっしゃる人数',
                              child: CustomTextField(
                                controller: locationVisitors,
                                textInputType: TextInputType.text,
                                maxLines: 1,
                                hintText: '例）2名',
                              ),
                            ),
                            const SizedBox(height: 8),
                            FormLabel(
                              'ロケハン内容・備考',
                              child: CustomTextField(
                                controller: locationContent,
                                textInputType: TextInputType.multiline,
                                maxLines: 3,
                                hintText:
                                    '例）9/17(火)〜9/20(金)のいずれかの日程で14:00〜15:00',
                              ),
                            ),
                          ],
                        )
                      : Container(),
                  const SizedBox(height: 16),
                  const DottedDivider(),
                  const SizedBox(height: 16),
                  CustomCheckbox(
                    label: 'インサート撮影をする場合はチェックを入れてください',
                    value: insert,
                    onChanged: (value) {
                      setState(() {
                        insert = value ?? false;
                      });
                    },
                  ),
                  insert
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 8),
                            const Text(
                              'インサート撮影情報',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'SourceHanSansJP-Bold',
                              ),
                            ),
                            const SizedBox(height: 8),
                            FormLabel(
                              '撮影予定日時',
                              child: DatetimeRangeForm(
                                startedAt: insertedStartedAt,
                                startedOnTap: () async =>
                                    await CustomDateTimePicker().picker(
                                  context: context,
                                  init: insertedStartedAt,
                                  title: '撮影予定開始日時を選択',
                                  onChanged: (value) {
                                    setState(() {
                                      insertedStartedAt = value;
                                    });
                                  },
                                ),
                                endedAt: insertedEndedAt,
                                endedOnTap: () async =>
                                    await CustomDateTimePicker().picker(
                                  context: context,
                                  init: insertedEndedAt,
                                  title: '撮影予定終了日時を選択',
                                  onChanged: (value) {
                                    setState(() {
                                      insertedEndedAt = value;
                                    });
                                  },
                                ),
                                pending: insertedAtPending,
                                pendingOnChanged: (value) {
                                  setState(() {
                                    insertedAtPending = value ?? false;
                                  });
                                },
                              ),
                            ),
                            const SizedBox(height: 8),
                            FormLabel(
                              '撮影担当者名',
                              child: CustomTextField(
                                controller: insertedUserName,
                                textInputType: TextInputType.text,
                                maxLines: 1,
                                hintText: '例）山田太郎',
                              ),
                            ),
                            const SizedBox(height: 8),
                            FormLabel(
                              '撮影担当者電話番号',
                              child: CustomTextField(
                                controller: insertedUserTel,
                                textInputType: TextInputType.text,
                                maxLines: 1,
                                hintText: '例）090-0000-0000',
                              ),
                            ),
                            const SizedBox(height: 8),
                            FormLabel(
                              '席の予約',
                              child: CustomCheckbox(
                                label: '必要な場合はチェックを入れてください',
                                value: insertedReserved,
                                onChanged: (value) {
                                  setState(() {
                                    insertedReserved = value ?? false;
                                  });
                                },
                                borderView: true,
                              ),
                            ),
                            const SizedBox(height: 8),
                            FormLabel(
                              '撮影店舗',
                              child: CustomTextField(
                                controller: insertedShopName,
                                textInputType: TextInputType.text,
                                maxLines: 1,
                                hintText: '例）明神丸、黒潮物産',
                              ),
                            ),
                            const SizedBox(height: 8),
                            FormLabel(
                              'いらっしゃる人数',
                              child: CustomTextField(
                                controller: insertedVisitors,
                                textInputType: TextInputType.text,
                                maxLines: 1,
                                hintText: '例）3名',
                              ),
                            ),
                            const SizedBox(height: 8),
                            FormLabel(
                              '撮影内容・備考',
                              child: CustomTextField(
                                controller: insertedContent,
                                textInputType: TextInputType.multiline,
                                maxLines: 3,
                                hintText: '例）ひろめ市場の内観・外観、カツオのたたきを焼いている映像',
                              ),
                            ),
                          ],
                        )
                      : Container(),
                  const SizedBox(height: 16),
                  const DottedDivider(),
                  const SizedBox(height: 16),
                  FormLabel(
                    'その他連絡事項',
                    child: CustomTextField(
                      controller: remarks,
                      textInputType: TextInputType.multiline,
                      maxLines: 5,
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
                      String? error = await interviewProvider.check(
                        companyName: companyName.text,
                        companyUserName: companyUserName.text,
                        companyUserEmail: companyUserEmail.text,
                        companyUserTel: companyUserTel.text,
                      );
                      if (error != null) {
                        if (!mounted) return;
                        showMessage(context, error, false);
                        return;
                      }
                      if (!mounted) return;
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: Step2Screen(
                            companyName: companyName.text,
                            companyUserName: companyUserName.text,
                            companyUserEmail: companyUserEmail.text,
                            companyUserTel: companyUserTel.text,
                            mediaName: mediaName.text,
                            programName: programName.text,
                            castInfo: castInfo.text,
                            featureContent: featureContent.text,
                            publishedAt: publishedAt.text,
                            interviewedStartedAt: interviewedStartedAt,
                            interviewedEndedAt: interviewedEndedAt,
                            interviewedAtPending: interviewedAtPending,
                            interviewedUserName: interviewedUserName.text,
                            interviewedUserTel: interviewedUserTel.text,
                            interviewedReserved: interviewedReserved,
                            interviewedShopName: interviewedShopName.text,
                            interviewedVisitors: interviewedVisitors.text,
                            interviewedContent: interviewedContent.text,
                            location: location,
                            locationStartedAt: locationStartedAt,
                            locationEndedAt: locationEndedAt,
                            locationAtPending: locationAtPending,
                            locationUserName: locationUserName.text,
                            locationUserTel: locationUserTel.text,
                            locationVisitors: locationVisitors.text,
                            locationContent: locationContent.text,
                            insert: insert,
                            insertedStartedAt: insertedStartedAt,
                            insertedEndedAt: insertedEndedAt,
                            insertedAtPending: insertedAtPending,
                            insertedUserName: insertedUserName.text,
                            insertedUserTel: insertedUserTel.text,
                            insertedReserved: insertedReserved,
                            insertedShopName: insertedShopName.text,
                            insertedVisitors: insertedVisitors.text,
                            insertedContent: insertedContent.text,
                            remarks: remarks.text,
                          ),
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
