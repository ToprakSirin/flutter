import 'package:flutter/material.dart';
import 'package:flutter_json_http/remote_api.dart';

import 'local_json.dart';

void main() {
  runApp(MyApp());
}

class Ogrenci {
  int id;
  String isim;

  Ogrenci(this.id, this.isim);
  @override
  String toString() {
    return "Adı: $isim id:$id";
  }

  factory Ogrenci.mapNesneyeDonustur(Map<String, dynamic> gelenMap) {
    return Ogrenci(gelenMap['id'], gelenMap['isim']);
  }
  Ogrenci.fromMap(Map<String, dynamic> gelenMap)
      : id = gelenMap['id'],
        isim = gelenMap['isim'];
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Ogrenci emre = Ogrenci(10, "emre");
    debugPrint(emre.toString());

    Map<String, dynamic> hasanMaP = {'id': 15, 'isim': "Hasan"};
    debugPrint("Adı :" + hasanMaP['isim'] + "id:" + hasanMaP['id'].toString());
    Ogrenci yeni = Ogrenci.mapNesneyeDonustur(hasanMaP);
    debugPrint(yeni.toString());

    Map<String, dynamic> fatmaMaP = {'id': 20, 'isim': "Fatma"};
    Ogrenci fatma = Ogrenci.fromMap(fatmaMaP);
    debugPrint(fatma.toString());

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Json ve Api"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              child: Text("Local Json"),
              style: ElevatedButton.styleFrom(primary: Colors.green),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => LocalJsonKullanimi(),
                  ),
                );
              },
            ),
            ElevatedButton(
              child: Text("Remote API"),
              style: ElevatedButton.styleFrom(primary: Colors.green),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => RemoteApiKullanimi(),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
