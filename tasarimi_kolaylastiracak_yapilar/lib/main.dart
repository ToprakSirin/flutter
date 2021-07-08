import 'package:flutter/material.dart';
import 'package:tasarimi_kolaylastiracak_yapilar/drawer_menu.dart';
import 'package:tasarimi_kolaylastiracak_yapilar/kisisel_font_kullanimi.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerMenu(),
      appBar: AppBar(
        title: Text("Flutter Dersleri Bölüm 23"),
      ),
      body: KisiselFont(),
      bottomNavigationBar: Theme(
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
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: secilenMenuItem,
          fixedColor: Colors.indigo,
          onTap: (index) {
            setState(() {
              secilenMenuItem = index;
            });
          },
        ),
      ),
    );
  }
}
