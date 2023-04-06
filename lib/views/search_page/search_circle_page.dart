import 'package:darts_link_project/models/circle/circle.dart';
import 'package:darts_link_project/repositories/circle/circle_repository.dart';
import 'package:darts_link_project/views/components/circle/circle_list_view.dart';
import 'package:darts_link_project/views/components/loading_view.dart';
import 'package:flutter/material.dart';

class SearchCirclePage extends StatefulWidget {
  const SearchCirclePage({required this.searchWord, Key? key})
      : super(key: key);
  final String searchWord;

  @override
  State<SearchCirclePage> createState() => _SearchCirclePageState();
}

class _SearchCirclePageState extends State<SearchCirclePage> {
  List<Circle> _circles = [];
  bool isLoading = true;

  void setLoading(bool value) => setState(() => isLoading = value);

  @override
  void initState() {
    super.initState();
    if (widget.searchWord.isEmpty) {
      return;
    }
    Future(() async {
      final result =
          await CircleRepository.fetchSearchedCircles(widget.searchWord);
      setState(() {
        _circles = result;
        setLoading(false);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.searchWord.isEmpty) {
      return const Center(child: Text('検索キーワードを入力してください。'));
    }
    if (isLoading) {
      return const LoadingView();
    }
    if (_circles.isEmpty) {
      return const Center(child: Text('検索結果がありません'));
    }

    return CircleListView(circles: _circles);
  }
}
