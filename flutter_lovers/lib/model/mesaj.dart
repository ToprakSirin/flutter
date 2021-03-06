import 'package:cloud_firestore/cloud_firestore.dart';

class Mesaj {
  final String kimden;
  final String kime;
  final String message;
  final bool bendenMi;
  final Timestamp? date;
  Mesaj({
    required this.kimden,
    required this.kime,
    required this.message,
    required this.bendenMi,
    this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      "kimden": kimden,
      "kime": kime,
      "message": message,
      "bendenMi": bendenMi,
      "date": date ?? FieldValue.serverTimestamp(),
    };
  }

  Mesaj.fromMap(Map<String, dynamic> map)
      : kimden = map["kimden"],
        kime = map["kime"],
        message = map["message"],
        bendenMi = map["bendenMi"],
        date = map["date"];

  @override
  String toString() {
    return 'MessageModel(kimden: $kimden, kime: $kime, message: $message, bendenMi: $bendenMi, date: $date)';
  }
}