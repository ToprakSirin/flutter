import 'package:flutter/material.dart';
import 'package:flutter_storage_dersleri/shared_pref_kullanimi.dart';
import 'package:flutter_storage_dersleri/sqflite_kullanimi.dart';
import 'package:flutter_storage_dersleri/utils/database_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dosya_islemleri.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  DatabaseHelper dbh1 = DatabaseHelper();
  DatabaseHelper dbh2 = DatabaseHelper();
  DatabaseHelper dbh3 = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
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
