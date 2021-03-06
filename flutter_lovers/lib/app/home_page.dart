import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lovers/admob_islemleri.dart';
import 'package:flutter_lovers/app/konusmalarim.dart';
import 'package:flutter_lovers/app/kullanicilar.dart';
import 'package:flutter_lovers/app/my_custom_bottom_navigaton.dart';
import 'package:flutter_lovers/app/profil.dart';
import 'package:flutter_lovers/app/tabs_item.dart';
import 'package:flutter_lovers/model/user.dart';

//sadece oturum açmış kullanıcıların görmesi gereken sayfa

class HomePage extends StatefulWidget {
  final MyUser user;
  HomePage({required this.user});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TabItem _currentTab = TabItem.Kullanicilar;

  Map<TabItem, Widget> tumSayfalar() {
    return {
      TabItem.Kullanicilar: KullanicilarPage(),
      TabItem.Konusmalarim: KonusmalarimPage(),
      TabItem.Profil: ProfilPage(),
    };
  }

  Map<TabItem, GlobalKey<NavigatorState>> navigatorKeys = {
    TabItem.Kullanicilar: GlobalKey<NavigatorState>(),
    TabItem.Konusmalarim: GlobalKey<NavigatorState>(),
    TabItem.Profil: GlobalKey<NavigatorState>(),
  };

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async =>
          !await navigatorKeys[_currentTab]!.currentState!.maybePop(),
      child: MyCustomBottomNavigation(
        sayfaOlustur: tumSayfalar(),
        navigatorKeys: navigatorKeys,
        currentTab: _currentTab,
        onSelectedTab: (secilenTab) {
          if (AdmobIslemleri.myBannerAd != null &&
              AdmobIslemleri.myBannerAd!.id != null) {
            print(
                " #################### banner null değil dispose edilecek ######################");
            try {
              AdmobIslemleri.myBannerAd!.dispose();
              AdmobIslemleri.myBannerAd = null;
            } catch (e) {
              print("hata:" + e.toString());
            }
          }
          if (secilenTab == _currentTab) {
            navigatorKeys[secilenTab]!
                .currentState!
                .popUntil((route) => route.isFirst);
            // is first ile stacteki ilk elemana kadar pop yapmış olduk
          } else {
            setState(() {
              _currentTab = secilenTab;
              /** 
               * refresh kullanımı olmaz ise buradaki kodlar ile anlık güncelleme yapılabilir
              if (_currentTab == TabItem.Konusmalarim) {
                (context as Element).reassemble(); // yeniden build etmeye yarar
              }*/
            });
          }
          print("Secilen tab: " + secilenTab.toString());
        },
      ),
    );
  }
}
