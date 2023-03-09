import 'dart:async';

import 'package:darts_link_project/components/back_ground_image.dart';
import 'package:darts_link_project/components/original_button.dart';
import 'package:darts_link_project/repositories/auth_repository.dart';
import 'package:darts_link_project/views/regist_user_info_page.dart/regist_person_info_page.dart';
import 'package:darts_link_project/views/regist_user_info_page.dart/regist_store_owner_info_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EmailSendCheck extends StatefulWidget {
  // 呼び出し元Widgetから受け取った後、変更をしないためfinalを宣言。
  final String email;
  final String password;
  final int from;
  final bool isStoreOwner;
  //1 → アカウント作成画面から    2 → ログイン画面から

  const EmailSendCheck({
    Key? key,
    required this.email,
    required this.password,
    required this.from,
    required this.isStoreOwner,
  }) : super(key: key);

  @override
  EmailSendCheckState createState() => EmailSendCheckState();
}

class EmailSendCheckState extends State<EmailSendCheck> {
  final _auth = FirebaseAuth.instance;
  UserCredential? _result;
  String? _nocheckText;
  String? _sentEmailText;
  int _btn_click_num = 0;

  @override
  void initState() {
    timerReading();
    super.initState();
  }

  void timerReading() {
    Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      final emailVerified =
          AuthRepository.currentFirebaseUser?.emailVerified ?? false;
      if (!emailVerified) {
        return;
      }
      // emailVerifiedがtrueに変更されたタイミングでタイマーを停止
      timer.cancel();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => widget.isStoreOwner
              ? const RegistStoreOwnerInfoPage()
              : const RegistPersonInfoPage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // 前画面から遷移後の初期表示内容
    if (_btn_click_num == 0) {
      if (widget.from == 1) {
        // アカウント作成画面から遷移した時
        _nocheckText = '';
        _sentEmailText = '${widget.email}\nに確認メールを送信しました。';
      } else {
        _nocheckText = 'まだメール確認が完了していません。\n確認メール内のリンクをクリックしてください。';
        _sentEmailText = '';
      }
    }

    return Scaffold(
      // メイン画面
      body: Stack(
        children: [
          const BackGroundImage(),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // 確認メール未完了時のメッセージ
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 20.0),
                  child: Text(
                    _nocheckText!,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),

                // 確認メール送信時のメッセージ
                Text(_sentEmailText!),
                const SizedBox(
                  height: 20,
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 30.0),
                  child: SizedBox(
                    width: 200,
                    child: OriginalButton(
                      primary: const Color.fromRGBO(247, 63, 150, 1),
                      onPrimary: Colors.white,
                      text: '確認メールを再送信',
                      onPressed: () async {
                        _result = await _auth.signInWithEmailAndPassword(
                          email: widget.email,
                          password: widget.password,
                        );

                        _result?.user!.sendEmailVerification();
                        setState(() {
                          _btn_click_num++;
                          _sentEmailText = '${widget.email}\nに確認メールを送信しました。';
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
