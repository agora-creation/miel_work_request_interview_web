import 'package:flutter/material.dart';
import 'package:miel_work_request_interview_web/common/style.dart';
import 'package:miel_work_request_interview_web/screens/step1.dart';
import 'package:miel_work_request_interview_web/widgets/link_text.dart';
import 'package:miel_work_request_interview_web/widgets/responsive_box.dart';
import 'package:page_transition/page_transition.dart';

class Step3Screen extends StatefulWidget {
  const Step3Screen({super.key});

  @override
  State<Step3Screen> createState() => _Step3ScreenState();
}

class _Step3ScreenState extends State<Step3Screen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
                const Text('申込ありがとうございました。'),
                const Text(
                  'ご入力いただいたメールアドレス宛に、自動返信メールをお送りしているので、お控えお願いします。',
                ),
                const SizedBox(height: 16),
                const Text('申込内容を確認させていただき、返信いたしますので今しばらくお待ちください。'),
                const SizedBox(height: 16),
                const Text('このページはそのまま閉じても構いません。'),
                const SizedBox(height: 24),
                Center(
                  child: LinkText(
                    label: 'トップに戻る',
                    color: kBlueColor,
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: const Step1Screen(),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}