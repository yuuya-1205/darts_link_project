// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darts_link_project/components/header_image_url.dart';
import 'package:darts_link_project/components/input_field.dart';
import 'package:darts_link_project/components/original_button.dart';
import 'package:darts_link_project/models/city.dart';
import 'package:darts_link_project/models/house_tornament/house_tornament.dart';
import 'package:darts_link_project/models/pref.dart';
import 'package:darts_link_project/models/tag_type.dart';
import 'package:darts_link_project/repositories/area_repository.dart';
import 'package:darts_link_project/repositories/auth_repository.dart';
import 'package:darts_link_project/repositories/house_tornament/house_tornament_repository.dart';
import 'package:darts_link_project/theme_data.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:intl/intl.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class CreateHouseTornamentPage extends StatefulWidget {
  const CreateHouseTornamentPage({super.key});

  @override
  State<CreateHouseTornamentPage> createState() =>
      _CreateHouseTornamentPageState();
}

class _CreateHouseTornamentPageState extends State<CreateHouseTornamentPage> {
  final _formKey = GlobalKey<FormState>();
  final _houseTornamentTitleController = TextEditingController();
  final _placeController = TextEditingController();
  final _prefController = TextEditingController();
  final _cityController = TextEditingController();
  final _dateTimeController = TextEditingController();
  final _startTimeController = TextEditingController();
  final _finishTimeController = TextEditingController();
  final _houseTornamentDetailController = TextEditingController();

  Pref? _selectedPref;
  Pref? _initalPrefectureArea;
  City? _selectedCity;
  City? _initalCityArea;
  int _capacity = 0;

  List<Pref> prefs = [];
  dynamic dateTime;
  DateFormat dateFormat = DateFormat("yyyy年MM月dd日");
  DateFormat timeFormat = DateFormat("HH:mm");

  DateTime? _selectedDateAndTime;
  DateTime? _selectedStartTime;
  DateTime? _selectedFinishTime;
  Asset? _selectedHeaderImage;
  String _houseTornamentHeaderImageUrl = '';

  final List<String> _selectedFeatures = [];
  final List<String> _selectedDartsModels = [];
  final List<String> _selectedFormats = [];

  bool isApproved = false;
  bool isFinalTornament = false;

  @override
  void initState() {
    dateTime = DateTime.now();

    super.initState();
  }

  _datePicker(BuildContext context) async {
    final DateTime? datePicked = await showDatePicker(
        locale: const Locale("ja"),
        context: context,
        initialDate: dateTime,
        firstDate: DateTime(2003),
        lastDate: DateTime(2025));
    if (datePicked != null && datePicked != dateTime) {
      setState(() {
        _selectedDateAndTime = datePicked;
      });
    }
  }

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
          'ハウストーナメント作成',
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
              key: _formKey,
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
                            headerImageUrl: _houseTornamentHeaderImageUrl),
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
                          controller: _houseTornamentTitleController,
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
                          validator: (value) {
                            if (value!.isEmpty) {
                              return '都道府県を選択してください';
                            }
                            return null;
                          },
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
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'エリアを選択してください';
                            }
                            return null;
                          },
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
                        '機種',
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      ...DartsModelTagType.values
                          .map(
                            (e) => GestureDetector(
                              onTap: () {
                                if (_selectedDartsModels.contains(e.label)) {
                                  _selectedDartsModels.remove(e.label);
                                } else {
                                  _selectedDartsModels.add(e.label);
                                }

                                setState(() {});
                              },
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                decoration: BoxDecoration(
                                    color: _selectedDartsModels
                                            .contains(e.label)
                                        ? const Color.fromRGBO(227, 243, 255, 1)
                                        : const Color.fromRGBO(
                                            251, 251, 251, 1),
                                    border: Border.all(
                                      color:
                                          _selectedDartsModels.contains(e.label)
                                              ? const Color.fromRGBO(
                                                  78, 165, 229, 1)
                                              : const Color.fromRGBO(
                                                  217, 217, 217, 1),
                                    ),
                                    borderRadius: BorderRadius.circular(100)),
                                child: Center(
                                  child: Text(
                                    e.label,
                                    style: TextStyle(
                                      color:
                                          _selectedDartsModels.contains(e.label)
                                              ? const Color.fromRGBO(
                                                  78, 165, 229, 1)
                                              : const Color.fromRGBO(
                                                  217, 217, 217, 1),
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
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
                        icon: const Icon(
                          Icons.add_circle_outline,
                          size: 40,
                          color: Color.fromRGBO(247, 63, 150, 1),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Row(
                    children: [
                      const Text(
                        'フォー',
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      ...FormatTagType.values
                          .map(
                            (e) => GestureDetector(
                              onTap: () {
                                if (_selectedFormats.contains(e.label)) {
                                  _selectedFormats.remove(e.label);
                                } else {
                                  _selectedFormats.add(e.label);
                                }

                                setState(() {});
                              },
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                decoration: BoxDecoration(
                                    color: _selectedFormats.contains(e.label)
                                        ? const Color.fromRGBO(242, 246, 217, 1)
                                        : const Color.fromRGBO(
                                            251, 251, 251, 1),
                                    border: Border.all(
                                      color: _selectedFormats.contains(e.label)
                                          ? const Color.fromRGBO(
                                              189, 208, 66, 1)
                                          : const Color.fromRGBO(
                                              217, 217, 217, 1),
                                    ),
                                    borderRadius: BorderRadius.circular(100)),
                                child: Center(
                                  child: Text(
                                    e.label,
                                    style: TextStyle(
                                      color: _selectedFormats.contains(e.label)
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
                        '決勝トーナメント',
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
                        '開催日時',
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Flexible(
                        child: InputField(
                          readOnly: true,
                          controller: _dateTimeController,
                          hintText: '選択してください',
                          validator: (value) {
                            if (value!.isEmpty) {
                              return '開催日時を選択してください';
                            }
                            return null;
                          },
                          onTap: () {
                            _datePicker(context);
                            setState(() {
                              _dateTimeController.text = _selectedDateAndTime ==
                                      null
                                  ? '日付を選択'
                                  : dateFormat.format(_selectedDateAndTime!);
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Row(
                    children: [
                      const Text(
                        '開始時刻',
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Flexible(
                        child: InputField(
                          readOnly: true,
                          controller: _startTimeController,
                          hintText: '選択してください',
                          validator: (value) {
                            if (value!.isEmpty) {
                              return '開始時刻を選択してください';
                            }
                            return null;
                          },
                          onTap: () {
                            Picker(
                                adapter: DateTimePickerAdapter(
                                  minuteInterval: 15,
                                  type: PickerDateTimeType.kHM,
                                  value: _selectedStartTime,
                                  customColumnType: [3, 4],
                                ),
                                title: const Text('開始時刻を選択してください'),
                                onConfirm: (Picker picker, List value) {
                                  setState(() {
                                    print(value);
                                    _selectedStartTime = DateTime(
                                        dateTime.year,
                                        dateTime.month,
                                        dateTime.day,
                                        value[0],
                                        value[1] * 15);
                                    // valueはint型だけど文字列にしたい場合。
                                    _startTimeController.text =
                                        _selectedStartTime == null
                                            ? '開始時刻を選択してください'
                                            : timeFormat
                                                .format(_selectedStartTime!);
                                  });
                                }).showModal(context);
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Row(
                    children: [
                      const Text(
                        '終了時刻',
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Flexible(
                        child: InputField(
                          readOnly: true,
                          controller: _finishTimeController,
                          hintText: '選択してください',
                          validator: (value) {
                            if (value!.isEmpty) {
                              return '終了時刻を選択してください';
                            }
                            return null;
                          },
                          onTap: () {
                            Picker(
                                adapter: DateTimePickerAdapter(
                                  minuteInterval: 15,
                                  type: PickerDateTimeType.kHM,
                                  value: _selectedStartTime,
                                  customColumnType: [3, 4],
                                ),
                                title: const Text('終了時刻を選択してください'),
                                onConfirm: (Picker picker, List value) {
                                  setState(() {
                                    _selectedFinishTime = DateTime(
                                        dateTime.year,
                                        dateTime.month,
                                        dateTime.day,
                                        value[0],
                                        value[1] * 15);
                                    // valueはint型だけど文字列にしたい場合。
                                    _finishTimeController.text =
                                        _selectedFinishTime == null
                                            ? '開始時刻を選択してください'
                                            : timeFormat
                                                .format(_selectedFinishTime!);
                                  });
                                }).showModal(context);
                          },
                        ),
                      ),
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
                        '詳細内容',
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(
                        width: 18,
                      ),
                      Flexible(
                        child: InputField(
                          controller: _houseTornamentDetailController,
                          hintText: '入力してください',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  OriginalButton(
                    primary: OriginalTheme.themeData.primaryColor,
                    text: '作成する',
                    onPressed: () async {
                      if (!_formKey.currentState!.validate()) {
                        return;
                      }
                      final user = AuthRepository.currentUser;

                      final houseTornamentTitle =
                          _houseTornamentTitleController.text;
                      final place = _placeController.text;
                      final houseTornamentDetail =
                          _houseTornamentDetailController.text;
                      final houseTornament = HouseTornament(
                        houseTornamentId: '',
                        title: houseTornamentTitle,
                        place: place,
                        ownerId: user!.id,
                        createrName: user.userName,
                        createrImage: user.userImage,
                        createdAt: Timestamp.now(),
                        updatedAt: Timestamp.now(),
                        formats: _selectedFormats,
                        features: _selectedFeatures,
                        isApproved: isApproved,
                        userId: user.userId,
                        followerCount: user.followerCount,
                        followingCount: user.followingCount,
                        capacity: _capacity,
                        detail: houseTornamentDetail,
                        dateTime: Timestamp.fromDate(_selectedDateAndTime!),
                        startTime: Timestamp.fromDate(_selectedStartTime!),
                        finishTime: Timestamp.fromDate(_selectedFinishTime!),
                        uid: '',
                      );
                      await HouseTournamentRepository.createHouseTournament(
                          houseTornament);

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
