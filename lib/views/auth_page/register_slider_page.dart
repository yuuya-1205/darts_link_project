import 'package:carousel_slider/carousel_slider.dart';
import 'package:darts_link_project/components/back_ground_image.dart';
import 'package:darts_link_project/views/auth_page/regist_person_page.dart';
import 'package:flutter/material.dart';

class RegisterSliderPage extends StatefulWidget {
  const RegisterSliderPage({Key? key}) : super(key: key);

  @override
  State<RegisterSliderPage> createState() => _RegisterSliderPageState();
}

class _RegisterSliderPageState extends State<RegisterSliderPage> {
  List<String> imageList = [
    'assets/images/register_slider_1.png',
    'assets/images/register_slider_2.png',
    'assets/images/register_slider_3.png',
    '',
  ];
  List<String> textList = [
    "　　『対戦相手募集』の掲示板が、\n今すぐダーツを一緒に楽しめる仲間との\n　　　　　　出会いをお手伝い！",
    "　　近隣エリアのイベントを発見したり、\n　　　　ダーツの情報を共有使用！\n　　　気の合う仲間が必ず見つかるはず！",
    "　　ダーツバーが主催するハウストーナメントを\n簡単に検索！申し込みダーツリンクで完結できます！",
    ''
  ];

  int _current = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        const BackGroundImage(),
        SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: CarouselSlider(
            options: CarouselOptions(
              height: double.infinity,
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                if (index == 3) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => const RegistPersonPage()),
                    ),
                  );
                  return;
                }
                setState(() {
                  _current = index;
                });
              },
            ),
            items: imageList
                .map((item) => Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 300,
                          child: Image.asset(
                            imageList[_current],
                            fit: BoxFit.cover,
                          ),
                        ),
                        Text(textList[_current]),
                      ],
                    ))
                .toList(),
          ),
        ),
      ]),
    );
  }
}
