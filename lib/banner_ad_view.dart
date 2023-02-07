import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class BannerAdView extends StatefulWidget {
  const BannerAdView({Key? key}) : super(key: key);

  @override
  State<BannerAdView> createState() => _BannerAdViewState();
}

class _BannerAdViewState extends State<BannerAdView> {
  List<BannerAd> bannerAds = [];
  bool isLoading = false;
  void initAd() {
    BannerAd bannerAd = BannerAd(
      adUnitId: Platform.isAndroid
          ? 'ca-app-pub-3940256099942544/6300978111'
          : 'ca-app-pub-3940256099942544/2934735716',
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) {
          setState(() {
            isLoading = true;
          });
        },
      ),
    )..load();
    bannerAds.add(bannerAd);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initAd();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 50,
      child: isLoading ? AdWidget(ad: bannerAds[0]) : Container(),
    );
  }
}
