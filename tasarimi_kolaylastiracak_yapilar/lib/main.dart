import 'package:flutter/material.dart';

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

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Şirin Toprak"),
              accountEmail: Text("sirintprk@gmail.com"),
              currentAccountPicture: Image.network(
                  "https://n11scdn.akamaized.net/a1/450/otomotiv-motosiklet/arma-sticker/otografik-sirine-sirinler-oto-sticker__0967917542860523.jpg"),
              otherAccountsPictures: [
                CircleAvatar(
                  backgroundColor: Colors.purple,
                  child: Text("AK"),
                ),
                CircleAvatar(
                  backgroundColor: Colors.green,
                  child: Text("BA"),
                ),
              ],
            ),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: Icon(Icons.home),
                    title: Text("Ana Sayfa"),
                    trailing: Icon(Icons.chevron_right),
                  ),
                  ListTile(
                    leading: Icon(Icons.call),
                    title: Text("Ara"),
                    trailing: Icon(Icons.chevron_right),
                  ),
                  ListTile(
                    leading: Icon(Icons.account_box),
                    title: Text("Profil"),
                    trailing: Icon(Icons.chevron_right),
                  ),
                  Divider(),
                  InkWell(
                    onTap: () {},
                    splashColor: Colors.cyan,
                    child: ListTile(
                      leading: Icon(Icons.home),
                      title: Text("Ana Sayfa"),
                      trailing: Icon(Icons.chevron_right),
                    ),
                  ),
                  AboutListTile(
                    applicationName: "Flutter Dersleri",
                    applicationIcon: Icon(Icons.save),
                    applicationVersion: "2.0",
                    child: Text("About Us"),
                    applicationLegalese: null,
                    icon: Icon(Icons.keyboard),
                    aboutBoxChildren: [
                      Text("data"),
                      Text("data"),
                      Text("data"),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("Flutter Dersleri Bölüm 23"),
      ),
      body: Column(
        children: [
          Center(
            child: Text(
              "Kişisel Font Kullanımı",
              style: TextStyle(
                  fontFamily: 'ElYazisi',
                  fontSize: 36,
                  fontWeight: FontWeight.w700),
            ),
          ),
          Center(
            child: Text(
              "Kişisel Font Kullanımı",
              style: TextStyle(
                  fontFamily: 'Genel',
                  fontSize: 36,
                  fontWeight: FontWeight.w700),
            ),
          ),
          Center(
            child: Text(
              "Kişisel Font Kullanımı",
              style: TextStyle(
                fontFamily: 'Genel',
                fontSize: 36,
              ),
            ),
          ),
          Center(
            child: Text(
              "Kişisel Font Kullanımı12",
              style: TextStyle(
                fontSize: 36,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
