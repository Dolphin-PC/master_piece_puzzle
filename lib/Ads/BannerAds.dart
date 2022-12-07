import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:master_piece_puzzle/Ads/Common.dart';

class BannerAds extends StatelessWidget {
  const BannerAds({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TargetPlatform os = Theme.of(context).platform;
    late BannerAd banner;

    if (!kIsWeb) {
      banner = BannerAd(
        listener: BannerAdListener(
          onAdFailedToLoad: (Ad ad, LoadAdError error) {},
          onAdLoaded: (_) {},
        ),
        size: AdSize.banner,
        adUnitId: UNIT_ID[os == TargetPlatform.iOS ? 'ios' : 'android']!,
        request: const AdRequest(),
      )..load();
    }

    return kIsWeb
        ? Container(
            child: Center(child: Text('배너 광고 영역')),
          )
        : AdWidget(
            ad: banner,
          );
  }
}
