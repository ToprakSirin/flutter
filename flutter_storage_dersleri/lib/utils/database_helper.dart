import 'dart:async';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  static Database? _database;

  String _ogrenciTablo = "ogrenci";
  String _columnID = "id";
  String _columnIsim = "isim";
  String _columnAktif = "aktif";

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._internal();
      print("DBHelper nulldi oluştuturuldu.");
      return _databaseHelper!;
    } else {
      print("DBHelper null değiildi var olan kullanılacak.");
      return _databaseHelper!;
    }
  }

  DatabaseHelper._internal();
  Future<Database> _getDatabase() async {
    if (_database == null) {
      print("DB nulldi oluştuturuldu.");
      _database = await _initializeDatabase();
      return _database!;
    } else {
      print("DB null değiildi var olan kullanılacak.");
      return _database!;
    }
  }

  _initializeDatabase() async {
    Directory klasor =
        await getApplicationDocumentsDirectory(); //"c://Users/sirin/ogrenci.db"
    String dbPath = join(klasor.path, 'ogrenci.db');
    print("DB Pathi :" + dbPath);

    var ogrenciDB = openDatabase(dbPath, version: 1, onCreate: _createDB);
    return ogrenciDB;
  }

  FutureOr<void> _createDB(Database db, int version) async {
    print("Create db metotu çalıştı , tablo oluşturuldu...");
    await db.execute(
        "CREATE TABLE $_ogrenciTablo ($_columnID INTEGER PRIMARY KEY AUTOINCREMENT ,$_columnIsim TEXT, $_columnAktif INTEGER ");
  }
}
