import 'package:darts_link_project/components/user_image.dart';
import 'package:flutter/material.dart';

class ListItemView extends StatelessWidget {
  const ListItemView({
    Key? key,
    required this.imageUrl,
    required this.name,
    this.trailing,
  }) : super(key: key);
  final String imageUrl;
  final String name;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
      ),
      height: 80,
      child: Row(
        children: [
          UserImage(imageUrl: imageUrl),
          const SizedBox(width: 8),
          Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
          if (trailing != null) ...[
            const Spacer(),
            trailing!,
          ],
        ],
      ),
    );
  }
}
