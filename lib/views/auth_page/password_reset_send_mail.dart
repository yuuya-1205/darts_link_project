import 'package:darts_link_project/components/back_ground_image.dart';
import 'package:darts_link_project/components/original_button.dart';
import 'package:darts_link_project/views/auth_page/login_page.dart';
import 'package:flutter/material.dart';

class PasswordResetSendMail extends StatefulWidget {
  const PasswordResetSendMail({Key? key}) : super(key: key);

  @override
  State<PasswordResetSendMail> createState() => _PasswordResetSendMailState();
}

class _PasswordResetSendMailState extends State<PasswordResetSendMail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        const BackGroundImage(),
        SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(
                height: 135,
              ),
              const Text(
                'メールを送信しました',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                'パスワードを再発行しました',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              const Text(
                'メールを送信しましたのでご確認ください。',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                '10秒後にログインページに戻ります。',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 72,
              ),
              OriginalButton(
                primary: const Color.fromRGBO(247, 63, 150, 1),
                onPrimary: Colors.white,
                text: 'ログインページへ',
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                onPressed: () async {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => const LoginPage()),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
