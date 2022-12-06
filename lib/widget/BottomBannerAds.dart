import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

const Map<String, String> UNIT_ID = kReleaseMode
    ? {
        'ios': 'ca-app-pub-9245086971599023/2028797382',
        'android': 'ca-app-pub-9245086971599023/2028797382',
      }
    : {
        'ios': 'ca-app-pub-3940256099942544/2934735716',
        'android': 'ca-app-pub-3940256099942544/6300978111',
      };

class BottomBannerAds extends StatelessWidget {
  const BottomBannerAds({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TargetPlatform os = Theme.of(context).platform;
    BannerAd banner = BannerAd(
      listener: BannerAdListener(
        onAdFailedToLoad: (Ad ad, LoadAdError error) {},
        onAdLoaded: (_) {},
      ),
      size: AdSize.banner,
      adUnitId: UNIT_ID[os == TargetPlatform.iOS ? 'ios' : 'android']!,
      request: const AdRequest(),
    )..load();

    return AdWidget(
      ad: banner,
    );
  }
}
