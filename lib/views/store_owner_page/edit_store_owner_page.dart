// ignore_for_file: use_build_context_synchronously, override_on_non_overriding_member

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darts_link_project/components/header_image_url.dart';
import 'package:darts_link_project/components/input_field.dart';
import 'package:darts_link_project/models/app_user.dart';
import 'package:darts_link_project/models/city.dart';
import 'package:darts_link_project/models/pref.dart';
import 'package:darts_link_project/models/tag_type.dart';
import 'package:darts_link_project/repositories/area_repository.dart';
import 'package:darts_link_project/repositories/auth_repository.dart';
import 'package:darts_link_project/repositories/battle_room/battle_room_repository.dart';
import 'package:darts_link_project/repositories/post_repository.dart';
import 'package:darts_link_project/repositories/storage_repository.dart';
import 'package:darts_link_project/repositories/store_owner_repository.dart';
import 'package:darts_link_project/views/components/original_button.dart';
import 'package:darts_link_project/views/store_owner_page/store_owner_page.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:uuid/uuid.dart';

class EditStoreOwnerPage extends StatefulWidget {
  const EditStoreOwnerPage({super.key});

  @override
  State<EditStoreOwnerPage> createState() => _EditStoreOwnerPageState();
}

class _EditStoreOwnerPageState extends State<EditStoreOwnerPage> {
  final _formKey = GlobalKey<FormState>();
  final _userNameController = TextEditingController();
  final _userIdController = TextEditingController();
  final _userSelfIntroductionController = TextEditingController();
  final _genderController = TextEditingController();
  final _prefController = TextEditingController();
  final _cityController = TextEditingController();

  @override
  void initState() {
    _getCurrentStoreOwner();
    // TODO: implement initState
    super.initState();
  }

  Pref? _selectedPref;
  Pref? _initalPrefectureArea;
  City? _selectedCity;
  City? _initalCityArea;

  List<Pref> prefs = [];

  int _dartsLiveRating = 1;
  int _phoenixRating = 1;

  List<Asset> _selectedHeaderImages = [];
  Asset? _selectedUserImage;

  List<String> _currentHeaderImageUrls = [];
  String _currentUserImageUrl = '';
  String _selectedGender = '未設定';

  List<String> _selectedTags = [];

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
          '店舗情報編集',
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.bold,
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
                            asset: _selectedHeaderImages.isEmpty
                                ? null
                                : _selectedHeaderImages.first,
                            headerImageUrl: _currentHeaderImageUrls.isEmpty
                                ? ''
                                : _currentHeaderImageUrls.first),
                        onTap: () async {
                          final headerfiles = await MultiImagePicker.pickImages(
                            maxImages: 6,
                            enableCamera: true,
                          );
                          if (headerfiles != null) {
                            setState(() {
                              _selectedHeaderImages = headerfiles;
                            });
                          }
                        },
                      ),
                    ),
                  ),
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
                  const Text('店舗名'),
                  const SizedBox(
                    width: 60,
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
                  const Text('都道府県'),
                  const SizedBox(
                    width: 45,
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
                        final citys = await AreaRepository.getCitysData(
                            _initalPrefectureArea!.code.toString());
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
                                    children:
                                        citys.map((e) => Text(e.name)).toList(),
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
                height: 12,
              ),
              Row(
                children: [
                  const Text('住所'),
                  const SizedBox(
                    width: 70,
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
                height: 12,
              ),
              Row(
                children: [
                  const Text('電話番号'),
                  const SizedBox(
                    width: 46,
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
                height: 12,
              ),
              Row(
                children: [
                  const Text('営業時間'),
                  const SizedBox(
                    width: 46,
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
                height: 12,
              ),
              Row(
                children: [
                  const Text('URL'),
                  const SizedBox(
                    width: 70,
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
                height: 12,
              ),
              Row(
                children: [
                  Column(
                    children: const [
                      Text('ダーツ台'),
                      Text('設置数'),
                    ],
                  ),
                  const SizedBox(
                    width: 50,
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
                  const Text('店舗情報'),
                  const SizedBox(
                    width: 46,
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
                text: 'プロフィールを変更する',
                onPressed: () async {
                  final uid = FirebaseAuth.instance.currentUser!.uid;
                  final user = FirebaseAuth.instance.currentUser!;
                  final storeName = _userNameController.text;
                  final userId = _userIdController.text;
                  final userSelfIntroduction =
                      _userSelfIntroductionController.text;

                  final imageFutures = _selectedHeaderImages
                      .map(
                        (selectedImage) => _saveImage(selectedImage),
                      )
                      .toList();
                  final imageUrls = await Future.wait(imageFutures);

                  // List<String> headerImageUrls;
                  // if (_selectedHeaderImages != null) {
                  //   final path = 'headers/${user.uid}/header.jpeg';
                  //   _currentHeaderImageUrl = await StorageRepository()
                  //       .saveimage(asset: _selectedHeaderImages, path: path);
                  // }

                  // プロフィール画像アップロード
                  String? imageUrl;
                  if (_selectedUserImage != null) {
                    final path = 'users/${user.uid}/user.jpeg';
                    _currentUserImageUrl = await StorageRepository()
                        .saveimage(asset: _selectedUserImage!, path: path);
                  }
                  final storeOwner = StoreOwner(
                    id: uid,
                    headerImages: imageUrls,
                    userImage: _currentUserImageUrl,
                    userName: storeName,
                    userId: userId,
                    selfIntroduction: userSelfIntroduction,
                    tag: _selectedTags,
                    createdAt: Timestamp.now(),
                    updatedAt: Timestamp.now(),
                    address: '',
                    telephoneNumber: 0,
                    prefecture: _initalPrefectureArea!,
                    city: _initalCityArea!,
                    isApproved: true,
                  );
                  await StoreOwnerRepository.updateStoreOwner(storeOwner);
                  await PostRepository.updateProfile(appUser: storeOwner);
                  await BattleRoomRepository.updateProfile(appUser: storeOwner);

                  AuthRepository.currentUser = storeOwner;
                  // ignore: use_build_context_synchronously
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => StoreOwnerPage()),
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

  @override
  Future<void> _getCurrentStoreOwner() async {
    if (AuthRepository.currentUser == null ||
        AuthRepository.currentUser is Person) {
      return;
    }
    final currentUser = AuthRepository.currentUser as StoreOwner;

    _userNameController.text = currentUser.userName;
    _userIdController.text = currentUser.userId;
    _currentHeaderImageUrls = currentUser.headerImages;
    _currentUserImageUrl = currentUser.userImage;
    _userIdController.text = currentUser.userId;
    _userSelfIntroductionController.text = currentUser.selfIntroduction;
    _initalPrefectureArea = currentUser.prefecture;
    _prefController.text = _initalPrefectureArea?.name ?? '未登録';
    _initalCityArea = currentUser.city;
    _cityController.text = _initalCityArea?.name ?? '未登録';
    _selectedTags = currentUser.tag.toList();

    setState(() {});
  }

  Future<String> _saveImage(Asset asset) async {
    final uid = FirebaseAuth.instance.currentUser!.uid;

    final randomString = const Uuid().v4();
    final path = 'posts/$uid/$randomString.jpeg';

    return StorageRepository().saveimage(asset: asset, path: path);
  }
}
