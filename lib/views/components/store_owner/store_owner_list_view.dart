import 'package:darts_link_project/models/app_user.dart';
import 'package:flutter/material.dart';

import 'store_owner_list_item_view.dart';

class StoreOwnerListView extends StatelessWidget {
  const StoreOwnerListView({
    required this.storeOwners,
    Key? key,
  }) : super(key: key);
  final List<StoreOwner> storeOwners;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: storeOwners.length,
      itemBuilder: (context, index) {
        final storeOwner = storeOwners[index];
        return StoreOwnerListItemView(storeOwner: storeOwner);
      },
    );
  }
}
