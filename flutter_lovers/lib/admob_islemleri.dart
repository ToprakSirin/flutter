import 'package:firebase_admob/firebase_admob.dart';

class AdmobIslemleri {
  static final String appIDCanli = "ca-app-pub-3940256099942544~3347511713";
  //"ca-app-pub-3056391869302143~1619121972";
  static final String appIDTest = FirebaseAdMob.testAppId;
  static int kacKereGosterildi = 0;
  static final String banner1Canli = "ca-app-pub-3056391869302143/5434050383";

  static final String odulluReklamTest = RewardedVideoAd.testAdUnitId;

  static admobInitialize() {
    FirebaseAdMob.instance.initialize(appId: appIDTest);
  }

  static BannerAd? myBannerAd;

  static final MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    keywords: <String>['flutter', 'chat app'],
    contentUrl: ' ',
    childDirected: false,
    testDevices: <String>[
      "68C58FF8AC07663D32A29116FBC317F0",
      "578FB3D680F288A70781109F24275F24"
    ], // Android emulators are considered test devices
  );

  static BannerAd buildBannerAd() {
    return BannerAd(
      adUnitId: BannerAd.testAdUnitId,
      size: AdSize.smartBanner,
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        if (event == MobileAdEvent.loaded) {
          print("Banner yüklendi");
        }
      },
    );
  }

  static InterstitialAd buildInterstitialAd() {
    return InterstitialAd(
      adUnitId: InterstitialAd.testAdUnitId,
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        print("InterstitialAd event is $event");
      },
    );
  }
}
