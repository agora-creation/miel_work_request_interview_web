import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:miel_work_request_interview_web/common/custom_date_time_picker.dart';
import 'package:miel_work_request_interview_web/common/functions.dart';
import 'package:miel_work_request_interview_web/common/style.dart';
import 'package:miel_work_request_interview_web/models/request_interview.dart';
import 'package:miel_work_request_interview_web/providers/request_interview.dart';
import 'package:miel_work_request_interview_web/screens/step2.dart';
import 'package:miel_work_request_interview_web/services/request_interview.dart';
import 'package:miel_work_request_interview_web/widgets/attached_file_list.dart';
import 'package:miel_work_request_interview_web/widgets/custom_alert_dialog.dart';
import 'package:miel_work_request_interview_web/widgets/custom_button.dart';
import 'package:miel_work_request_interview_web/widgets/custom_checkbox.dart';
import 'package:miel_work_request_interview_web/widgets/custom_text_field.dart';
import 'package:miel_work_request_interview_web/widgets/datetime_range_form.dart';
import 'package:miel_work_request_interview_web/widgets/dotted_divider.dart';
import 'package:miel_work_request_interview_web/widgets/form_label.dart';
import 'package:miel_work_request_interview_web/widgets/link_text.dart';
import 'package:miel_work_request_interview_web/widgets/responsive_box.dart';
import 'package:page_transition/page_transition.dart';
import 'package:path/path.dart' as p;
import 'package:provider/provider.dart';

class Step1Screen extends StatefulWidget {
  const Step1Screen({super.key});

  @override
  State<Step1Screen> createState() => _Step1ScreenState();
}

class _Step1ScreenState extends State<Step1Screen> {
  RequestInterviewService interviewService = RequestInterviewService();
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
  List<PlatformFile> pickedAttachedFiles = [];
  TextEditingController remarks = TextEditingController();

  void _showCaution() async {
    await Future.delayed(const Duration(seconds: 2));
    if (!mounted) return;
    showDialog(
      context: context,
      builder: (context) => const CautionDialog(),
    );
  }

  void _getPrm() async {
    String? id = Uri.base.queryParameters['id'];
    if (id == null) return;
    RequestInterviewModel? interview = await interviewService.selectData(id);
    if (interview == null) return;
    companyName.text = interview.companyName;
    companyUserName.text = interview.companyUserName;
    companyUserEmail.text = interview.companyUserEmail;
    companyUserTel.text = interview.companyUserTel;
    mediaName.text = interview.mediaName;
    programName.text = interview.programName;
    castInfo.text = interview.castInfo;
    featureContent.text = interview.featureContent;
    publishedAt.text = interview.publishedAt;
    interviewedStartedAt = interview.interviewedStartedAt;
    interviewedEndedAt = interview.interviewedEndedAt;
    interviewedAtPending = interview.interviewedAtPending;
    interviewedUserName.text = interview.interviewedUserName;
    interviewedUserTel.text = interview.interviewedUserTel;
    interviewedReserved = interview.interviewedReserved;
    interviewedShopName.text = interview.interviewedShopName;
    interviewedVisitors.text = interview.interviewedVisitors;
    interviewedContent.text = interview.interviewedContent;
    location = interview.location;
    locationStartedAt = interview.locationStartedAt;
    locationEndedAt = interview.locationEndedAt;
    locationAtPending = interview.locationAtPending;
    locationUserName.text = interview.locationUserName;
    locationUserTel.text = interview.locationUserTel;
    locationVisitors.text = interview.locationVisitors;
    locationContent.text = interview.locationContent;
    insert = interview.insert;
    insertedStartedAt = interview.insertedStartedAt;
    insertedEndedAt = interview.insertedEndedAt;
    insertedAtPending = interview.insertedAtPending;
    insertedUserName.text = interview.insertedUserName;
    insertedUserTel.text = interview.insertedUserTel;
    insertedReserved = interview.insertedReserved;
    insertedShopName.text = interview.insertedShopName;
    insertedVisitors.text = interview.insertedVisitors;
    insertedContent.text = interview.insertedContent;
    remarks.text = interview.remarks;
    setState(() {});
  }

  @override
  void initState() {
    _showCaution();
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
    _getPrm();
    super.initState();
  }

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
                  const Text('以下のフォームにご入力いただき、申込を行なってください。'),
                  const Text('取材に際してご要望がございましたら、「その他連絡事項」にご記入ください。'),
                  const SizedBox(height: 16),
                  const Text(
                      '取材の日程が確定していない場合や、希望日が複数ある場合は、予定日時を「未定」にして、「その他連絡事項」にご入力ください。'),
                  const Text(
                    '必ずしもご希望に添えるわけではありませんが、日程の候補を複数ご用意いただきますと、お申し込みが通りやすくなります。',
                    style: TextStyle(
                      color: kRedColor,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'SourceHanSansJP-Bold',
                    ),
                  ),
                  const Text(
                    'ランチタイム・夕方〜夜間、土日祝日や大型連休中は館内の混雑が予想されますので、取材をお断りさせていただく場合がございます。',
                    style: TextStyle(
                      color: kRedColor,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'SourceHanSansJP-Bold',
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    '取材内容の精査にはお時間がかかりますので、2週間以上の余裕を持ってお申し込みください。',
                    style: TextStyle(
                      color: kRedColor,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'SourceHanSansJP-Bold',
                    ),
                  ),
                  const Text(
                    '弊社担当より、取材の可否又は取材日程の調整について折り返しご連絡をさせていただきます。申込＝取材許可ではございませんのでご注意ください。',
                    style: TextStyle(
                      color: kRedColor,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'SourceHanSansJP-Bold',
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    '取材開始時と取材終了時にそれぞれ必ずひろめ市場インフォメーションにお声がけください。',
                    style: TextStyle(
                      color: kRedColor,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'SourceHanSansJP-Bold',
                    ),
                  ),
                  const Text(
                    '周囲のお客様や店舗のスタッフへ事前に撮影についての説明を行い、ご迷惑にならないよう十分ご配慮ください。',
                    style: TextStyle(
                      color: kRedColor,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'SourceHanSansJP-Bold',
                    ),
                  ),
                  const Text(
                    '館内の通路は非常に狭くなっております。渋滞や混雑が発生しないようにご注意ください。',
                    style: TextStyle(
                      color: kRedColor,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'SourceHanSansJP-Bold',
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    '婚礼の前撮りをご希望の方は以下をリンクをクリックすると、婚礼の前撮り用の入力例が自動で入ります。入力例を参考に入力してください。',
                    style: TextStyle(
                      color: kRedColor,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'SourceHanSansJP-Bold',
                    ),
                  ),
                  LinkText(
                    label: '婚礼の前撮り用の入力例を反映させる',
                    color: kBlueColor,
                    onTap: () {
                      companyName.text = 'ひろめブライダル';
                      companyUserName.text = '田中太郎';
                      companyUserEmail.text = 'bridal@hirome.co.jp';
                      companyUserTel.text = '090-0000-0000';
                      mediaName.text = '前撮り';
                      interviewedUserName.text = '田中太郎';
                      interviewedUserTel.text = '090-0000-0000';
                      interviewedReserved = true;
                      interviewedVisitors.text =
                          '新郎・新婦の2名、カメラマン1名、アシスタント1名、美容師1名';
                      interviewedContent.text =
                          '新郎新婦がひろめ市場の席でカツオのたたきを食べながら乾杯をする様子';
                      setState(() {});
                    },
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
                      fontWeight: FontWeight.bold,
                      fontFamily: 'SourceHanSansJP-Bold',
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
                  const Text(
                    '※基本的に場所の指定はできませんが、特別なご要望がございましたら「その他連絡事項」にご入力ください。',
                    style: TextStyle(
                      color: kRedColor,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'SourceHanSansJP-Bold',
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
                  const Text(
                    '※弊社より各店舗への撮影許可をお取りすることはできません。取材予定のすべての店舗へ、必ず事前に取材許可をお取りください。',
                    style: TextStyle(
                      color: kRedColor,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'SourceHanSansJP-Bold',
                    ),
                  ),
                  const Text(
                    '※各店舗の連絡先は、ひろめ市場ホームページ内に掲載しております。',
                    style: TextStyle(
                      color: kRedColor,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'SourceHanSansJP-Bold',
                    ),
                  ),
                  const Text(
                    '※弊社を通してお食事やお飲み物のご予約・ご注文はできかねますので、ご了承ください。',
                    style: TextStyle(
                      color: kRedColor,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'SourceHanSansJP-Bold',
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
                    '添付ファイル',
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomButton(
                          type: ButtonSizeType.sm,
                          label: 'ファイル選択',
                          labelColor: kWhiteColor,
                          backgroundColor: kGreyColor,
                          onPressed: () async {
                            final result = await FilePicker.platform.pickFiles(
                              type: FileType.any,
                            );
                            if (result == null) return;
                            pickedAttachedFiles.addAll(result.files);
                            setState(() {});
                          },
                        ),
                        const SizedBox(height: 4),
                        Column(
                          children: pickedAttachedFiles.map((file) {
                            return AttachedFileList(
                              fileName: p.basename(file.name),
                              onTap: () {
                                pickedAttachedFiles.remove(file);
                                setState(() {});
                              },
                              isClose: true,
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
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
                            pickedAttachedFiles: pickedAttachedFiles,
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

class CautionDialog extends StatelessWidget {
  const CautionDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAlertDialog(
      content: const SizedBox(
        width: 600,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8),
            Text(
              '取材に関しての注意事項',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'SourceHanSansJP-Bold',
              ),
            ),
            SizedBox(height: 8),
            Text('取材に際してご要望がございましたら、「その他連絡事項」にご記入ください。'),
            SizedBox(height: 16),
            Text(
                '取材の日程が確定していない場合や、希望日が複数ある場合は、予定日時を「未定」にして、「その他連絡事項」にご入力ください。'),
            Text(
              '必ずしもご希望に添えるわけではありませんが、日程の候補を複数ご用意いただきますと、お申し込みが通りやすくなります。',
              style: TextStyle(
                color: kRedColor,
                fontWeight: FontWeight.bold,
                fontFamily: 'SourceHanSansJP-Bold',
              ),
            ),
            Text(
              'ランチタイム・夕方〜夜間、土日祝日や大型連休中は館内の混雑が予想されますので、取材をお断りさせていただく場合がございます。',
              style: TextStyle(
                color: kRedColor,
                fontWeight: FontWeight.bold,
                fontFamily: 'SourceHanSansJP-Bold',
              ),
            ),
            SizedBox(height: 16),
            Text(
              '取材内容の精査にはお時間がかかりますので、2週間以上の余裕を持ってお申し込みください。',
              style: TextStyle(
                color: kRedColor,
                fontWeight: FontWeight.bold,
                fontFamily: 'SourceHanSansJP-Bold',
              ),
            ),
            Text(
              '弊社担当より、取材の可否又は取材日程の調整について折り返しご連絡をさせていただきます。申込＝取材許可ではございませんのでご注意ください。',
              style: TextStyle(
                color: kRedColor,
                fontWeight: FontWeight.bold,
                fontFamily: 'SourceHanSansJP-Bold',
              ),
            ),
            SizedBox(height: 16),
            Text(
              '取材開始時と取材終了時にそれぞれ必ずひろめ市場インフォメーションにお声がけください。',
              style: TextStyle(
                color: kRedColor,
                fontWeight: FontWeight.bold,
                fontFamily: 'SourceHanSansJP-Bold',
              ),
            ),
            Text(
              '周囲のお客様や店舗のスタッフへ事前に撮影についての説明を行い、ご迷惑にならないよう十分ご配慮ください。',
              style: TextStyle(
                color: kRedColor,
                fontWeight: FontWeight.bold,
                fontFamily: 'SourceHanSansJP-Bold',
              ),
            ),
            Text(
              '館内の通路は非常に狭くなっております。渋滞や混雑が発生しないようにご注意ください。',
              style: TextStyle(
                color: kRedColor,
                fontWeight: FontWeight.bold,
                fontFamily: 'SourceHanSansJP-Bold',
              ),
            ),
          ],
        ),
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        CustomButton(
          type: ButtonSizeType.sm,
          label: '了解しました',
          labelColor: kWhiteColor,
          backgroundColor: kGreyColor,
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
  }
}
