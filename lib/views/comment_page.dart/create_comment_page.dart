import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darts_link_project/models/comment.dart';
import 'package:darts_link_project/repositories/auth_repository.dart';
import 'package:darts_link_project/repositories/comment_repository.dart';
import 'package:darts_link_project/repositories/storage_repository.dart';
import 'package:darts_link_project/views/app_bar_action_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:uuid/uuid.dart';

class CreateCommentPage extends StatefulWidget {
  const CreateCommentPage({
    Key? key,
    required this.postId,
  }) : super(key: key);
  final String postId;

  @override
  State<CreateCommentPage> createState() => _CreateCommentPageState();
}

class _CreateCommentPageState extends State<CreateCommentPage> {
  final _formKey = GlobalKey<FormState>();
  final _commentController = TextEditingController();
  List<Asset> _selectedimages = [];
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
          'コメント作成',
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          AppbarActionButton(
            onPressed: () async {
              if (!_formKey.currentState!.validate()) {
                return;
              }
              final imageFutures = _selectedimages
                  .map(
                    (selectedimage) => _saveimage(selectedimage),
                  )
                  .toList();
              final imageUrls = await Future.wait(imageFutures);

              final user = AuthRepository.currentUser;
              final text = _commentController.text;
              final comment = Comment(
                id: '',
                userName: user!.userName,
                userId: user.userId,
                uid: user.id,
                userImage: user.userImage,
                text: text,
                commentImage: [],
                createdAt: Timestamp.now(),
              );
              CommntRepository.addComment(
                  postId: widget.postId, comment: comment);
              Navigator.of(context).pop();
            },
            label: '投稿',
            isActive: _commentController.text.isNotEmpty,
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
                  controller: _commentController,
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
                                  icon: Icon(Icons.close),
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
                    if (imagefiles != null) {
                      setState(() {
                        _selectedimages = imagefiles;
                      });
                    }
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

    return StorageRepository().saveimage(asset: asset, path: path);
  }
}
