import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lovers/admob_islemleri.dart';
import 'package:flutter_lovers/app/tabs_item.dart';

class MyCustomBottomNavigation extends StatefulWidget {
  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectedTab;
  final Map<TabItem, Widget> sayfaOlustur;
  final Map<TabItem, GlobalKey<NavigatorState>> navigatorKeys;

  MyCustomBottomNavigation(
      {required this.currentTab,
      required this.onSelectedTab,
      required this.sayfaOlustur,
      required this.navigatorKeys});

  @override
  _MyCustomBottomNavigationState createState() =>
      _MyCustomBottomNavigationState();
}

class _MyCustomBottomNavigationState extends State<MyCustomBottomNavigation> {
  BannerAd? myBannerAd;

  @override
  void initState() {
    super.initState();
    AdmobIslemleri.admobInitialize();
    myBannerAd = AdmobIslemleri.buildBannerAd();
    myBannerAd!.load();
  }

  @override
  void dispose() {
    myBannerAd!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // biden fazla navigator isteniryorsa CupertinoTabScaffold kullanılabilir
    myBannerAd!
      ..load()
      ..show(anchorOffset: 0);

    return Column(
      children: [
        Expanded(
          child: CupertinoTabScaffold(
            tabBar: CupertinoTabBar(
              items: [
                _bottomNavigationBarItem(TabItem.Kullanicilar),
                _bottomNavigationBarItem(TabItem.Konusmalarim),
                _bottomNavigationBarItem(TabItem.Profil),
              ],
              onTap: (index) => widget.onSelectedTab(TabItem.values[index]),
            ),
            tabBuilder: (context, index) {
              final gosterilecekItem = TabItem.values[index];
              return CupertinoTabView(
                navigatorKey: widget.navigatorKeys[gosterilecekItem],
                builder: (context) {
                  return widget.sayfaOlustur[gosterilecekItem]!;
                },
              );
            },
          ),
        ),
        SizedBox(
          height: 45,
        ),
      ],
    );
  }

  BottomNavigationBarItem _bottomNavigationBarItem(TabItem tabItem) {
    final _olusturulacakTab = TabItemData.tumTablar[tabItem];
    return BottomNavigationBarItem(
      icon: Icon(_olusturulacakTab!.icon),
      label: _olusturulacakTab.labelText,
    );
  }
}
