import 'package:darts_link_project/components/back_ground_image.dart';
import 'package:flutter/material.dart';

class StoreRegisterApplicationReviewPage extends StatefulWidget {
  const StoreRegisterApplicationReviewPage({
    Key? key,
  }) : super(key: key);

  @override
  State<StoreRegisterApplicationReviewPage> createState() =>
      _StoreRegisterApplicationReviewPageState();
}

class _StoreRegisterApplicationReviewPageState
    extends State<StoreRegisterApplicationReviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        const BackGroundImage(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(70.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 164,
                ),
                Image.asset('assets/images/logo2.png'),
                const SizedBox(
                  height: 70,
                ),
                const Text(
                  '申し込み審査中',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  '申請しました。',
                  style: TextStyle(color: Colors.grey),
                ),
                const Text(
                  '現在、審査中です。しばらくお待ちください',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
