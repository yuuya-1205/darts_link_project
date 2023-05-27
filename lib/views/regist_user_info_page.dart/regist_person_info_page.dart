import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darts_link_project/components/header_image_url.dart';
import 'package:darts_link_project/components/input_field.dart';
import 'package:darts_link_project/components/original_button.dart';
import 'package:darts_link_project/models/app_user.dart';
import 'package:darts_link_project/models/city.dart';
import 'package:darts_link_project/models/pref.dart';
import 'package:darts_link_project/models/tag_type.dart';
import 'package:darts_link_project/repositories/area_repository.dart';
import 'package:darts_link_project/repositories/auth_repository.dart';
import 'package:darts_link_project/repositories/fcm_token_repository.dart';
import 'package:darts_link_project/repositories/person_repository.dart';
import 'package:darts_link_project/repositories/storage_repository.dart';
import 'package:darts_link_project/services/fcm_service.dart';
import 'package:darts_link_project/views/top_page/top_page.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class RegistPersonInfoPage extends StatefulWidget {
  const RegistPersonInfoPage({Key? key}) : super(key: key);

  @override
  State<RegistPersonInfoPage> createState() => _RegistPersonInfoPageState();
}

class _RegistPersonInfoPageState extends State<RegistPersonInfoPage> {
  @override
  void initState() {
    _getCurrentUser();
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  final _userNameController = TextEditingController();
  final _userIdController = TextEditingController();
  final _userSelfIntroductionController = TextEditingController();
  final _genderController = TextEditingController();
  final _prefController = TextEditingController();
  final _cityController = TextEditingController();

  Pref? _selectedPref;
  Pref? _initalPrefectureArea;
  City? _selectedCity;
  City? _initalCityArea;

  List<Pref> prefs = [];

  int _dartsLiveRating = 1;
  int _phoenixRating = 1;
  int _capacity = 1;

  Asset? _selectedHeaderImage;
  Asset? _selectedUserImage;

  String _currentHeaderImageUrl = '';
  String _currentUserImageUrl = '';

  final List<String> _selectedTags = [];

  void _incrementCounter() {
    if (_dartsLiveRating < 18) {
      setState(() {
        _dartsLiveRating++;
      });
    }
  }

  void _decrementCounter() {
    if (_dartsLiveRating > 1) {
      setState(() {
        _dartsLiveRating--;
      });
    }
  }

  void _phoenixIncrementCounter() {
    if (_dartsLiveRating < 30) {
      setState(() {
        _phoenixRating++;
      });
    }
  }

  void _phoenixDecrementCounter() {
    if (_phoenixRating > 1) {
      setState(() {
        _phoenixRating--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'プロフィール登録',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
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
              Stack(
                clipBehavior: Clip.none,
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
                          setState(() {
                            _selectedHeaderImage = headerfiles.first;
                          });
                        },
                      ),
                    ),
                  ),
                  // GestureDetector(
                  //   child: DottedBorder(
                  //     dashPattern: const [6.0],
                  //     strokeWidth: 2.0,
                  //     color: const Color.fromRGBO(247, 63, 150, 1),
                  //     child: Container(
                  //       height: 205,
                  //       width: double.infinity,
                  //       child: Column(
                  //         mainAxisAlignment: MainAxisAlignment.center,
                  //         children: const [
                  //           Icon(Icons.camera),
                  //           Text(
                  //             'タップして写真を選択しましょう',
                  //             style: TextStyle(
                  //               color: Color.fromRGBO(247, 63, 150, 1),
                  //               fontWeight: FontWeight.bold,
                  //             ),
                  //           ),
                  //           Text('＊写真は１枚選択できます'),
                  //           Text('ファイル形式はjpg/png'),
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  Positioned(
                    left: 18,
                    top: 170,
                    child: GestureDetector(
                      onTap: () async {
                        final userImage = await MultiImagePicker.pickImages(
                          maxImages: 1,
                          enableCamera: true,
                        );
                        // ignore: unnecessary_null_comparison
                        if (userImage != null) {
                          setState(() {
                            _selectedUserImage = userImage.first;
                          });
                        }
                      },
                      child: DottedBorder(
                        borderType: BorderType.Circle,
                        color: const Color.fromRGBO(247, 63, 150, 1),
                        dashPattern: const [6.0],
                        strokeWidth: 2.0,
                        child: Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          height: 76,
                          width: 76,
                          child: AspectRatio(
                            aspectRatio: 0.1,
                            child: ClipOval(child: _userImage()),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  const Text('アカウント名'),
                  const SizedBox(
                    width: 20,
                  ),
                  Flexible(
                    child: InputField(
                      controller: _userNameController,
                      hintText: '入力してください',
                      keyboardType: TextInputType.emailAddress,
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'ユーザー名を入力してください';
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
                  const Text('ID'),
                  const SizedBox(
                    width: 90,
                  ),
                  Flexible(
                    child: InputField(
                      controller: _userIdController,
                      hintText: '入力してください',
                      keyboardType: TextInputType.emailAddress,
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'ユーザー名を入力してください';
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
                  const Text('性別'),
                  const SizedBox(
                    width: 75,
                  ),
                  Flexible(
                    child: InputField(
                      controller: _genderController,
                      hintText: '選択してください',
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return '選択してください';
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
                  const Text(
                    'ダーツライブ',
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
              Row(
                children: [
                  const Text(
                    'フェニックス',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  IconButton(
                    onPressed: _capacity <= 0
                        ? null
                        : () {
                            _phoenixDecrementCounter();
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
                      _phoenixIncrementCounter();
                    },
                    icon: const Icon(Icons.add_circle_outline,
                        size: 40, color: Color.fromRGBO(247, 63, 150, 1)),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('レーティング'),
                  const SizedBox(
                    width: 25,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Text('ダーツライブ'),
                            IconButton(
                              onPressed: _dartsLiveRating <= 1
                                  ? null
                                  : () {
                                      _decrementCounter();
                                    },
                              icon: const Icon(Icons.add),
                            ),
                            Text('$_dartsLiveRating'),
                            IconButton(
                              onPressed: _dartsLiveRating >= 18
                                  ? null
                                  : () {
                                      _incrementCounter();
                                    },
                              icon: const Icon(Icons.add),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Text('フェニックス'),
                            IconButton(
                              onPressed: _phoenixRating <= 1
                                  ? null
                                  : () {
                                      _phoenixDecrementCounter();
                                    },
                              icon: const Icon(Icons.add),
                            ),
                            Text('$_phoenixRating'),
                            IconButton(
                              onPressed: () {
                                _phoenixIncrementCounter();
                              },
                              icon: const Icon(Icons.add),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  const Text('タグ'),
                  const SizedBox(
                    width: 80,
                  ),
                  ...GeneralTagType.values
                      .map(
                        (e) => GestureDetector(
                          onTap: () {
                            if (_selectedTags.contains(e.label)) {
                              _selectedTags.remove(e.label);
                            } else {
                              _selectedTags.add(e.label);
                            }

                            setState(() {});
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                                color: _selectedTags.contains(e.label)
                                    ? const Color.fromRGBO(242, 246, 217, 1)
                                    : const Color.fromRGBO(251, 251, 251, 1),
                                border: Border.all(
                                  color: _selectedTags.contains(e.label)
                                      ? const Color.fromRGBO(189, 208, 66, 1)
                                      : const Color.fromRGBO(217, 217, 217, 1),
                                ),
                                borderRadius: BorderRadius.circular(100)),
                            child: Center(
                              child: Text(
                                e.label,
                                style: TextStyle(
                                  color: _selectedTags.contains(e.label)
                                      ? const Color.fromRGBO(189, 208, 66, 1)
                                      : const Color.fromRGBO(217, 217, 217, 1),
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
                height: 12,
              ),
              Row(
                children: [
                  const Text('紹介文'),
                  const SizedBox(
                    width: 65,
                  ),
                  Flexible(
                    child: InputField(
                      controller: _userSelfIntroductionController,
                      hintText: '入力してください',
                      keyboardType: TextInputType.text,
                      obscureText: true,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              OriginalButton(
                primary: const Color.fromRGBO(247, 63, 150, 1),
                onPrimary: Colors.white,
                text: 'プロフィールを登録する',
                onPressed: () async {
                  final uid = AuthRepository.currentFirebaseUser?.uid ?? '';

                  if (_selectedHeaderImage != null) {
                    final path = 'headers/$uid/header.jpeg';
                    _currentHeaderImageUrl = await StorageRepository()
                        .saveImage(asset: _selectedHeaderImage!, path: path);
                  }

                  // プロフィール画像アップロード
                  if (_selectedUserImage != null) {
                    final path = 'users/$uid/user.jpeg';
                    _currentUserImageUrl = await StorageRepository()
                        .saveImage(asset: _selectedUserImage!, path: path);
                  }
                  final person = Person(
                    id: uid,
                    headerImage: _currentHeaderImageUrl,
                    userImage: _currentUserImageUrl,
                    userName: _userNameController.text,
                    userId: _userIdController.text,
                    gender: _genderController.text,
                    prefecture: _initalPrefectureArea,
                    city: _initalCityArea,
                    tag: _selectedTags,
                    selfIntroduction: _userSelfIntroductionController.text,
                    createdAt: Timestamp.now(),
                    updatedAt: Timestamp.now(),
                  );
                  final token = await FcmService.getToken();
                  await Future.wait(
                    [
                      PersonRepository.updatePerson(person),
                      FcmTokenRepository.createFcmToken(
                          PersonRepository.getDocumentRef(uid), token ?? '')
                    ],
                  );

                  AuthRepository.currentUser = person;
                  // ignore: use_build_context_synchronously
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => const TopPage()),
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

  Widget _userImage() {
    if (_selectedUserImage != null) {
      return AssetThumb(
        //TODO デザイン次第でアスペクト比変更
        asset: _selectedUserImage!,
        width: 100,
        height: 100,
      );
    } else if (_currentUserImageUrl.isNotEmpty) {
      return Image.network(_currentUserImageUrl);
    } else {
      return Image.asset(
        'assets/images/logo.png',
        width: 100,
        height: 100,
      );
    }
  }

  Future<void> _getCurrentUser() async {
    final currentUser = AuthRepository.currentUser;

    if (currentUser == null) {
      return;
    }

    _userIdController.text = currentUser.id.substring(2, 8);

    setState(() {});
  }
}
