import 'package:darts_link_project/components/follow_approve_button.dart';
import 'package:darts_link_project/models/app_user.dart';
import 'package:darts_link_project/repositories/store_owner_repository.dart';
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
        backgroundColor: Colors.white,
        title: const Text(
          '店舗承認ページ',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: StreamBuilder<List<StoreOwner>>(
              stream: StoreOwnerRepository.fetchNotApprovedStoreOwnerStream(),
              builder: (context, snapshot) {
                final storeOwners = snapshot.data;
                return ListView.builder(
                    itemCount: storeOwners!.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Row(
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
                          )
                        ],
                      );
                    });
              }),
        ),
      ),
    );
  }
}
