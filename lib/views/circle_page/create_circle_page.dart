// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darts_link_project/components/header_image_url.dart';
import 'package:darts_link_project/components/input_field.dart';
import 'package:darts_link_project/components/original_button.dart';
import 'package:darts_link_project/models/circle/circle.dart';
import 'package:darts_link_project/models/city.dart';
import 'package:darts_link_project/models/pref.dart';
import 'package:darts_link_project/models/thread.dart';
import 'package:darts_link_project/repositories/area_repository.dart';
import 'package:darts_link_project/repositories/auth_repository.dart';
import 'package:darts_link_project/repositories/circle/circle_repository.dart';
import 'package:darts_link_project/repositories/storage_repository.dart';
import 'package:darts_link_project/repositories/thread_repository.dart';
import 'package:darts_link_project/theme_data.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

import '../../models/tag_type.dart';

class CreateCirclePage extends StatefulWidget {
  const CreateCirclePage({Key? key}) : super(key: key);

  @override
  State<CreateCirclePage> createState() => _CreateCirclePageState();
}

class _CreateCirclePageState extends State<CreateCirclePage> {
  final user = AuthRepository.currentUser;
  final _formKey = GlobalKey<FormState>();
  final _circleNameController = TextEditingController();
  final _placeController = TextEditingController();
  final _prefController = TextEditingController();
  final _cityController = TextEditingController();
  final _circleDetailController = TextEditingController();

  Pref? _selectedPref;
  Pref? _initalPrefectureArea;
  City? _selectedCity;
  City? _initalCityArea;
  int _capacity = 0;

  List<Pref> prefs = [];
  dynamic dateTime;
  DateFormat dateFormat = DateFormat("yyyy年MM月dd日");
  DateFormat timeFormat = DateFormat("HH:mm");

  final List<String> _selectedFeatures = [];
  String _currentHeaderImageUrl = '';
  Asset? _selectedHeaderImage;

  bool isApproved = false;

  @override
  void initState() {
    dateTime = DateTime.now();

    super.initState();
  }

  // _datePicker(BuildContext context) async {
  //   final DateTime? datePicked = await showDatePicker(
  //       locale: const Locale("ja"),
  //       context: context,
  //       initialDate: dateTime,
  //       firstDate: DateTime(2003),
  //       lastDate: DateTime(2025));
  //   if (datePicked != null && datePicked != dateTime) {
  //     setState(() {
  //       _selectedDateAndTime = datePicked;
  //     });
  //   }
  // }

  void _incrementCounter() {
    setState(() {
      _capacity++;
    });
  }

  void _decrementCounter() {
    if (_capacity > 0) {
      setState(() {
        _capacity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Color.fromRGBO(247, 63, 150, 1),
        ),
        leadingWidth: 76,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Row(children: [
            Container(
              width: 30,
              child: const BackButton(),
            ),
            const Text(
              '戻る',
              style: TextStyle(
                color: Color.fromRGBO(247, 63, 150, 1),
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ]),
        ),
        backgroundColor: Colors.white,
        title: const Text(
          'サークル作成ページ',
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: GestureDetector(
                onTap: () {},
                child: const Text(
                  'クリア',
                  style: TextStyle(
                    color: Color.fromRGBO(247, 63, 150, 1),
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Form(
              child: Column(
                children: [
                  DottedBorder(
                    dashPattern: const [6.0],
                    strokeWidth: 2.0,
                    color: const Color.fromRGBO(247, 63, 150, 1),
                    child: SizedBox(
                      height: 205,
                      width: double.infinity,
                      child: InkWell(
                        child: HeaderImageUrl(
                            asset: _selectedHeaderImage,
                            headerImageUrl: _currentHeaderImageUrl),
                        onTap: () async {
                          final headerfiles = await MultiImagePicker.pickImages(
                            maxImages: 1,
                            enableCamera: true,
                          );
                          if (headerfiles != null) {
                            setState(() {
                              _selectedHeaderImage = headerfiles.first;
                            });
                          }
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  Row(
                    children: [
                      const Text(
                        'タイトル',
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(
                        width: 18,
                      ),
                      Flexible(
                        child: InputField(
                          controller: _circleNameController,
                          hintText: '入力してください',
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'タイトルを入力してください';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  Row(
                    children: [
                      const Text(
                        '場所',
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      Flexible(
                        child: InputField(
                          controller: _placeController,
                          hintText: '入力してください',
                          validator: (value) {
                            if (value!.isEmpty) {
                              return '場所を入力してください';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  Row(
                    children: [
                      const Text('都道府県'),
                      const SizedBox(
                        width: 30,
                      ),
                      Flexible(
                        child: InputField(
                          readOnly: true,
                          controller: _prefController,
                          hintText: '選択してください',
                          onTap: () async {
                            final prefs = await AreaRepository.getPrefsData();
                            showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 2,
                                  child: Column(children: [
                                    Row(
                                      children: [
                                        CupertinoButton(
                                          child: const Text('もどる'),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                        CupertinoButton(
                                          child: const Text('決定'),
                                          onPressed: () {
                                            Navigator.pop(context);
                                            setState(() {
                                              _initalPrefectureArea =
                                                  _selectedPref;
                                              _prefController.text =
                                                  _initalPrefectureArea?.name ??
                                                      '未登録';
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: double.infinity,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              3,
                                      child: CupertinoPicker(
                                        itemExtent: 40,
                                        children: prefs
                                            .map((e) => Text(e.name))
                                            .toList(),
                                        onSelectedItemChanged: (int index) {
                                          setState(() {
                                            _selectedPref = prefs[index];
                                          });
                                        },
                                      ),
                                    )
                                  ]),
                                );
                              },
                            );
                          },
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Row(
                    children: [
                      const Text('エリア'),
                      const SizedBox(
                        width: 40,
                      ),
                      Flexible(
                        child: InputField(
                          controller: _cityController,
                          hintText: '選択してください',
                          readOnly: true,
                          onTap: () async {
                            if (_initalPrefectureArea == null) {
                              return;
                            }
                            final citys = await AreaRepository.getCitysData(
                                _initalPrefectureArea!.code.toString());
                            showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 2,
                                  child: Column(children: [
                                    Row(
                                      children: [
                                        CupertinoButton(
                                          child: const Text('もどる'),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                        CupertinoButton(
                                          child: const Text('決定'),
                                          onPressed: () {
                                            Navigator.pop(context);
                                            setState(() {
                                              _initalCityArea = _selectedCity;
                                              _cityController.text =
                                                  _initalCityArea?.name ??
                                                      '未登録';
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: double.infinity,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              3,
                                      child: CupertinoPicker(
                                        itemExtent: 40,
                                        children: citys
                                            .map((e) => Text(e.name))
                                            .toList(),
                                        onSelectedItemChanged: (int index) {
                                          _selectedCity = citys[index];
                                        },
                                      ),
                                    )
                                  ]),
                                );
                              },
                            );
                          },
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Row(
                    children: [
                      const Text(
                        '承認制',
                        style: TextStyle(fontSize: 16),
                      ),
                      const Spacer(),
                      CupertinoSwitch(
                        value: isApproved,
                        onChanged: (newValue) {
                          setState(() {
                            isApproved = newValue;
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Row(
                    children: [
                      const Text(
                        '特徴',
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      ...FeatureTagType.values
                          .map(
                            (e) => GestureDetector(
                              onTap: () {
                                if (_selectedFeatures.contains(e.label)) {
                                  _selectedFeatures.remove(e.label);
                                } else {
                                  _selectedFeatures.add(e.label);
                                }

                                setState(() {});
                              },
                              child: Wrap(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    decoration: BoxDecoration(
                                        color:
                                            _selectedFeatures.contains(e.label)
                                                ? const Color.fromRGBO(
                                                    242, 246, 217, 1)
                                                : const Color.fromRGBO(
                                                    251, 251, 251, 1),
                                        border: Border.all(
                                          color: _selectedFeatures
                                                  .contains(e.label)
                                              ? const Color.fromRGBO(
                                                  189, 208, 66, 1)
                                              : const Color.fromRGBO(
                                                  217, 217, 217, 1),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    child: Center(
                                      child: Text(
                                        e.label,
                                        style: TextStyle(
                                          color: _selectedFeatures
                                                  .contains(e.label)
                                              ? const Color.fromRGBO(
                                                  189, 208, 66, 1)
                                              : const Color.fromRGBO(
                                                  217, 217, 217, 1),
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                          .toList(),
                    ],
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Row(
                    children: [
                      const Text(
                        '定員',
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      IconButton(
                        onPressed: _capacity <= 0
                            ? null
                            : () {
                                _decrementCounter();
                              },
                        icon: const Icon(
                          Icons.remove_circle_outline,
                          size: 40,
                        ),
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      Text(
                        '$_capacity',
                        style: const TextStyle(fontSize: 32),
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      IconButton(
                        onPressed: () {
                          _incrementCounter();
                        },
                        icon: const Icon(Icons.add_circle_outline,
                            size: 40, color: Color.fromRGBO(247, 63, 150, 1)),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Row(
                    children: [
                      const Text(
                        '募集内容',
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(
                        width: 18,
                      ),
                      Flexible(
                        child: InputField(
                          controller: _circleDetailController,
                          hintText: '入力してください',
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'タイトルを入力してください';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  OriginalButton(
                    primary: OriginalTheme.themeData.primaryColor,
                    text: '作成する',
                    onPressed: () async {
                      final user = AuthRepository.currentUser;
                      final circleName = _circleNameController.text;
                      final place = _placeController.text;
                      final circleDetail = _circleDetailController.text;

                      String? headerImageUrl;
                      if (_selectedHeaderImage != null) {
                        final path = 'headers/${user!.id}/header.jpeg';
                        _currentHeaderImageUrl = await StorageRepository()
                            .saveimage(
                                asset: _selectedHeaderImage!, path: path);
                      }

                      final circle = Circle(
                        prefecture: _initalPrefectureArea,
                        city: _initalCityArea,
                        circleId: '',
                        headerImage: _currentHeaderImageUrl,
                        circleName: circleName,
                        place: place,
                        ownerId: user!.id,
                        createrName: user.userName,
                        createrImage: user.userImage,
                        createdAt: Timestamp.now(),
                        updatedAt: Timestamp.now(),
                        features: _selectedFeatures,
                        numberOfParticipants: 0,
                        isApproved: isApproved,
                        circleDetail: circleDetail,
                        userId: user.userId,
                        followerCount: user.followerCount,
                        followingCount: user.followingCount,
                        capacity: _capacity,
                      );

                      final circleId =
                          await CircleRepository.createCircle(circle);

                      final thread = Thread(
                        unReadCount: {circle.ownerId: 0},
                        id: circleId,
                        uids: [
                          circle.ownerId,
                        ],
                        createdAt: Timestamp.now(),
                        isReading: false,
                        updatedAt: Timestamp.now(),
                        memberDetails: {
                          circle.ownerId: {
                            'name': circle.createrName,
                            'imageUrl': circle.createrImage,
                          }
                        },
                      );
                      await ThreadRepository.createThread(thread);

                      // ignore: use_build_context_synchronously
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
