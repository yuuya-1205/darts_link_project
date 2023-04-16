import 'package:darts_link_project/models/pref.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/city.dart';

extension BuildContextExtension on BuildContext {
  Size get deviceSize => MediaQuery.of(this).size;

  Future<void> showAreaSelectorPicker<T>({
    VoidCallback? onSubmitted,
    ValueChanged<T>? onSelectedItemChanged,
    List<T> values = const [],
  }) async {
    showModalBottomSheet(
      context: this,
      builder: (BuildContext context) {
        return SizedBox(
          height: deviceSize.height / 2,
          child: Column(children: [
            Row(
              children: [
                CupertinoButton(
                  child: const Text('もどる'),
                  onPressed: () => Navigator.pop(context),
                ),
                CupertinoButton(
                  onPressed: onSubmitted,
                  child: const Text('決定'),
                ),
              ],
            ),
            SizedBox(
              width: double.infinity,
              height: deviceSize.height / 3,
              child: CupertinoPicker(
                itemExtent: 40,
                onSelectedItemChanged: (index) =>
                    onSelectedItemChanged?.call(values[index]),
                children: values.map((e) {
                  if (e is Pref) {
                    return Text(e.name);
                  }
                  if (e is City) {
                    return Text(e.name);
                  }
                  return const Text('');
                }).toList(),
              ),
            )
          ]),
        );
      },
    );
  }

  Future<DateTime?> showDateSelectorPicker(DateTime initialDate) async {
    return showDatePicker(
      locale: const Locale("ja"),
      context: this,
      initialDate: initialDate,
      firstDate: DateTime(2003),

      /// 10年後まで表示可能に
      lastDate: initialDate.add(const Duration(days: 3650)),
    );
  }
}
