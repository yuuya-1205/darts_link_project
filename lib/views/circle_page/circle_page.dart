import 'dart:async';

import 'package:darts_link_project/models/circle/circle.dart';
import 'package:darts_link_project/models/sort_state.dart';
import 'package:darts_link_project/models/sort_type.dart';
import 'package:darts_link_project/repositories/circle/circle_repository.dart';
import 'package:darts_link_project/theme_data.dart';
import 'package:darts_link_project/views/circle_page/create_circle_page.dart';
import 'package:darts_link_project/views/components/circle/circle_list_view.dart';
import 'package:flutter/material.dart';

import '../home_page/components/sort_box.dart';
import '../sort_page/sort_circle_select_page.dart';

class CirclePage extends StatefulWidget {
  const CirclePage({Key? key}) : super(key: key);

  @override
  State<CirclePage> createState() => _CirclePageState();
}

class _CirclePageState extends State<CirclePage> {
  SortState? sortState;

  Future<void> navigateSortPage() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const SortCircleSelectPage()),
    ) as SortState?;
    setState(() {
      sortState = result;
    });
  }

  List<Circle> sortCircle(List<Circle> circles) {
    if (sortState == null) return circles;
    if (sortState!.pref != null) {
      circles = circles.where((element) {
        return element.prefecture == sortState!.pref;
      }).toList();
    }
    if (sortState!.city != null) {
      circles = circles.where((element) {
        return element.city == sortState!.city;
      }).toList();
    }
    if (sortState!.features != null) {
      circles = circles.where((circle) {
        var isContains = true;
        for (var element in sortState!.features!) {
          isContains = circle.features.contains(element);
          if (!isContains) {
            break;
          }
        }
        return isContains;
      }).toList();
    }
    if (sortState!.isRecruitment) {
      circles = circles.where((element) {
        return element.capacity > element.numberOfParticipants;
      }).toList();
    }
    return circles;
  }

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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SortBox(sortType: SortType.area, onTap: navigateSortPage),
                const SizedBox(width: 16),
                SortBox(sortType: SortType.feature, onTap: navigateSortPage),
                const SizedBox(width: 16),
                SortBox(sortType: SortType.isOpen, onTap: navigateSortPage),
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
                              '${sortCircle(circles).length}',
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
                      CircleListView(circles: sortCircle(circles)),
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
