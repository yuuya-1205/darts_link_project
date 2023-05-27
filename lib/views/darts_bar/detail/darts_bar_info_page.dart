import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darts_link_project/components/follow_approve_button.dart';
import 'package:darts_link_project/components/original_button.dart';
import 'package:darts_link_project/extensions/build_context_extension.dart';
import 'package:darts_link_project/models/app_user.dart';
import 'package:darts_link_project/models/house_tornament/house_tournament.dart';
import 'package:darts_link_project/repositories/auth_repository.dart';
import 'package:darts_link_project/repositories/favorite_store_owner_repository.dart';
import 'package:darts_link_project/repositories/house_tornament/house_tornament_repository.dart';
import 'package:darts_link_project/theme_data.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../components/house_tournament/house_tournament_list_view.dart';

class DartsBarInfoPage extends StatefulWidget {
  const DartsBarInfoPage({super.key, required this.storeOwner});

  final StoreOwner storeOwner;
  static const double horizontalTotalPadding = 24;

  @override
  State<DartsBarInfoPage> createState() => _DartsBarInfoPageState();
}

class _DartsBarInfoPageState extends State<DartsBarInfoPage> {
  final currentUser = AuthRepository.currentUser;
  final FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;

  List<HouseTournament> houseTournaments = [];
  void _openPhoneApp() {
    const tel = '08034250591';
    _launchURL('tel:$tel');
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunchUrl(url as Uri)) {
      await launchUrl(url as Uri);
    }
  }

  Future<void> fetchHouseTournaments() async {
    final houseTournaments =
        await HouseTournamentRepository.fetchHouseTournamentsByOwner(
            widget.storeOwner.reference!);
    setState(() {
      this.houseTournaments = houseTournaments;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchHouseTournaments();
  }

  @override
  Widget build(BuildContext context) {
    if (currentUser == null) {
      throw Exception('ログインしていません');
    }
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: DartsBarInfoPage.horizontalTotalPadding / 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            _SelfIntroductionView(
                selfIntroduction: widget.storeOwner.selfIntroduction),
            const SizedBox(height: 16),
            _StoreInfoView(
              address: widget.storeOwner.address,
              businessHours: null,
              dartsBoardCount: widget.storeOwner.dartsBoradCount,
              storeUrl: null,
            ),
            const SizedBox(height: 16),
            _ImageListView(headerImages: widget.storeOwner.headerImages),
            const SizedBox(height: 16),
            _HouseTournamentView(houseTournaments: houseTournaments),
            const SizedBox(height: 32),
            Center(
              child: StreamBuilder<DocumentSnapshot>(
                stream:
                    FavoriteStoreOwnerRepository.favoriteStoreOwnerDocStream(
                        myUid: currentUser!.id,
                        storeOwnerId: widget.storeOwner.id),
                builder: (context, snapshots) {
                  if (snapshots.hasData && snapshots.data!.exists) {
                    return OriginalButton(
                      primary: OriginalTheme.themeData.primaryColor,
                      onPrimary: Colors.white,
                      onPressed: () async {
                        await FavoriteStoreOwnerRepository.unFavorite(
                            myUid: currentUser!.id,
                            storeOwnerId: widget.storeOwner.id);
                      },
                      text: 'お気に入り解除',
                    );
                  }
                  return OriginalButton(
                    text: 'お気に入り登録',
                    primary: OriginalTheme.themeData.primaryColor,
                    onPrimary: Colors.white,
                    onPressed: () {
                      FavoriteStoreOwnerRepository.setFavorite(
                        myUid: currentUser!.id,
                        storeOwner: widget.storeOwner,
                      );
                    },
                  );
                },
              ),
            ),
            Row(
              children: [
                FollowApproveButton(
                  onPressed: () {
                    _openPhoneApp();
                  },
                  text: '電話する',
                ),
                FollowApproveButton(
                  onPressed: () async {
                    final DynamicLinkParameters parameters =
                        DynamicLinkParameters(
                      uriPrefix: 'https://dartslinkproject.page.link',
                      link: Uri.parse('https://example.com/'),
                      androidParameters: const AndroidParameters(
                        packageName: 'com.linkdarts.app',
                        minimumVersion: 1,
                      ),
                      iosParameters: const IOSParameters(
                        bundleId: 'dartslink.com.first.app',
                        minimumVersion: '1.0.1',
                        appStoreId: '2U9595N8A4',
                      ),
                      googleAnalyticsParameters:
                          const GoogleAnalyticsParameters(
                        campaign: 'example-promo',
                        medium: 'social',
                        source: 'orkut',
                      ),
                      itunesConnectAnalyticsParameters:
                          const ITunesConnectAnalyticsParameters(
                        providerToken: '123456',
                        campaignToken: 'example-promo',
                      ),
                      socialMetaTagParameters: SocialMetaTagParameters(
                        title: 'ダーツリンク',
                        description:
                            'This link works whether app is installed or not!',
                        imageUrl: Uri.parse(widget.storeOwner.userImage),
                      ),
                    );

                    final dynamicUrl = await dynamicLinks.buildLink(parameters);

                    Share.share(
                        '${widget.storeOwner.userName} ${dynamicUrl.toString()}');
                  },
                  text: 'シェアする',
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _SelfIntroductionView extends StatelessWidget {
  const _SelfIntroductionView({Key? key, required this.selfIntroduction})
      : super(key: key);
  final String selfIntroduction;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '店舗詳細',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: OriginalTheme.themeData.dividerColor,
            borderRadius: BorderRadius.circular(8),
          ),
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          child: Text(selfIntroduction),
        ),
      ],
    );
  }
}

class _StoreInfoView extends StatelessWidget {
  const _StoreInfoView({
    Key? key,
    required this.address,
    required this.businessHours,
    required this.dartsBoardCount,
    required this.storeUrl,
  }) : super(key: key);
  final String address;
  final String? businessHours;
  final String dartsBoardCount;
  final String? storeUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '店舗情報',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 8),
        const Divider(height: 0, thickness: 1),
        const SizedBox(height: 8),
        Text('住所：$address'),
        const SizedBox(height: 8),
        const Divider(height: 0, thickness: 1),
        const SizedBox(height: 8),
        Text('営業時間：${businessHours ?? '未設定'}'),
        const SizedBox(height: 8),
        const Divider(height: 0, thickness: 1),
        const SizedBox(height: 8),
        Text('ダーツ台の数：$dartsBoardCount台'),
        const SizedBox(height: 8),
        const Divider(height: 0, thickness: 1),
        const SizedBox(height: 8),
        Text('URL：${storeUrl ?? '未設定'}'),
        const SizedBox(height: 8),
        const Divider(height: 0, thickness: 1),
      ],
    );
  }
}

class _ImageListView extends StatelessWidget {
  const _ImageListView({
    Key? key,
    required this.headerImages,
  }) : super(key: key);
  final List<String> headerImages;

  static const int gridCount = 3;
  static const int spaceCount = gridCount - 1;
  static const double spaceWidth = 8;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '写真',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 8),
        if (headerImages.isNotEmpty)
          Wrap(
            spacing: spaceWidth,
            runSpacing: 8,
            children: headerImages
                .map(
                  (image) {
                    return SizedBox(
                      width: (context.deviceSize.width -
                              DartsBarInfoPage.horizontalTotalPadding -
                              spaceWidth * spaceCount) /
                          gridCount,
                      child: AspectRatio(
                        aspectRatio: 16 / 9,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(image, fit: BoxFit.cover),
                        ),
                      ),
                    );
                  },
                )
                .whereType<Widget>()
                .toList()
              ..removeAt(0),
          ),
      ],
    );
  }
}

class _HouseTournamentView extends StatelessWidget {
  const _HouseTournamentView({
    Key? key,
    required this.houseTournaments,
  }) : super(key: key);
  final List<HouseTournament> houseTournaments;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'ハウトー情報',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 8),
        if (houseTournaments.isEmpty)
          const Text('まだ、ハウトーがありません')
        else ...[
          const Divider(height: 0, thickness: 1),
          HouseTournamentListView(houseTournaments: houseTournaments),
          const Divider(height: 0, thickness: 1),
        ],
      ],
    );
  }
}
