import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_lovers/model/mesaj.dart';
import 'package:flutter_lovers/model/user.dart';

import 'package:flutter_lovers/services/database_base.dart';

class FirestoreDBService implements DBBase {
  final FirebaseFirestore _firebaseDB = FirebaseFirestore.instance;
  @override
  Future<bool> saveUser(MyUser user) async {
    await _firebaseDB.collection("users").doc(user.userID).set(user.toMap());
    DocumentSnapshot _okunanUser =
        await FirebaseFirestore.instance.doc("users/${user.userID}").get();

    return true;
  }

  @override
  Future<MyUser> readUser(String userID) async {
    DocumentSnapshot _okunanUser =
        await _firebaseDB.collection("users").doc(userID).get();
    Map<String, dynamic> _okunanUserBilgileriMap =
        (_okunanUser.data() as Map<String, dynamic>);

    MyUser _okunanUserNesnesi = MyUser.fromMap(_okunanUserBilgileriMap);
    print("Okunan  User nesnesi: " + _okunanUserNesnesi.toString());
    return _okunanUserNesnesi;
  }

  @override
  Future<bool> updateUserName(String userID, String yeniUserName) async {
    QuerySnapshot user = await _firebaseDB
        .collection("users")
        .where("userName", isEqualTo: yeniUserName)
        .get();
    //aynı isimde kullanıcı var demektir
    if (user.docs.length >= 1) {
      return false;
    } else {
      await _firebaseDB
          .collection("users")
          .doc(userID)
          .update({"userName": yeniUserName});
      return true;
    }
  }

  Future<bool> updateProfilFoto(String userID, String profilFotoUrl) async {
    await _firebaseDB
        .collection("users")
        .doc(userID)
        .update({"profilURL": profilFotoUrl});
    return true;
  }

  @override
  Future<List<MyUser>> getAllUserr() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await _firebaseDB.collection("users").get();
    List<MyUser> allUsers = [];
    for (QueryDocumentSnapshot<Map<String, dynamic>> tekKullanici
        in querySnapshot.docs) {
      MyUser _user = MyUser.fromMap(tekKullanici.data());
     // print("okunan user:" + tekKullanici.data().toString());
      allUsers.add(_user);
    }
    return allUsers;
    ;
  }

  @override
  Stream<List<Mesaj>> getMessages(
      String currentUserID, String sohbetEdilenUserID) {
    Stream<QuerySnapshot<Map<String, dynamic>>> _snapshot = _firebaseDB
        .collection("konusmalar")
        .doc(currentUserID + "--" + sohbetEdilenUserID)
        .collection("mesajlar")
        .orderBy("date", descending: true)
        .snapshots();
    return _snapshot.map((mesajListesi) => mesajListesi.docs
        .map((mesaj) => Mesaj.fromMap(mesaj.data()))
        .toList());
  }
}
