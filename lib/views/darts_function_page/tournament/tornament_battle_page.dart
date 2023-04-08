import 'package:darts_link_project/views/components/app_bar_back_view.dart';
import 'package:darts_link_project/views/components/vertical_text.dart';
import 'package:flutter/material.dart';

class TournamentBattlePage extends StatelessWidget {
  const TournamentBattlePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 76,
        leading: const AppBarBackView(),
        title: const Text('トーナメント表'),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 100),
            const Text('Winner'),
            Container(
              height: 50,
              width: 1,
              color: Colors.black,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 100,
                      height: 1,
                      color: Colors.black,
                    ),
                    Container(
                      height: 50,
                      width: 1,
                      color: Colors.black,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width: 100,
                      height: 1,
                      color: Colors.black,
                    ),
                    Container(
                      height: 50,
                      width: 1,
                      color: Colors.black,
                    ),
                  ],
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 50,
                          height: 1,
                          color: Colors.black,
                        ),
                        Container(
                          height: 50,
                          width: 1,
                          color: Colors.black,
                        ),
                        const VerticalText('Aチーム'),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          width: 50,
                          height: 1,
                          color: Colors.black,
                        ),
                        Container(
                          height: 50,
                          width: 1,
                          color: Colors.black,
                        ),
                        const VerticalText('Bチーム'),
                      ],
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 50,
                          height: 1,
                          color: Colors.black,
                        ),
                        Container(
                          height: 50,
                          width: 1,
                          color: Colors.black,
                        ),
                        const VerticalText('Cチーム'),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          width: 50,
                          height: 1,
                          color: Colors.black,
                        ),
                        Container(
                          height: 50,
                          width: 1,
                          color: Colors.black,
                        ),
                        const VerticalText('Dチーム'),
                      ],
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
