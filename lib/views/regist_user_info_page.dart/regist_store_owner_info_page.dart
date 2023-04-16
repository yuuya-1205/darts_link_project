// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darts_link_project/components/input_field.dart';
import 'package:darts_link_project/models/app_user.dart';
import 'package:darts_link_project/models/city.dart';
import 'package:darts_link_project/models/pref.dart';
import 'package:darts_link_project/repositories/area_repository.dart';
import 'package:darts_link_project/repositories/auth_repository.dart';
import 'package:darts_link_project/repositories/store_owner_repository.dart';
import 'package:darts_link_project/views/auth_page/store_register_application_review_page.dart';
import 'package:darts_link_project/views/components/original_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegistStoreOwnerInfoPage extends StatefulWidget {
  const RegistStoreOwnerInfoPage({Key? key}) : super(key: key);

  @override
  State<RegistStoreOwnerInfoPage> createState() =>
      _RegistStoreOwnerInfoPageState();
}

class _RegistStoreOwnerInfoPageState extends State<RegistStoreOwnerInfoPage> {
  Pref? _selectedPref;
  Pref? _initalPrefectureArea;
  City? _selectedCity;
  City? _initalCityArea;

  List<Pref> prefs = [];

  final _formKey = GlobalKey<FormState>();
  final _storeNameController = TextEditingController();
  final _userIdController = TextEditingController();
  final _prefController = TextEditingController();
  final _cityController = TextEditingController();
  final _addressController = TextEditingController();
  final _bussinessHoursController = TextEditingController();
  final _urlController = TextEditingController();
  final _introductionController = TextEditingController();
  final _dartsBoardCountController = TextEditingController();

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
          child: Row(
            children: [
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
            ],
          ),
        ),
        title: const Text(
          '店舗登録申請',
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
            child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    '店舗名',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 60,
                  ),
                  Flexible(
                    child: InputField(
                      controller: _storeNameController,
                      hintText: '店舗名を入力してください',
                      keyboardType: TextInputType.emailAddress,
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return '店舗名を入力してください';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  const Text(
                    '都道府県',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 45,
                  ),
                  Flexible(
                    child: InputField(
                      readOnly: true,
                      controller: _prefController,
                      hintText: '選択してください',
                      onTap: () async {
                        final prefs = AreaRepository.prefList;
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return SizedBox(
                              height: MediaQuery.of(context).size.height / 2,
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
                                          _initalPrefectureArea = _selectedPref;
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
                                      MediaQuery.of(context).size.height / 3,
                                  child: CupertinoPicker(
                                    itemExtent: 40,
                                    children:
                                        prefs.map((e) => Text(e.name)).toList(),
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
                height: 12,
              ),
              Row(
                children: [
                  const Text(
                    'エリア',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 60,
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
                        final cities = AreaRepository
                            .cityMap[_initalPrefectureArea!.code]!;
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return SizedBox(
                              height: MediaQuery.of(context).size.height / 2,
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
                                              _initalCityArea?.name ?? '未登録';
                                        });
                                      },
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  height:
                                      MediaQuery.of(context).size.height / 3,
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
                height: 12,
              ),
              Row(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    '住所',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 75,
                  ),
                  Flexible(
                    child: InputField(
                      controller: _addressController,
                      hintText: '入力してください',
                      keyboardType: TextInputType.emailAddress,
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return '住所を入力してください';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    '営業時間',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 45,
                  ),
                  Flexible(
                    child: InputField(
                      controller: _bussinessHoursController,
                      hintText: '入力してください',
                      keyboardType: TextInputType.emailAddress,
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return '営業時間を入力してください';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'URL',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 73,
                  ),
                  Flexible(
                    child: InputField(
                      controller: _urlController,
                      hintText: '入力してください',
                      keyboardType: TextInputType.emailAddress,
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'URLを入力してください';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: const [
                      Text(
                        'ダーツ台',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '設置数',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 45,
                  ),
                  Flexible(
                    child: InputField(
                      controller: _dartsBoardCountController,
                      hintText: '入力してください',
                      keyboardType: TextInputType.emailAddress,
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'ダーツ台設置数を入力してください';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                children: const [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'タグ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    '店舗詳細',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 45,
                  ),
                  Flexible(
                    child: InputField(
                      controller: _introductionController,
                      hintText: '入力してください',
                      keyboardType: TextInputType.emailAddress,
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return '店舗詳細を入力してください';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              OriginalButton(
                text: '店舗申請する',
                onPressed: () async {
                  if (!_formKey.currentState!.validate()) {
                    return;
                  }
                  final uid = FirebaseAuth.instance.currentUser!.uid;
                  final storeName = _storeNameController.text;
                  final address = _addressController.text;
                  final selfIntroduction = _introductionController.text;
                  final dartsBoardCount = _dartsBoardCountController.text;
                  if (_initalCityArea == null ||
                      _initalPrefectureArea == null) {
                    return;
                  }

                  final storeOwner = StoreOwner(
                    id: uid,
                    userName: storeName,
                    userId: _userIdController.text,
                    address: address,
                    prefecture: _initalPrefectureArea!,
                    city: _initalCityArea!,
                    telephoneNumber: 0,
                    selfIntroduction: selfIntroduction,
                    createdAt: Timestamp.now(),
                    updatedAt: Timestamp.now(),
                    dartsBoradCount: dartsBoardCount,
                  );
                  await StoreOwnerRepository.updateStoreOwner(storeOwner);

                  AuthRepository.currentUser = storeOwner;
                  // ignore: use_build_context_synchronously
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) =>
                          const StoreRegisterApplicationReviewPage()),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        )),
      ),
    );
  }

  @override
  Future<void> _getCurrentUser() async {
    final currentUser = AuthRepository.currentUser;

    if (currentUser == null) {
      return;
    }

    _userIdController.text = currentUser.id.substring(2, 8);

    setState(() {});
  }
}
