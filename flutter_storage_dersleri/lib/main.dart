import 'package:flutter/material.dart';
import 'package:flutter_storage_dersleri/model/ogrenci.dart';
import 'package:flutter_storage_dersleri/shared_pref_kullanimi.dart';
import 'package:flutter_storage_dersleri/sqflite_kullanimi.dart';
import 'package:flutter_storage_dersleri/utils/database_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dosya_islemleri.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  DatabaseHelper dbh2 = DatabaseHelper();

  @override
  Widget build(BuildContext context) {

   dbh2.ogrenciEkle(Ogrenci("emre", 1));

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SqfliteIslemleri(),
    );
  }
}

