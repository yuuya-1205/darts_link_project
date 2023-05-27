import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darts_link_project/components/input_field.dart';
import 'package:darts_link_project/components/original_button.dart';
import 'package:darts_link_project/models/battle_room.dart';
import 'package:darts_link_project/models/city.dart';
import 'package:darts_link_project/models/pref.dart';
import 'package:darts_link_project/models/tag_type.dart';
import 'package:darts_link_project/repositories/area_repository.dart';
import 'package:darts_link_project/repositories/auth_repository.dart';
import 'package:darts_link_project/repositories/battle_room/battle_room_repository.dart';
import 'package:darts_link_project/theme_data.dart';
import 'package:darts_link_project/views/components/original_app_bar/original_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:intl/intl.dart';

class EditBattleRoomPage extends StatefulWidget {
  const EditBattleRoomPage({Key? key, required this.battleRoom})
      : super(key: key);

  final BattleRoom battleRoom;

  @override
  State<EditBattleRoomPage> createState() => _EditBattleRoomPageState();
}

class _EditBattleRoomPageState extends State<EditBattleRoomPage> {
  final _titleController = TextEditingController();
  final _placeController = TextEditingController();
  final _prefController = TextEditingController();
  final _cityController = TextEditingController();
  final _dateTimeController = TextEditingController();
  final _startTimeController = TextEditingController();
  final _finishTimeController = TextEditingController();
  final _detailController = TextEditingController();

  Pref? _selectedPref;
  Pref? _initialPrefectureArea;
  City? _selectedCity;
  City? _initialCityArea;
  int _capacity = 0;

  List<Pref> prefs = [];
  dynamic dateTime;
  DateFormat dateFormat = DateFormat("yyyy年MM月dd日");
  DateFormat timeFormat = DateFormat("HH:mm");

  DateTime? _selectedDateAndTime;
  DateTime? _selectedStartTime;
  DateTime? _selectedFinishTime;

  List<String> _selectedFeatures = [];
  List<String> _selectedDartsModels = [];

  bool isApproval = false;

  @override
  void initState() {
    _getBattleRoomPage();
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
      appBar: OriginalAppBer(
        title: '対戦者募集編集ページ',
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
                          controller: _titleController,
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
                        child: TextFormField(
                          controller: _placeController,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(12),
                            border: OutlineInputBorder(),
                            hintText: '入力してください',
                          ),
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
                            final prefs = AreaRepository.prefList;
                            // ignore: use_build_context_synchronously
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
                                              _initialPrefectureArea =
                                                  _selectedPref;
                                              _prefController.text =
                                                  _initialPrefectureArea
                                                          ?.name ??
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
                            if (_initialPrefectureArea == null) {
                              return;
                            }
                            final cities = AreaRepository
                                .cityMap[_initialPrefectureArea!.code]!;
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
                                              _initialCityArea = _selectedCity;
                                              _cityController.text =
                                                  _initialCityArea?.name ??
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
                                        children: cities
                                            .map((e) => Text(e.name))
                                            .toList(),
                                        onSelectedItemChanged: (int index) {
                                          _selectedCity = cities[index];
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
                        value: isApproval,
                        onChanged: (newValue) {
                          setState(() {
                            isApproval = newValue;
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
                          controller: _detailController,
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
                    text: '変更する',
                    onPressed: () async {
                      if (_selectedDateAndTime == null ||
                          _selectedStartTime == null ||
                          _selectedFinishTime == null) {
                        return;
                      }
                      final user = AuthRepository.currentUser;

                      final title = _titleController.text;
                      final place = _placeController.text;
                      final detail = _detailController.text;
                      final battleRoom = BattleRoom(
                        id: widget.battleRoom.id,
                        place: place,
                        title: title,
                        prefecture: _initialPrefectureArea,
                        city: _initialCityArea,
                        dateTime: Timestamp.fromDate(_selectedDateAndTime!),
                        startTime: Timestamp.fromDate(_selectedStartTime!),
                        finishTime: Timestamp.fromDate(_selectedFinishTime!),
                        ownerId: user!.id,
                        createrName: user.userName,
                        createrImage: user.userImage,
                        createdAt: Timestamp.now(),
                        updatedAt: Timestamp.now(),
                        fetures: _selectedFeatures,
                        dartsModels: _selectedDartsModels,
                        numberOfParticipants: 0,
                        isApproved: isApproval,
                        detail: detail,
                        userId: user.userId,
                        followerCount: user.followerCount,
                        followingCount: user.followingCount,
                        capacity: _capacity,
                      );
                      await BattleRoomRepository.updateBattleRoom(battleRoom);
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

  void _getBattleRoomPage() {
    _titleController.text = widget.battleRoom.title;
    _placeController.text = widget.battleRoom.place;
    _initialPrefectureArea = widget.battleRoom.prefecture;
    _prefController.text = _initialPrefectureArea?.name ?? '未登録';
    _initialCityArea = widget.battleRoom.city;
    _cityController.text = _initialCityArea?.name ?? '未登録';
    _dateTimeController.text =
        dateFormat.format(widget.battleRoom.dateTime.toDate());
    _startTimeController.text =
        timeFormat.format(widget.battleRoom.startTime.toDate());
    _finishTimeController.text =
        timeFormat.format(widget.battleRoom.finishTime.toDate());
    // dateTime = widget.battleRoom.dateTime;
    _selectedFeatures = widget.battleRoom.fetures.toList();
    _selectedDartsModels = widget.battleRoom.dartsModels.toList();
    _capacity = widget.battleRoom.capacity;
    _detailController.text = widget.battleRoom.detail;

    setState(() {});
  }
}
