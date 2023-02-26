import 'package:darts_link_project/components/sort_box/area_box.dart';
import 'package:darts_link_project/models/app_user.dart';
import 'package:darts_link_project/repositories/store_owner_repository.dart';
import 'package:darts_link_project/theme_data.dart';
import 'package:darts_link_project/views/darts_bar_page/darts_bar_card.dart';
import 'package:flutter/material.dart';

class DartsBarPage extends StatefulWidget {
  const DartsBarPage({Key? key}) : super(key: key);

  @override
  State<DartsBarPage> createState() => _DartsBarPageState();
}

class _DartsBarPageState extends State<DartsBarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: AreaBox(),
              ),
            ],
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
                            '${storeOwners.length}',
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
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: storeOwners.length,
                          itemBuilder: (context, index) {
                            final storeOwner = storeOwners[index];
                            return DartsBarCard(
                              storeOwner: storeOwner,
                            );
                          }),
                    ),
                  ],
                );
              })
        ],
      )),
    );
  }
}
