import 'package:flutter/material.dart';
import 'package:tasarimi_kolaylastiracak_yapilar/ana_sayfa.dart';
import 'package:tasarimi_kolaylastiracak_yapilar/arama.dart';
import 'package:tasarimi_kolaylastiracak_yapilar/drawer_menu.dart';
import 'package:tasarimi_kolaylastiracak_yapilar/kisisel_font_kullanimi.dart';
import 'package:tasarimi_kolaylastiracak_yapilar/user.dart';

import 'ekle.dart';
import 'page_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Genel',
        primarySwatch: Colors.amber,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int secilenMenuItem = 0;
  late List<Widget> tumSayfalar;
  late Anasayfa sayfaAna;
  late AramaSayfasi sayfaArama;
  late Ekle sayfaEkle;
  late UserSayfasi sayfaUser;
  late PageViewOrnek pageViewOrnek;

  var keyAnaSayfa = PageStorageKey("key_ana_sayfa");
  var keyArama = PageStorageKey("key_arama_sayfa");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sayfaAna = Anasayfa(keyAnaSayfa);
    sayfaArama = AramaSayfasi(keyArama);
    sayfaEkle = Ekle();
    sayfaUser = UserSayfasi();
    pageViewOrnek = PageViewOrnek();
    tumSayfalar = [sayfaAna, sayfaArama, sayfaEkle, sayfaUser, pageViewOrnek];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerMenu(),
      appBar: AppBar(
        title: Text("Flutter Dersleri Bölüm 23"),
      ),
      body: secilenMenuItem <= tumSayfalar.length - 1
          ? tumSayfalar[secilenMenuItem]
          : tumSayfalar[secilenMenuItem],
      bottomNavigationBar: BottomNavMenu(),
    );
  }

  Theme BottomNavMenu() {
    return Theme(
      data: ThemeData(
        canvasColor: Colors.green,
        primaryColor: Colors.orange,
      ),
      child: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("Anasayfa"),
              backgroundColor: Colors.amber),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              activeIcon: Icon(Icons.call),
              title: Text("Ara"),
              backgroundColor: Colors.red),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            title: Text("Ekle"),
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box),
              title: Text("Profil"),
              backgroundColor: Colors.orange),
          BottomNavigationBarItem(
              icon: Icon(Icons.cached),
              title: Text("PageView"),
              backgroundColor: Colors.orange),
        ],
        type: BottomNavigationBarType.shifting,
        currentIndex: secilenMenuItem,
        fixedColor: Colors.indigo,
        onTap: (index) {
          setState(() {
            secilenMenuItem = index;
          });
        },
      ),
    );
  }
}
