import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lovers/app/tabs_item.dart';

class MyCustomBottomNavigaton extends StatelessWidget {
  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectedTab;
  final Map<TabItem, Widget> sayfaOlusturucu;
  final Map<TabItem, GlobalKey<NavigatorState>> navigatorKeys;

  const MyCustomBottomNavigaton(
      {Key? key,
      required this.currentTab,
      required this.onSelectedTab,
      required this.sayfaOlusturucu,
      required this.navigatorKeys})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          _navItemOlustur(TabItem.Kullanicilar),
          _navItemOlustur(TabItem.Profil),
        ],
        onTap: (index) => onSelectedTab(TabItem.values[index]),
      ),
      tabBuilder: (context, index) {
        final gosterilecekItem = TabItem.values[index];
        return CupertinoTabView(
          
           navigatorKey: navigatorKeys[gosterilecekItem],
          builder: (context) {
          return sayfaOlusturucu[gosterilecekItem]!;
        });
      },
    );
  }

  BottomNavigationBarItem _navItemOlustur(TabItem tabItem) {
    final _olusturulacakTab = TabItemData.tumTablar[tabItem];
    return BottomNavigationBarItem(
      icon: Icon(_olusturulacakTab!.icon),
      label: _olusturulacakTab.labelText,
    );
  }
}
