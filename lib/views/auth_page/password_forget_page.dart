import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darts_link_project/components/back_ground_image.dart';
import 'package:darts_link_project/components/original_button.dart';
import 'package:darts_link_project/repositories/auth_repository.dart';
import 'package:darts_link_project/views/auth_page/login_page.dart';
import 'package:darts_link_project/views/auth_page/password_reset_send_mail.dart';
import 'package:flutter/material.dart';

class PasswordForgetPage extends StatefulWidget {
  const PasswordForgetPage({Key? key}) : super(key: key);

  @override
  State<PasswordForgetPage> createState() => _PasswordForgetPageState();
}

class _PasswordForgetPageState extends State<PasswordForgetPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  String errorMessage = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackGroundImage(),
          Form(
            key: _formKey,
            child: ListView(padding: const EdgeInsets.all(20.0), children: [
              const SizedBox(
                height: 14,
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: BackButton(),
              ),
              const SizedBox(
                height: 80,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 15),
                  const Text(
                    'パスワードをお忘れですか？',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 40),
                  const Text(
                    '登録時のメールアドレスを入力してください',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(
                    height: 86,
                  ),
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'メールアドレスを入力してください';
                      }
                      final regex = RegExp(
                          r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
                      if (!regex.hasMatch(value)) {
                        return 'メールアドレスを入力してください';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'メールアドレスを入力してください',
                      isDense: true,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    errorMessage,
                    style: const TextStyle(color: Colors.red),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  OriginalButton(
                    primary: const Color.fromRGBO(247, 63, 150, 1),
                    onPrimary: Colors.white,
                    text: '送信する',
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                    onPressed: () async {
                      if (!_formKey.currentState!.validate()) {
                        return;
                      }
                      try {
                        final email = _emailController.text;
                        await AuthRepository.resetPassword(email: email);
                      } on FirebaseException catch (e) {
                        print(e.code);
                        if (e.toString() ==
                            '[firebase_auth/missing-email] An email address must be provided.') {
                          errorMessage = 'ユーザーが登録されていません';
                          setState(() {});
                        } else if (e.toString() ==
                            '[firebase_auth/invalid-email] The email address is badly formatted.') {
                          errorMessage = '登録しているメールアドレスを入力してください';
                          setState(() {});
                        }
                        return;
                      }
                      // ignore: use_build_context_synchronously
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) =>
                                const PasswordResetSendMail())),
                      );
                      await Future.delayed(const Duration(seconds: 10)).then(
                        (value) => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => const LoginPage()),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
