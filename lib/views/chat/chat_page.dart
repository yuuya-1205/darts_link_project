import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darts_link_project/constant/color.dart';
import 'package:darts_link_project/models/app_user.dart';
import 'package:darts_link_project/repositories/auth_repository.dart';
import 'package:darts_link_project/repositories/storage_repository.dart';
import 'package:darts_link_project/repositories/thread_chat_repository.dart';
import 'package:darts_link_project/repositories/thread_repository.dart';
import 'package:darts_link_project/views/chat/components/chat_item_view.dart';
import 'package:darts_link_project/views/chat/components/chat_time_line_date_view.dart';
import 'package:darts_link_project/views/components/loading_view.dart';
import 'package:darts_link_project/views/components/original_app_bar/original_app_bar.dart';
import 'package:darts_link_project/views/image_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:uuid/uuid.dart';

import '../../models/chat.dart';
import '../../models/thread.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key, required this.thread}) : super(key: key);
  final Thread thread;

  @override
  Widget build(BuildContext context) {
    final user = AuthRepository.currentUser;

    bool isShowSendDate({required int index, required List<Chat> chats}) {
      if (index == chats.length - 1) {
        return true;
      }
      if (chats[index].createdAt.toDate().day !=
          chats[index + 1].createdAt.toDate().day) {
        return true;
      }
      return false;
    }

    if (user == null) {
      throw Exception('ログインしていません');
    }

    return Scaffold(
      appBar: OriginalAppBer(title: thread.getMemberDetail(user.id).userName),
      backgroundColor: chatPageBgColor,
      body: Column(
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.topCenter,
              child: StreamBuilder<List<Chat>>(
                stream:
                    ThreadChatRepository.chatStream(thread.reference?.id ?? ''),
                builder: (context, snapshot) {
                  if (snapshot.connectionState != ConnectionState.active) {
                    return const LoadingView();
                  }

                  if (!snapshot.hasData) {
                    return const SizedBox();
                  }

                  final chats = snapshot.data;

                  return ListView.builder(
                    reverse: true,
                    shrinkWrap: true,
                    physics: const RangeMaintainingScrollPhysics(),
                    itemCount: chats!.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          if (isShowSendDate(index: index, chats: chats))
                            ChatTimeLineDateView(chats[index].createdAt),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: ChatItemView(
                              chat: chats[index],
                              memberDetails: thread.memberDetails,
                              isSender: chats[index].senderUid == user.id,
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          ),
          _ChatBar(thread: thread, currentUser: user),
        ],
      ),
    );
  }
}

class ChatCellImages extends StatelessWidget {
  const ChatCellImages({
    Key? key,
    required this.imageUrls,
  }) : super(key: key);
  final List<String> imageUrls;

  @override
  Widget build(BuildContext context) {
    if (imageUrls.isEmpty) {
      return Container();
    } else if (imageUrls.length == 1) {
      return _imageCell(
        imageUrl: imageUrls[0],
        context: context,
      );
    } else if (imageUrls.length == 2) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: _imageCell(
              imageUrl: imageUrls[0],
              context: context,
            ),
          ),
          Expanded(
            child: _imageCell(
              imageUrl: imageUrls[1],
              context: context,
            ),
          ),
        ],
      );
    } else if (imageUrls.length == 3) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: _imageCell(
              imageUrl: imageUrls[0],
              context: context,
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: _imageCell(
                    imageUrl: imageUrls[1],
                    context: context,
                  ),
                ),
                Expanded(
                  child: _imageCell(
                    imageUrl: imageUrls[2],
                    context: context,
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    } else {
      return Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: _imageCell(
                    imageUrl: imageUrls[0],
                    context: context,
                  ),
                ),
                Expanded(
                  child: _imageCell(
                    imageUrl: imageUrls[1],
                    context: context,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: _imageCell(
                  imageUrl: imageUrls[2],
                  context: context,
                ),
              ),
              Expanded(
                child: _imageCell(
                  imageUrl: imageUrls[3],
                  context: context,
                ),
              ),
            ],
          ),
        ],
      );
    }
  }

  Widget _imageCell({
    required String imageUrl,
    required BuildContext context,
  }) {
    return InkWell(
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: ((context) => ImageDetailPage(imageUrl)),
          ),
        );
      },
      child: Hero(
        tag: imageUrl,
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _ChatBar extends StatefulWidget {
  const _ChatBar({
    Key? key,
    required this.thread,
    required this.currentUser,
  }) : super(key: key);
  final Thread thread;
  final AppUser currentUser;

  @override
  __ChatBarState createState() => __ChatBarState();
}

class __ChatBarState extends State<_ChatBar> {
  bool _isSending = false;
  final _messageController = TextEditingController();
  List<Asset> _selectedImages = [];
  late final Map<String, List<String>> unReadCount = {
    ...widget.thread.unreadCount
  };

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              if (_selectedImages.isNotEmpty)
                SizedBox(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _selectedImages.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Stack(
                          children: [
                            AssetThumb(
                              asset: _selectedImages[index],
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
                                    _selectedImages.removeAt(index);
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
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.picture_in_picture),
                    onPressed: () async {
                      final images = await MultiImagePicker.pickImages(
                        maxImages: 6,
                        enableCamera: true,
                      );
                      setState(() {
                        _selectedImages = images;
                      });
                    },
                  ),
                  Expanded(
                    child: TextFormField(
                      maxLines: null,
                      decoration: const InputDecoration(
                        hintText: 'メッセージを入力してください。',
                        border: InputBorder.none,
                      ),
                      controller: _messageController,
                    ),
                  ),
                  TextButton(
                    onPressed: _isSending
                        ? null
                        : () async {
                            if (_messageController.text.isEmpty) {
                              return;
                            }
                            setState(() {
                              _isSending = true;
                            });
                            final imageFutures = _selectedImages
                                .map(
                                  (image) => _saveImage(image),
                                )
                                .toList();
                            final imageUrls = await Future.wait(imageFutures);

                            final senderUid = widget.currentUser.id;
                            final text = _messageController.text;
                            final chat = Chat(
                              imageUrls: imageUrls,
                              senderUid: senderUid,
                              text: text,
                              threadReference: widget.thread.reference!,
                              createdAt: Timestamp.now(),
                            );

                            final chatId =
                                await ThreadChatRepository.createChat(
                                    chat: chat);

                            for (final uid in widget.thread.memberIds) {
                              if (uid == senderUid) {
                                continue;
                              }
                              unReadCount[uid] = [...unReadCount[uid]!, chatId];
                            }

                            final thread = widget.thread.copyWith(
                              latestChat: text,
                              updatedAt: Timestamp.now(),
                              unreadCount: unReadCount,
                            );

                            await ThreadRepository.updateThread(thread);

                            _messageController.clear();
                            setState(() {
                              _isSending = false;
                              _selectedImages.clear();
                            });
                          },
                    child: const Text('送信'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  Future<String> _saveImage(Asset asset) async {
    final randomString = const Uuid().v4();
    final path = 'posts/${widget.currentUser.id}/$randomString.jpeg';

    return StorageRepository().saveImage(asset: asset, path: path);
  }
}
