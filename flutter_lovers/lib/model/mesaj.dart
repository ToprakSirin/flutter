import 'package:cloud_firestore/cloud_firestore.dart';

class Mesaj {
  final String kimden;
  final String kime;
  final String mesaj;
  final bool bendenMi;
  final DateTime? date;

  Mesaj({
    required this.kimden,
    required this.kime,
    required this.mesaj,
    required this.bendenMi,
    this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      "kimden": kimden,
      "kime": kime,
      "message": mesaj,
      "bendenMi": bendenMi,
      "date": date ?? FieldValue.serverTimestamp(),
    };

  }
   Mesaj.fromMap(Map<String, dynamic> map)
      : kimden = map["kimden"],
        kime = map["kime"],
        mesaj = map["mesaj"],
        bendenMi = map["bendenMi"],
        date = map["date"];
}
