import 'package:flutter/material.dart';
import 'package:flutter_storage_dersleri/model/ogrenci.dart';
import 'package:sqflite/sqflite.dart';

class SqfliteIslemleri extends StatefulWidget {
  SqfliteIslemleri({Key? key}) : super(key: key);

  @override
  _SqfliteIslemleriState createState() => _SqfliteIslemleriState();
}

class _SqfliteIslemleriState extends State<SqfliteIslemleri> {
  @override
  Widget build(BuildContext context) {
    Ogrenci emre = Ogrenci.withID(
      100,
      "emre",
    );
    Map<String, dynamic> olusanMap = emre.dbyeYazmakIcinMapeDonustur();
    debugPrint(olusanMap['ad_soyad'].toString());

    Ogrenci kopyaEmre = Ogrenci.dbdenOkudugunMapiObjeyeDonustur(olusanMap);
    debugPrint(kopyaEmre.toString());

    return Scaffold(
      appBar: AppBar(
        title: Text("Sqflite Kullanimi"),
      ),
      body: Center(
        child: Text("Boş"),
      ),
    );
  }
}
