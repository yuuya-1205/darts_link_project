import 'package:darts_link_project/components/user_image.dart';
import 'package:darts_link_project/constant/color.dart';
import 'package:darts_link_project/extensions/build_context_extension.dart';
import 'package:darts_link_project/extensions/date_time_extension.dart';
import 'package:darts_link_project/models/chat.dart';
import 'package:darts_link_project/models/member_detail.dart';
import 'package:darts_link_project/views/chat/chat_page.dart';
import 'package:flutter/material.dart';

class ChatItemView extends StatelessWidget {
  const ChatItemView({
    Key? key,
    required this.chat,
    required this.isSender,
    required this.memberDetails,
  }) : super(key: key);
  final Chat chat;
  final bool isSender;
  final Map<String, MemberDetail> memberDetails;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      textDirection: isSender ? TextDirection.rtl : TextDirection.ltr,
      children: [
        Flexible(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            textDirection: isSender ? TextDirection.rtl : TextDirection.ltr,
            mainAxisSize: MainAxisSize.min,
            children: [
              isSender
                  ? const SizedBox()
                  : UserImage(
                      imageUrl: memberDetails[chat.senderUid]?.userImage,
                      size: 40,
                    ),
              const SizedBox(width: 8),
              Flexible(
                child: Column(
                  crossAxisAlignment: isSender
                      ? CrossAxisAlignment.end
                      : CrossAxisAlignment.start,
                  children: [
                    Container(
                      constraints: BoxConstraints(
                          maxWidth: context.deviceSize.width * 0.5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: isSender
                            ? Colors.white
                            : Theme.of(context).colorScheme.secondary,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(chat.text),
                      ),
                    ),
                    if (chat.imageUrls.isNotEmpty) const SizedBox(height: 16),
                    if (chat.imageUrls.isNotEmpty)
                      FractionallySizedBox(
                        widthFactor: 0.5,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: ChatCellImages(imageUrls: chat.imageUrls),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        Text(
          chat.createdAt.toDate().formatHhMm,
          style: const TextStyle(color: unselectedColor),
        ),
      ],
    );
  }
}
