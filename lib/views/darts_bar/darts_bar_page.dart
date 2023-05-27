import 'package:darts_link_project/models/app_user.dart';
import 'package:darts_link_project/models/sort_state.dart';
import 'package:darts_link_project/models/sort_type.dart';
import 'package:darts_link_project/repositories/store_owner_repository.dart';
import 'package:darts_link_project/theme_data.dart';
import 'package:darts_link_project/views/components/store_owner/store_owner_list_view.dart';
import 'package:darts_link_project/views/home_page/components/sort_box.dart';
import 'package:flutter/material.dart';

import '../sort_page/sort_store_owner_select_page.dart';

class DartsBarPage extends StatefulWidget {
  const DartsBarPage({Key? key}) : super(key: key);

  @override
  State<DartsBarPage> createState() => _DartsBarPageState();
}

class _DartsBarPageState extends State<DartsBarPage> {
  SortState? sortState;

  Future<void> navigateSortPage() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const SortStoreOwnerSelectPage()),
    ) as SortState?;
    setState(() {
      sortState = result;
    });
  }

  List<StoreOwner> sortStoreOwner(List<StoreOwner> storeOwners) {
    if (sortState == null) return storeOwners;
    if (sortState!.pref != null) {
      storeOwners = storeOwners.where((element) {
        return element.prefecture == sortState!.pref;
      }).toList();
    }
    if (sortState!.city != null) {
      storeOwners = storeOwners.where((element) {
        return element.city == sortState!.city;
      }).toList();
    }
    return storeOwners;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: SortBox(sortType: SortType.area, onTap: navigateSortPage),
            ),
            StreamBuilder<List<StoreOwner>>(
              stream: StoreOwnerRepository.storeOwnerStream(),
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
                    child: Text('まだ、投稿がありません'),
                  );
                }
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 17),
                      child: Row(
                        children: [
                          const Text(
                            '掲載中のダーツバー',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          Text(
                            '${sortStoreOwner(storeOwners).length}',
                            style: TextStyle(
                                fontSize: 25,
                                color: OriginalTheme.themeData.primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '件',
                            style: TextStyle(
                              fontSize: 18,
                              color: OriginalTheme.themeData.disabledColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: StoreOwnerListView(
                          storeOwners: sortStoreOwner(storeOwners)),
                    ),
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
