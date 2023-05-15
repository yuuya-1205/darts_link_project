import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darts_link_project/models/post.dart';
import 'package:darts_link_project/repositories/app_user_repository.dart';
import 'package:darts_link_project/repositories/auth_repository.dart';
import 'package:darts_link_project/repositories/post_repository.dart';
import 'package:darts_link_project/repositories/storage_repository.dart';
import 'package:darts_link_project/views/app_bar_action_button.dart';
import 'package:darts_link_project/views/components/original_app_bar/original_app_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:uuid/uuid.dart';

class CreateTimeLinePage extends StatefulWidget {
  const CreateTimeLinePage({Key? key}) : super(key: key);

  @override
  State<CreateTimeLinePage> createState() => _CreateTimeLinePageState();
}

class _CreateTimeLinePageState extends State<CreateTimeLinePage> {
  final _formKey = GlobalKey<FormState>();
  final _postController = TextEditingController();

  List<Asset> _selectedimages = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OriginalAppBer(
        title: 'タイムライン作成',
        actions: [
          AppbarActionButton(
            onPressed: () async {
              if (!_formKey.currentState!.validate()) {
                return;
              }
              final navigator = Navigator.of(context);
              final imageFutures = _selectedimages
                  .map(
                    (selectedimage) => _saveimage(selectedimage),
                  )
                  .toList();
              final imageUrls = await Future.wait(imageFutures);

              final user = AuthRepository.currentUser;
              final text = _postController.text;
              if (user == null) {
                return;
              }
              final docRef = AppUserRepository.getAppUserDocRef(user);
              final post = Post(
                  userName: user.userName,
                  text: text,
                  createrId: user.id,
                  userId: user.userId,
                  createdAt: Timestamp.now(),
                  id: '',
                  postImage: imageUrls,
                  userImage: user.userImage,
                  posterRef: docRef);
              PostRepository.addPost(post);
              navigator.pop();
            },
            label: '投稿',
            isActive: _postController.text.isNotEmpty,
          ),
        ],
      ),
      body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextFormField(
                  maxLength: 400,
                  maxLines: null,
                  onChanged: (value) {
                    setState(() {});
                  },
                  autofocus: true,
                  controller: _postController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'タイムライン',
                  ),
                  keyboardType: TextInputType.multiline,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'タイムラインを入力してください。';
                    }
                    return null;
                  },
                ),
                const Spacer(),
                if (_selectedimages.isNotEmpty)
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _selectedimages.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Stack(
                            children: [
                              AssetThumb(
                                asset: _selectedimages[index],
                                width: 1080,
                                height: 1080,
                              ),
                              Positioned(
                                top: -4,
                                right: -4,
                                child: IconButton(
                                  color: Colors.white,
                                  icon: const Icon(Icons.close),
                                  onPressed: () {
                                    setState(() {
                                      _selectedimages.removeAt(index);
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                InkWell(
                  onTap: () async {
                    final imagefiles = await MultiImagePicker.pickImages(
                      maxImages: 6,
                      enableCamera: true,
                    );
                    setState(() {
                      _selectedimages = imagefiles;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Colors.black,
                      ),
                    ),
                    child: Row(
                      children: const [
                        Icon(FeatherIcons.image),
                        Text('画像の追加'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }

  Future<String> _saveimage(Asset asset) async {
    final uid = FirebaseAuth.instance.currentUser!.uid;

    final randomString = const Uuid().v4();
    final path = 'posts/$uid/$randomString.jpeg';

    return StorageRepository().saveImage(asset: asset, path: path);
  }
}
