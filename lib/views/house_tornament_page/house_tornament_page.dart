import 'package:darts_link_project/models/app_user.dart';
import 'package:darts_link_project/repositories/app_user_repository.dart';
import 'package:darts_link_project/repositories/auth_repository.dart';
import 'package:darts_link_project/theme_data.dart';
import 'package:darts_link_project/views/house_tornament_page/create_house_tornament_page.dart';
import 'package:flutter/material.dart';

class HouseTornamentPage extends StatefulWidget {
  const HouseTornamentPage({Key? key}) : super(key: key);

  @override
  State<HouseTornamentPage> createState() => _HouseTornamentPageState();
}

class _HouseTornamentPageState extends State<HouseTornamentPage> {
  @override
  Widget build(BuildContext context) {
    final user = AuthRepository.currentUser;
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
          children: [],
        )),
        floatingActionButton: user is StoreOwner
            ? FloatingActionButton(
                backgroundColor: OriginalTheme.themeData.primaryColor,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => CreateHouseTornamentPage()),
                    ),
                  );
                },
                child: const Icon(
                  Icons.add,
                ),
              )
            : Container());
  }
}
