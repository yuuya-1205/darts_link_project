import 'package:darts_link_project/models/app_user.dart';
import 'package:darts_link_project/repositories/auth_repository.dart';
import 'package:darts_link_project/repositories/person_repository.dart';
import 'package:darts_link_project/theme_data.dart';
import 'package:flutter/material.dart';

class MyInfoPage extends StatefulWidget {
  const MyInfoPage({Key? key}) : super(key: key);

  @override
  State<MyInfoPage> createState() => _MyInfoPageState();
}

class _MyInfoPageState extends State<MyInfoPage> {
  final user = AuthRepository.currentUser;
  @override
  Widget build(BuildContext context) {
    if (user == null) {
      throw Exception('ユーザーが存在しません');
    }

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
            child: Text(
              'プロフィール詳細',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Container(
              decoration: BoxDecoration(
                color: OriginalTheme.themeData.dividerColor,
                borderRadius: BorderRadius.circular(8),
              ),
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Wrap(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(user!.selfIntroduction),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: OriginalTheme.themeData.disabledColor),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: FutureBuilder<Person?>(
                  future: PersonRepository.fetchPerson(user!.id),
                  builder: (context, snapshot) {
                    if (snapshot.data == null) {
                      return Container();
                    }
                    final person = snapshot.data;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('レーティング'),
                        Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 16),
                              child: Text('ダーツライブ'),
                            ),
                            const Spacer(),
                            Text('Rt:${person!.phoenixRating}'),
                          ],
                        ),
                        Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 16),
                              child: Text('フェニックス'),
                            ),
                            const Spacer(),
                            Text('Rt:${person.dartsLiveRating}'),
                          ],
                        ),
                        Container(
                            height: 1,
                            width: double.infinity,
                            color: OriginalTheme.themeData.disabledColor),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                              child: Text(
                                'タグ',
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Wrap(
                                children: user!.tag
                                    .map((e) => Container(
                                          margin: const EdgeInsets.fromLTRB(
                                              0, 0, 8, 0),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8),
                                          decoration: BoxDecoration(
                                              color: const Color.fromRGBO(
                                                  242, 246, 217, 1),
                                              border: Border.all(
                                                color: const Color.fromRGBO(
                                                    189, 208, 66, 1),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(100)),
                                          child: Text(
                                            e,
                                            style: const TextStyle(
                                              color: Color.fromRGBO(
                                                  189, 208, 66, 1),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ))
                                    .toList()),
                          ],
                        )
                      ],
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
