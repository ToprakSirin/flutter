import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_navigations/main.dart';
import 'package:flutter_navigations/ogrenci_detay.dart';
import 'package:flutter_navigations/ogrenci_listesi.dart';
import 'package:flutter_navigations/orange_page.dart';
import 'package:flutter_navigations/yellow_page.dart';

class RouteGenerator {
  static Route<dynamic>? _routeOlustur(
      Widget gidilecekWidget, RouteSettings settings) {
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      return CupertinoPageRoute(
        settings: settings,
        builder: (context) => gidilecekWidget,
      );
    } else if (defaultTargetPlatform == TargetPlatform.android) {
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => gidilecekWidget,
      );
    } else
      return CupertinoPageRoute(
        settings: settings,
        builder: (context) => gidilecekWidget,
      );
  }

  static Route<dynamic>? routeGenerator(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _routeOlustur(AnaSayfa(), settings);

      case '/OrangePage':
        return _routeOlustur(OrangePage(), settings);
      case '/yellowPage':
        return _routeOlustur(YellowPage(), settings);
      case '/ogrenciListesi':
        print(settings.name);
        print(settings.arguments);
        return _routeOlustur(OgrenciListesi(), settings);
      case '/ogrenciDetay':
        var parametredkiOgrenci = settings.arguments as Ogrenci;
        return _routeOlustur(
            OgrenciDetay(secilenOgrenci: parametredkiOgrenci), settings);

      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            appBar: AppBar(
              title: Text('404'),
            ),
            body: Center(
              child: Text('Sayfa Bulunamadı'),
            ),
          ),
        );
    }
  }
}
