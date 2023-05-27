import 'package:flutter/material.dart';

class TagListView extends StatelessWidget {
  const TagListView({Key? key, required this.tags}) : super(key: key);
  final List<String> tags;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: tags
          .map(
            (e) => Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 8, 0),
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(242, 246, 217, 1),
                  border: Border.all(
                    color: const Color.fromRGBO(189, 208, 66, 1),
                  ),
                  borderRadius: BorderRadius.circular(100)),
              child: Text(
                e,
                style: const TextStyle(
                  color: Color.fromRGBO(189, 208, 66, 1),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
