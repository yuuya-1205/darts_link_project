import 'package:darts_link_project/models/search_tab_type.dart';
import 'package:darts_link_project/theme_data.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _searchTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: SearchTabType.values.length,
      child: Scaffold(
        body: Column(
          children: [
            TextField(
              controller: _searchTextController,
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(45)),
                hintText: 'キーワード検索',
                fillColor: Colors.white,
                filled: true,
                isDense: true,
                contentPadding: const EdgeInsets.all(1),
              ),
              onSubmitted: (value) {
                setState(() {});
              },
            ),
            //const BannerAdView(),
            TabBar(
                indicatorColor: OriginalTheme.themeData.primaryColor,
                labelColor: OriginalTheme.themeData.primaryColor,
                unselectedLabelColor: OriginalTheme.themeData.disabledColor,
                labelStyle: const TextStyle(fontSize: 12),
                tabs: SearchTabType.values
                    .map((tabType) => Tab(
                          text: tabType.label,
                        ))
                    .toList()),
            const Divider(height: 0),
            Expanded(
              child: TabBarView(
                  children: SearchTabType.getViews(_searchTextController.text)),
            ),
          ],
        ),
      ),
    );
  }
}
