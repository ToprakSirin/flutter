import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

enum KullaniciDurumu { OturumAcilmis, OturumAcilmamis, OturumAciliyor }

class AuthService with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  KullaniciDurumu _durum = KullaniciDurumu.OturumAcilmamis;

  KullaniciDurumu get durum => this._durum;

  set durum(KullaniciDurumu value) {
    this._durum = value;
    notifyListeners();
  }

  AuthService() {
    _auth.authStateChanges().listen(_authStateChanged);
  }

  void _authStateChanged(User? user) {
    if (user == null) {
      durum = KullaniciDurumu.OturumAcilmamis;
    } else {
      durum = KullaniciDurumu.OturumAcilmis;
    }
  }

  Future<User> createUserWithEmailandPassword(
      String email, String sifre) async {
    try {
      durum = KullaniciDurumu.OturumAciliyor;
      UserCredential _credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: sifre);
      User? _yeniKullanici = _credential.user;
      return _yeniKullanici!;
    } catch (e) {
      durum = KullaniciDurumu.OturumAcilmamis;

      debugPrint("create userda Hata çıktı $e");
      return null!;
    }
  }

  Future<User> signInWithEmailAndPassword(String email, String sifre) async {
    try {
      durum = KullaniciDurumu.OturumAciliyor;
      UserCredential _credential =
          await _auth.signInWithEmailAndPassword(email: email, password: sifre);
      User? _yeniKullanici = _credential.user;
      return _yeniKullanici!;
    } catch (e) {
      durum = KullaniciDurumu.OturumAcilmamis;

      debugPrint("sign in metotudunda hata çıktı $e");
      return null!;
    }
  }

  Future<bool> signOut() async {
    try {
      await _auth.signOut();
      return true;
    } catch (e) {
      debugPrint("sign out metotudunda hata çıktı $e");
      return false;
    }
  }
}
