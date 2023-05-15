import 'package:darts_link_project/components/user_image.dart';
import 'package:darts_link_project/models/app_user.dart';
import 'package:darts_link_project/views/darts_bar_page/darts_bar_detail_page.dart';
import 'package:flutter/material.dart';

class StoreOwnerListItemView extends StatelessWidget {
  const StoreOwnerListItemView({
    required this.storeOwner,
    Key? key,
  }) : super(key: key);
  final StoreOwner storeOwner;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) => DartsBarDetailPage(
                  storeOwner: storeOwner,
                )),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17.0),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border:
                  Border.all(color: const Color.fromRGBO(232, 232, 232, 1))),
          height: 110,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(14, 23, 0, 23),
                child: UserImage(size: 64, imageUrl: storeOwner.userImage),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(6, 14, 0, 14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    Text(
                      storeOwner.userName,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          color: Color.fromRGBO(210, 48, 125, 1),
                        ),
                        Text(
                          storeOwner.city.name.isEmpty
                              ? '未登録'
                              : storeOwner.city.name,
                          style: const TextStyle(
                              color: Color.fromRGBO(210, 48, 125, 1)),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
