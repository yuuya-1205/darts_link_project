import 'package:carousel_slider/carousel_slider.dart';
import 'package:darts_link_project/components/back_ground_image.dart';
import 'package:darts_link_project/views/auth_page/regist_store_owner_page.dart';
import 'package:flutter/material.dart';

class StoreSliderPage extends StatefulWidget {
  const StoreSliderPage({Key? key}) : super(key: key);

  @override
  State<StoreSliderPage> createState() => _StoreSliderPageState();
}

class _StoreSliderPageState extends State<StoreSliderPage> {
  List<String> imageList = [
    'assets/images/store_slider_1.png',
    'assets/images/store_slider_2.png',
    'assets/images/store_slider_3.png',
    '',
  ];
  List<String> textList = ["a", "b", 'c', ''];

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
                      builder: ((context) => const RegistStoreOwnerPage()),
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
