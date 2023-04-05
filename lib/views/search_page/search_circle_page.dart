import 'package:darts_link_project/models/circle/circle.dart';
import 'package:darts_link_project/repositories/circle/circle_repository.dart';
import 'package:darts_link_project/views/components/circle/circle_list_view.dart';
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

  @override
  void initState() {
    super.initState();
    if (widget.searchWord.isEmpty) {
      return;
    }
    Future(() async {
      final result =
          await CircleRepository.fetchCirclesByCircleName(widget.searchWord);
      setState(() {
        _circles = result;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_circles.isEmpty) {
      return const Center(child: Text('検索結果がありません'));
    }

    return CircleListView(circles: _circles);
  }
}
