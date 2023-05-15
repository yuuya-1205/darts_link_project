import 'package:darts_link_project/views/components/original_app_bar/original_app_bar.dart';
import 'package:flutter/material.dart';

class CircleListPage extends StatefulWidget {
  const CircleListPage({super.key});

  @override
  State<CircleListPage> createState() => _CircleListPageState();
}

class _CircleListPageState extends State<CircleListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const OriginalAppBer(),
      body: Column(
        children: const [],
      ),
    );
  }
}
