import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darts_link_project/components/constants.dart';
import 'package:darts_link_project/components/user_image.dart';
import 'package:darts_link_project/repositories/auth_repository.dart';
import 'package:darts_link_project/repositories/storage_repository.dart';
import 'package:darts_link_project/repositories/thread_chat_repository.dart';
import 'package:darts_link_project/repositories/thread_repository.dart';
import 'package:darts_link_project/views/image_detail_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:uuid/uuid.dart';

import '../../models/chat.dart';
import '../../models/thread.dart';

class ThreadChatPage extends StatelessWidget {
  static const name = 'ChatPage';
  final Thread thread;
  final bool isReading;

  const ThreadChatPage({
    Key? key,
    required this.thread,
    required this.isReading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = AuthRepository.currentUser;

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
        title: Row(
          children: [
            UserImage(
              size: 40,
              imageUrl:
                  thread.getMemberDetail(user!.id, isPartner: true)['imageUrl'],
            ),
            const SizedBox(
              width: 12,
            ),
            Text(
              thread.getMemberDetail(user.id, isPartner: true)['name'],
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<List<Chat>>(
              stream: ThreadChatRepository.chatStream(thread.id),
              builder: (context, snapshot) {
                if (snapshot.connectionState != ConnectionState.active) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (!snapshot.hasData) {
                  return Container();
                }

                final chats = snapshot.data;
                String lastchatCount() {
                  int count = 0;
                  for (final chat in chats!) {
                    if (chat.isReading == false) {
                      count++;
                    }
                  }
                  return count.toString();
                }

                return ListView.builder(
                  reverse: true,
                  itemCount: chats!.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: _ChatCell(
                        chat: chats[index],
                      ),
                    );
                  },
                );
              },
            ),
          ),
          _ChatBar(
            thread: thread,
          ),
        ],
      ),
    );
  }
}

class _ChatCell extends StatelessWidget {
  const _ChatCell({
    Key? key,
    required this.chat,
  }) : super(key: key);
  final Chat chat;

  @override
  Widget build(BuildContext context) {
    final isMyChat = chat.uid == FirebaseAuth.instance.currentUser!.uid;
    List<Widget> chatWidgets = [
      if (!isMyChat) const UserImage(imageUrl: ''),
      const SizedBox(
        width: 12,
      ),
      Flexible(
        child: Column(
          crossAxisAlignment:
              isMyChat ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Material(
              color: isMyChat ? Colors.white : Theme.of(context).accentColor,
              elevation: 10,
              borderRadius: BorderRadius.circular(8),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(chat.text),
              ),
            ),
            if (chat.imageUrls.isNotEmpty)
              const SizedBox(
                height: 16,
              ),
            if (chat.imageUrls.isNotEmpty)
              FractionallySizedBox(
                widthFactor: 0.5,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: ChatCellImages(
                      imageUrls: chat.imageUrls,
                    ),
                  ),
                ),
              )
          ],
        ),
      ),
      const SizedBox(
        width: 12,
      ),
      Text(HowLongAgo.since(chat.createdAt)),
    ];
    if (isMyChat) {
      chatWidgets = chatWidgets.reversed.toList();
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment:
          isMyChat ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: chatWidgets,
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
  }) : super(key: key);
  final Thread thread;

  @override
  __ChatBarState createState() => __ChatBarState();
}

class __ChatBarState extends State<_ChatBar> {
  bool _isSending = false;
  final _messageController = TextEditingController();
  List<Asset> _selectedimages = [];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
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
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.picture_in_picture),
                  onPressed: () async {
                    final imagefiles = await MultiImagePicker.pickImages(
                      maxImages: 6,
                      enableCamera: true,
                    );
                    setState(() {
                      _selectedimages = imagefiles;
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
                          final imageFutures = _selectedimages
                              .map(
                                (selectedimage) => _saveimage(selectedimage),
                              )
                              .toList();
                          final imageUrls = await Future.wait(imageFutures);

                          final uid = FirebaseAuth.instance.currentUser!.uid;
                          final text = _messageController.text;
                          final chat = Chat(
                            // TODO 後々実装する
                            isReading: {},
                            imageUrls: imageUrls,
                            uid: uid,
                            text: text,
                            threadId: widget.thread.id,
                            createdAt: Timestamp.now(),
                            reference: ThreadRepository.threadsCollection
                                .doc(widget.thread.id),
                          );

                          await ThreadChatRepository.createChat(chat: chat);

                          final Map<String, int> unReadCount = {
                            ...widget.thread.unReadCount
                          };
                          for (final uid in widget.thread.uids) {
                            if (uid != FirebaseAuth.instance.currentUser!.uid) {
                              unReadCount[uid] = unReadCount[uid]! + 1;
                            }
                          }

                          final thread = widget.thread.copyWith(
                              lastChat: text,
                              updatedAt: Timestamp.now(),
                              unReadCount: unReadCount);

                          await ThreadRepository.updateThread(thread);

                          _messageController.clear();
                          setState(() {
                            _isSending = false;
                            _selectedimages.clear();
                          });
                        },
                  child: const Text('送信'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  Future<String> _saveimage(Asset asset) async {
    final uid = FirebaseAuth.instance.currentUser!.uid;

    final randomString = const Uuid().v4();
    final path = 'posts/$uid/$randomString.jpeg';

    return StorageRepository().saveimage(asset: asset, path: path);
  }
}
