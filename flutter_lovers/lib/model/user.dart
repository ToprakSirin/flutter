import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';

class MyUser {
  String? userID;
  String? email;
  String? userName;
  String? profilURL;
  DateTime? creadeAt;
  DateTime? updatedAt;
  int? seviye;

  MyUser({required this.userID, required this.email});

  Map<String, dynamic> toMap() {
    return {
      'userID': userID,
      'email': email,
      'userName': userName ??
          email!.substring(0, email!.indexOf("@")) + randomSayiUret(),
      'profilURL': profilURL ??
          'https://w7.pngwing.com/pngs/81/570/png-transparent-profile-logo-computer-icons-user-user-blue-heroes-logo-thumbnail.png',
      'creadeAt': creadeAt ?? FieldValue.serverTimestamp(),
      'updatedAt': updatedAt ?? FieldValue.serverTimestamp(),
      'seviye': seviye ?? '',
    };
  }

  MyUser.fromMap(Map<String, dynamic> map)
      : userID = map['userID'],
        email = map['email'],
        userName = map['userName'],
        profilURL = map['profilURL'],
        creadeAt = (map['creadeAt'] as Timestamp).toDate(),
        updatedAt = (map['updatedAt'] as Timestamp).toDate(),
        seviye = map['seviye'];
        

        @override
        String toString() {
        return   "User{ userId: $userID, email: $email, userName: $userName, profilURL: $profilURL, createAt: $creadeAt, updateAt: $updatedAt}";
         }

  String randomSayiUret() {
    int rastgeleSayi = Random().nextInt(999999);
    return rastgeleSayi.toString();
  }
}
