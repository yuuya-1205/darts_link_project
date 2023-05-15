import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:darts_link_project/components/follow_approve_button.dart';
import 'package:darts_link_project/components/original_button.dart';
import 'package:darts_link_project/models/app_user.dart';
import 'package:darts_link_project/models/house_tornament/house_tournament.dart';
import 'package:darts_link_project/repositories/auth_repository.dart';
import 'package:darts_link_project/repositories/favorite_store_owner_repository.dart';
import 'package:darts_link_project/repositories/house_tornament/house_tornament_repository.dart';
import 'package:darts_link_project/theme_data.dart';
import 'package:darts_link_project/views/components/house_tournament/house_tournament_list_view.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class DartsBarInfoPage extends StatefulWidget {
  const DartsBarInfoPage({super.key, required this.storeOwner});

  final StoreOwner storeOwner;

  @override
  State<DartsBarInfoPage> createState() => _DartsBarInfoPageState();
}

class _DartsBarInfoPageState extends State<DartsBarInfoPage> {
  final user = AuthRepository.currentUser;
  void _openPhoneApp() {
    const tel = '08034250591';
    _launchURL('tel:$tel');
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunchUrl(url as Uri)) {
      await launchUrl(url as Uri);
    }
  }

  final FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;

  @override
  Widget build(BuildContext context) {
    if (user == null) {
      throw Exception('ログインしていません');
    }
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
            child: Text(
              '店舗詳細',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 14),
            child: Container(
              decoration: BoxDecoration(
                color: OriginalTheme.themeData.dividerColor,
                borderRadius: BorderRadius.circular(8),
              ),
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Wrap(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(''),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
            child: Text(
              '店舗情報',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            decoration: const BoxDecoration(
                border: Border.symmetric(
                    horizontal: BorderSide(color: Colors.grey))),
            child: const Text('こんにちは'),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            decoration: const BoxDecoration(
                border: Border.symmetric(
                    horizontal: BorderSide(color: Colors.grey))),
            child: const Text('こんにちは'),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                child: Text(
                  '写真',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              if (widget.storeOwner.headerImages.isNotEmpty)
                Wrap(
                    runSpacing: 20,
                    children: widget.storeOwner.headerImages
                        .asMap()
                        .entries
                        .map((entry) {
                          if (entry.key == 0) {
                            return null;
                          }
                          return Container(
                              width: 120,
                              height: 50,
                              child: Image.network(entry.value));
                        })
                        .whereType<Widget>()
                        .toList()),
            ],
          ),
          const SizedBox(height: 32),
          const Padding(
            padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
            child: Text(
              'ハウトー情報',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          StreamBuilder<List<HouseTournament>>(
            stream: HouseTournamentRepository.houseTournamentStream(),
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.active) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (!snapshot.hasData) {
                return Container();
              }

              final houseTournaments = snapshot.data;
              if (houseTournaments!.isEmpty) {
                return const Center(
                  child: Text('まだ、投稿がありません'),
                );
              }

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: HouseTournamentListView(
                  houseTournaments: houseTournaments,
                ),
              );
            },
          ),
          const SizedBox(height: 32),
          Center(
            child: StreamBuilder<DocumentSnapshot>(
              stream: FavoriteStoreOwnerRepository.favoriteStoreOwnerDocStream(
                  myUid: user!.id, storeOwnerId: widget.storeOwner.id),
              builder: (context, snapshots) {
                if (snapshots.hasData && snapshots.data!.exists) {
                  return OriginalButton(
                    primary: OriginalTheme.themeData.primaryColor,
                    onPrimary: Colors.white,
                    onPressed: () async {
                      await FavoriteStoreOwnerRepository.unFavorite(
                          myUid: user!.id, storeOwnerId: widget.storeOwner.id);
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
                      myUid: user!.id,
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
                    googleAnalyticsParameters: const GoogleAnalyticsParameters(
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
    );
  }
}
