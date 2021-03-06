import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter_lovers/model/konusma_model.dart';
import 'package:flutter_lovers/model/mesaj.dart';
import 'package:flutter_lovers/model/user.dart';

import 'package:flutter_lovers/services/database_base.dart';

class FirestoreDBService implements DBBase {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  @override
  Future<bool> saveUser(MyUser user) async {
    await _firebaseFirestore
        .collection("users")
        .doc(user.userId)
        .set(user.toMap());

    return true;
  }

  @override
  Future<MyUser> readUser(String userId) async {
    DocumentSnapshot _okunanUser =
        await _firebaseFirestore.doc("users/$userId").get();
    Map<String, dynamic> _okunanUserBilgileriMap =
        (_okunanUser.data() as Map<String, dynamic>);

    MyUser _okunanUserBilgileriNesne = MyUser.fromMap(_okunanUserBilgileriMap);

    print("Read User: " + _okunanUserBilgileriNesne.toString());
    return _okunanUserBilgileriNesne;
  }

  @override
  Future<bool> updateUserName(String userId, String newUserName) async {
    // burada newUserName değişkeninin değerinin aynısının olur olmadığını bulabiliriz
    // eğer sonuc 1 dönerse aynısı vardır
    // eğer sonuc 0 dönerse aynısı yoktur ve değiştirilebilir
    QuerySnapshot user = await _firebaseFirestore
        .collection("users")
        .where("userName", isEqualTo: newUserName)
        .get();
    if (user.docs.length >= 1) {
      // eğer length 1 ise aynı isimde kullanıcı var demektir
      return false;
    } else {
      await _firebaseFirestore
          .collection("users")
          .doc(userId)
          .update({"userName": newUserName});
      return true;
    }
  }

  Future<bool> updateProfilPhoto(String userId, String photoUrl) async {
    await _firebaseFirestore
        .collection("users")
        .doc(userId)
        .update({"profilURL": photoUrl});
    return true;
  }

  @override
  Future<List<MyUser>> getAllUesr() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await _firebaseFirestore.collection("users").get();
    List<MyUser> allUsers = [];
    for (QueryDocumentSnapshot<Map<String, dynamic>> tekUser
        in querySnapshot.docs) {
      MyUser _user = MyUser.fromMap(tekUser.data());
      allUsers.add(_user);
    }
    return allUsers;
  }

  @override
  Future<List<KonusmaModel>> getAllConversations(String userId) async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await _firebaseFirestore
        .collection("konusmalar")
        .where("konusma_sahibi", isEqualTo: userId)
        .orderBy("olusturulma_tarihi", descending: true)
        .get();

    List<KonusmaModel> tumKonusmalar = [];

    for (QueryDocumentSnapshot<Map<String, dynamic>> tekKonusma
        in querySnapshot.docs) {
      KonusmaModel _tekKonusma = KonusmaModel.fromMap(tekKonusma.data());
      /*print("okunan konusma tarisi:" +
          _tekKonusma.olusturulma_tarihi.toDate().toString());*/
      tumKonusmalar.add(_tekKonusma);
    }

    return tumKonusmalar;
  }

  @override
  Stream<List<Mesaj>> getMessages(
      String currentUserId, String sohbetEdilenUserId) {
    Stream<QuerySnapshot<Map<String, dynamic>>> _snapshot = _firebaseFirestore
        .collection("konusmalar")
        .doc(currentUserId + "--" + sohbetEdilenUserId)
        .collection("mesajlar")
        .orderBy("date", descending: true)
        .snapshots();
    return _snapshot.map((mesajListesi) =>
        mesajListesi.docs.map((mesaj) => Mesaj.fromMap(mesaj.data())).toList());
  }

  Future<bool> saveMessage(Mesaj mesaj) async {
    String _mesajID = _firebaseFirestore
        .collection("konusmalar")
        .doc()
        .id; // rastgele id almak

    String _myDocumentId =
        mesaj.kimden + "--" + mesaj.kime; // mesaj gönderen id
    String _receiverDocumentId =
        mesaj.kime + "--" + mesaj.kimden; // mesaj alıcı id
    Map<String, dynamic> _kaydedeilecekMesajMap = mesaj.toMap();
    await _firebaseFirestore
        .collection("konusmalar")
        .doc(_myDocumentId)
        .collection("mesajlar")
        .doc(_mesajID)
        .set(_kaydedeilecekMesajMap);

    await _firebaseFirestore.collection("konusmalar").doc(_myDocumentId).set({
      "konusma_sahibi": mesaj.kimden,
      "kimle_konusuyor": mesaj.kime,
      "son_yollanan_mesaj": mesaj.message,
      "konusma_goruldu": false,
      "olusturulma_tarihi": FieldValue.serverTimestamp(),
    });

    // yukarıdaki kayıttan sonra sohbet edilen kişiyede kayıt yapılmalı
    // bunun için "kimden" değişkenini değiştirmek gerekir

    await _kaydedeilecekMesajMap.update("bendenMi", (value) => false);

    await _firebaseFirestore
        .collection("konusmalar")
        .doc(_receiverDocumentId)
        .collection("mesajlar")
        .doc(_mesajID)
        .set(_kaydedeilecekMesajMap);

    await _firebaseFirestore
        .collection("konusmalar")
        .doc(_receiverDocumentId)
        .set({
      "konusma_sahibi": mesaj.kime,
      "kimle_konusuyor": mesaj.kimden,
      "son_yollanan_mesaj": mesaj.message,
      "konusma_goruldu": false,
      "olusturulma_tarihi": FieldValue.serverTimestamp(),
    });
    return true;
  }

  @override
  Future<DateTime> saatiGoster(String userId) async {
    await _firebaseFirestore
        .collection("server")
        .doc(userId)
        .set({"saat": FieldValue.serverTimestamp()});

    DocumentSnapshot okunanMap =
        await _firebaseFirestore.collection("server").doc(userId).get();
    Timestamp okunanTarih = okunanMap["saat"];

    return okunanTarih.toDate();
  }

/* 
  @override
  Future<List<MyUser>> getUserwithPagination(
      MyUser enSonGetirilenUser, int getirilecekElemanSayisi) async {
    QuerySnapshot _querySnapshot;
    List<MyUser> _tumKullanicilar = [];

    if (enSonGetirilenUser == null) {
      _querySnapshot = await FirebaseFirestore.instance
          .collection("users")
          .orderBy("userName")
          .limit(getirilecekElemanSayisi)
          .get();
    } else {
      _querySnapshot = await FirebaseFirestore.instance
          .collection("users")
          .orderBy("userName")
          .startAfter([enSonGetirilenUser.userName])
          .limit(getirilecekElemanSayisi)
          .get();

      await Future.delayed(Duration(seconds: 1));
    }

   

    return _tumKullanicilar;
  }

  Future<List<MessageModel>> getMessagewithPagination(
      String currentUserID,
      String sohbetEdilenUserID,
      MessageModel enSonGetirilenMesaj,
      int getirilecekElemanSayisi) async {
    QuerySnapshot _querySnapshot;
    List<MessageModel> _tumMesajlar = [];

    if (enSonGetirilenMesaj == null) {
      _querySnapshot = await FirebaseFirestore.instance
          .collection("konusmalar")
          .doc(currentUserID + "--" + sohbetEdilenUserID)
          .collection("mesajlar")
          .where("konusmaSahibi", isEqualTo: currentUserID)
          .orderBy("date", descending: true)
          .limit(getirilecekElemanSayisi)
          .get();
    } else {
      _querySnapshot = await FirebaseFirestore.instance
          .collection("konusmalar")
          .doc(currentUserID + "--" + sohbetEdilenUserID)
          .collection("mesajlar")
          .where("konusmaSahibi", isEqualTo: currentUserID)
          .orderBy("date", descending: true)
          .startAfter([enSonGetirilenMesaj.date])
          .limit(getirilecekElemanSayisi)
          .get();

      await Future.delayed(Duration(seconds: 1));
    }

   

    return _tumMesajlar;
  } */

}
