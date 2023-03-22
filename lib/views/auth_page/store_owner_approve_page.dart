import 'package:darts_link_project/components/follow_approve_button.dart';
import 'package:darts_link_project/models/app_user.dart';
import 'package:darts_link_project/repositories/store_owner_repository.dart';
import 'package:darts_link_project/views/auth_page/store_owner_approve_detail_page.dart';
import 'package:flutter/material.dart';

class StoreOwnerApprovePage extends StatefulWidget {
  const StoreOwnerApprovePage({Key? key}) : super(key: key);

  @override
  State<StoreOwnerApprovePage> createState() => _StoreOwnerApprovePageState();
}

class _StoreOwnerApprovePageState extends State<StoreOwnerApprovePage> {
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
          '店舗申請確認ページ',
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: StreamBuilder<List<StoreOwner>>(
              stream: StoreOwnerRepository.fetchNotApprovedStoreOwnerStream(),
              builder: (context, snapshot) {
                if (snapshot.connectionState != ConnectionState.active) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (!snapshot.hasData) {
                  return Container();
                }

                final storeOwners = snapshot.data;
                if (storeOwners!.isEmpty) {
                  return const Center(
                    child: Text('まだ、申請がありません'),
                  );
                }
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: storeOwners.length,
                    itemBuilder: (context, index) {
                      final storeOwner = storeOwners[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: ((context) =>
                                  StoreOwnerApproveDetailPage(
                                    storeOwner: storeOwner,
                                  )),
                            ),
                          );
                        },
                        child: Container(
                          child: Row(
                            children: [
                              Text(
                                storeOwners[index].userName,
                                style: const TextStyle(fontSize: 16),
                              ),
                              const Spacer(),
                              FollowApproveButton(
                                  onPressed: () {
                                    StoreOwnerRepository.updateStoreOwner(
                                        storeOwners[index]
                                            .copyWith(isApproved: true));
                                  },
                                  text: '承認'),
                              const SizedBox(
                                width: 12,
                              ),
                              FollowApproveButton(onPressed: () {}, text: '拒否'),
                            ],
                          ),
                        ),
                      );
                    });
              }),
        ),
      ),
    );
  }
}
