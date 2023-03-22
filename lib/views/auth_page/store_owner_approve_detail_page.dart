import 'package:darts_link_project/models/app_user.dart';
import 'package:darts_link_project/repositories/app_user_repository.dart';
import 'package:darts_link_project/repositories/auth_repository.dart';
import 'package:flutter/material.dart';

class StoreOwnerApproveDetailPage extends StatefulWidget {
  const StoreOwnerApproveDetailPage({super.key, required this.storeOwner});
  final StoreOwner storeOwner;

  @override
  State<StoreOwnerApproveDetailPage> createState() =>
      _StoreOwnerApproveDetailPageState();
}

class _StoreOwnerApproveDetailPageState
    extends State<StoreOwnerApproveDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Color.fromRGBO(247, 63, 150, 1),
        ),
        leadingWidth: 76,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Row(children: [
            Container(
              width: 30,
              child: const BackButton(),
            ),
            const Text(
              '戻る',
              style: TextStyle(
                color: Color.fromRGBO(247, 63, 150, 1),
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ]),
        ),
        backgroundColor: Colors.white,
        title: const Text(
          '店舗情報詳細',
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  '店舗名',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(widget.storeOwner.userName),
              ],
            ),
            Row(
              children: [
                const Text(
                  '都道府県',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(widget.storeOwner.selfIntroduction),
              ],
            ),
            Row(
              children: [
                const Text(
                  'エリア',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(widget.storeOwner.selfIntroduction),
              ],
            ),
            Row(
              children: [
                const Text(
                  '住所',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(widget.storeOwner.address),
              ],
            ),
            Row(
              children: [
                const Text(
                  '都道府県',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(widget.storeOwner.selfIntroduction),
              ],
            ),
            Text(widget.storeOwner.address),
          ],
        ),
      ),
    );
  }
}
