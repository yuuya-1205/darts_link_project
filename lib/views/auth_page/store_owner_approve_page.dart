import 'package:darts_link_project/components/follow_approve_button.dart';
import 'package:darts_link_project/models/app_user.dart';
import 'package:darts_link_project/repositories/store_owner_repository.dart';
import 'package:darts_link_project/views/auth_page/store_owner_approve_detail_page.dart';
import 'package:darts_link_project/views/components/original_app_bar/original_app_bar.dart';
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
      appBar: const OriginalAppBer(title: '店舗申請確認ページ'),
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
                      );
                    });
              }),
        ),
      ),
    );
  }
}
