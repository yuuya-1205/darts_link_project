import 'package:darts_link_project/banner_ad_view.dart';
import 'package:darts_link_project/models/home_page_tab_type.dart';
import 'package:darts_link_project/repositories/auth_repository.dart';
import 'package:darts_link_project/theme_data.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = AuthRepository.currentUser;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: HomePageTabType.values.length,
      child: Column(
        children: [
          const BannerAdView(),
          TabBar(
            indicatorColor: OriginalTheme.themeData.primaryColor,
            labelColor: OriginalTheme.themeData.primaryColor,
            unselectedLabelColor: OriginalTheme.themeData.disabledColor,
            labelStyle: const TextStyle(fontSize: 12),
            tabs: HomePageTabType.values
                .map((type) => Tab(text: type.title))
                .toList(),
          ),
          Expanded(
            child: TabBarView(
              children:
                  HomePageTabType.values.map((type) => type.view).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
