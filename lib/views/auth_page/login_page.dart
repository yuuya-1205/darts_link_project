// ignore: unnecessary_import
import 'dart:ui';
import 'package:darts_link_project/components/back_ground_image.dart';
import 'package:darts_link_project/components/follow_approve_button.dart';
import 'package:darts_link_project/components/input_field.dart';
import 'package:darts_link_project/components/original_button.dart';
import 'package:darts_link_project/repositories/auth_repository.dart';
import 'package:darts_link_project/repositories/person_repository.dart';
import 'package:darts_link_project/views/auth_page/password_forget_page.dart';
import 'package:darts_link_project/views/auth_page/register_slider_page.dart';
import 'package:darts_link_project/views/auth_page/store_slider_page.dart';
import 'package:darts_link_project/views/top_page/top_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final user = FirebaseAuth.instance.currentUser;

  String errorMassege = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackGroundImage(),
          Form(
            key: _formKey,
            child: SafeArea(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  const SizedBox(
                    height: 164,
                  ),
                  SizedBox(
                    child: Image.asset('assets/images/logo2.png'),
                  ),
                  const SizedBox(
                    height: 54,
                  ),
                  Text(
                    errorMassege,
                    style: const TextStyle(color: Colors.red),
                  ),
                  InputField(
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
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
                    hintText: 'メールアドレス',
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InputField(
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    controller: _passwordController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'パスワードを入力してください';
                      }
                      final regex =
                          RegExp(r"^(?=.*[A-Z])[a-zA-Z0-9.?/-]{6,24}$");
                      if (!regex.hasMatch(value)) {
                        return '大文字含めたアルファベット6文字以上24文字以下のパスワードにしてください';
                      }
                      return null;
                    },
                    hintText: 'パスワード',
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => const PasswordForgetPage()),
                        ),
                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: const [
                        Text(
                          'パスワードをお忘れ方はこちらから',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color.fromRGBO(247, 63, 150, 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  OriginalButton(
                    text: 'ログイン',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    primary: const Color.fromRGBO(247, 63, 150, 1),
                    onPrimary: Colors.white,
                    onPressed: () async {
                      if (!_formKey.currentState!.validate()) {
                        return;
                      }
                      final email = _emailController.text;
                      final password = _passwordController.text;

                      try {
                        await AuthRepository.signIn(
                          email: email,
                          password: password,
                        );
                        if (AuthRepository.currentFirebaseUser == null) {
                          return;
                        }
                        final uid = AuthRepository.currentFirebaseUser!.uid;

                        final person = await PersonRepository.fetchPerson(uid);
                        if (person == null) {
                          return;
                        }

                        AuthRepository.currentUser = person;

                        // ignore: use_build_context_synchronously
                        await showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('ログインしました'),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: const Text('OK'),
                                ),
                              ],
                            );
                          },
                        );
                        // ignore: use_build_context_synchronously
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => const TopPage()),
                          ),
                        );
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'wrong-password') {
                          errorMassege = 'パスワードが間違っています';
                          setState(() {});
                          return;
                        }
                        if (e.code == 'user-not-found') {
                          errorMassege = 'ユーザーが登録されていません';
                          setState(() {});
                          return;
                        }
                        if (e.code == 'invalid-email') {
                          errorMassege = 'メールアドレスを入力してください';
                          setState(() {});
                          return;
                        }
                        if (e.code == 'too-many-requests') {
                          errorMassege = 'パスワードを再設定してください';
                          setState(() {});
                          return;
                        }
                      }
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 1,
                        width: 109,
                        color: Colors.grey,
                      ),
                      const Text(
                        'もしくは',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      Container(
                        height: 1,
                        width: 109,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  FollowApproveButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => const RegisterSliderPage()),
                        ),
                      );
                    },
                    text: '新規登録の方',
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => const StoreSliderPage()),
                        ),
                      );
                    },
                    child: const Center(
                      child: Text(
                        '店舗登録の方',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Color.fromRGBO(247, 63, 150, 1),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
