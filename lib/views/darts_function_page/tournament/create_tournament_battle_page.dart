import 'package:darts_link_project/models/button_color_type.dart';
import 'package:darts_link_project/utils/const.dart';
import 'package:darts_link_project/views/components/app_bar_back_view.dart';
import 'package:darts_link_project/views/components/original_button.dart';
import 'package:darts_link_project/views/darts_function_page/tournament/tornament_bracket_page.dart';
import 'package:flutter/material.dart';

class CreateTournamentBattlePage extends StatefulWidget {
  const CreateTournamentBattlePage({Key? key}) : super(key: key);

  @override
  State<CreateTournamentBattlePage> createState() =>
      _CreateTournamentBattlePageState();
}

class _CreateTournamentBattlePageState
    extends State<CreateTournamentBattlePage> {
  List<TextEditingController> controllers = [
    TextEditingController(text: 'Aチーム'),
    TextEditingController(text: 'Bチーム'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 76,
        leading: const AppBarBackView(),
        title: const Text('トーナメント戦'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                children: [
                  const SizedBox(width: 12),
                  const Text('参加チーム'),
                  const Spacer(),
                  Text('${controllers.length}組'),
                  const SizedBox(width: 12),
                ],
              ),
            ),
            const Divider(height: 0),
            ...controllers
                .map(
                  (controller) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      children: [
                        const SizedBox(width: 12),
                        const SizedBox(width: 80, child: Text('チーム名')),
                        Flexible(
                          child: TextFormField(
                            controller: controller,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(12),
                              border: OutlineInputBorder(),
                              hintText: '入力してください',
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                      ],
                    ),
                  ),
                )
                .toList(),
            const Divider(height: 0),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [
                  OriginalButton(
                    colorType: ButtonColorType.white,
                    text: 'チームを追加する',
                    onPressed: () => setState(() {
                      controllers.add(TextEditingController(
                          text: '${alphabetList[controllers.length]}チーム'));
                    }),
                  ),
                  const SizedBox(height: 8),
                  if (controllers.length > 2) ...[
                    OriginalButton(
                      colorType: ButtonColorType.white,
                      text: 'チームを削除する',
                      onPressed: () => setState(() {
                        controllers.removeLast();
                      }),
                    ),
                    const SizedBox(height: 8),
                  ],
                  OriginalButton(
                    text: '作成する',
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => TournamentBracketPage(
                                teamName:
                                    controllers.map((e) => e.text).toList(),
                              )),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
