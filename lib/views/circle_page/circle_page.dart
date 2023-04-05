import 'dart:async';

import 'package:darts_link_project/components/sort_box/area_box.dart';
import 'package:darts_link_project/components/sort_box/feature_box.dart';
import 'package:darts_link_project/components/sort_box/recruit_box.dart';
import 'package:darts_link_project/models/circle/circle.dart';
import 'package:darts_link_project/repositories/circle/circle_repository.dart';
import 'package:darts_link_project/theme_data.dart';
import 'package:darts_link_project/views/circle_page/components/circle_card_page.dart';
import 'package:darts_link_project/views/circle_page/create_circle_page.dart';
import 'package:flutter/material.dart';

class CirclePage extends StatefulWidget {
  const CirclePage({Key? key}) : super(key: key);

  @override
  State<CirclePage> createState() => _CirclePageState();
}

class _CirclePageState extends State<CirclePage> {
  final circleCountController = StreamController<int>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const AreaBox(),
                const FeatureBox(),
                const RecruitBox(),
              ],
            ),
            const SizedBox(height: 20),
            StreamBuilder<List<Circle>>(
                stream: CircleRepository.circleStream(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState != ConnectionState.active) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (!snapshot.hasData) {
                    return Container();
                  }
                  final circles = snapshot.data;
                  if (circles!.isEmpty) {
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
                              '募集中のサークル数',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const Spacer(),
                            Text(
                              '${circles.length}',
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
                      const SizedBox(height: 20),
                      ListView.builder(
                          shrinkWrap: true,
                          itemCount: circles.length,
                          itemBuilder: (context, index) {
                            final circle = circles[index];
                            return Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                              child: CircleCardPage(circle: circle),
                            );
                          }),
                    ],
                  );
                })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: OriginalTheme.themeData.primaryColor,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: ((context) => const CreateCirclePage()),
            ),
          );
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
