import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginIslemleri extends StatefulWidget {
  LoginIslemleri({Key? key}) : super(key: key);

  @override
  _LoginIslemleriState createState() => _LoginIslemleriState();
}

class _LoginIslemleriState extends State<LoginIslemleri> {
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _auth.authStateChanges().listen((User? user) {
      if (user != null) {
        print('Kullanıcı oturumu açtı!');
      } else {
        print('Kullanıcı oturumu kapattı!');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Islmeleri"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: _emailSifreKullaniciOlustur,
              child: Text(
                "Email/Şifre User Create",
              ),
              style: ElevatedButton.styleFrom(primary: Colors.blue),
            ),
            ElevatedButton(
              onPressed: _emailSifreKullaniciGirisYap,
              child: Text(
                "Email/Şifre User Login",
              ),
              style: ElevatedButton.styleFrom(primary: Colors.green),
            ),
            ElevatedButton(
              onPressed: _cikisYap,
              child: Text(
                "Çıkış Yap",
              ),
              style: ElevatedButton.styleFrom(primary: Colors.yellow),
            ),
          ],
        ),
      ),
    );
  }

  void _emailSifreKullaniciOlustur() async {
    String _email = "sirintprk21@gmail.com";
    String _password = "password";

    try {
      UserCredential _credential = await _auth.createUserWithEmailAndPassword(
          email: _email, password: _password);
      User? _yeniUser = _credential.user;
      await _yeniUser!.sendEmailVerification();
      if (_auth.currentUser != null) {
        debugPrint("Size bir mail attık lütfen onaylayınız.");
        await _auth.signOut();
      } else {
        debugPrint("Kullanıcı sistemden attık");
      }
      debugPrint(_yeniUser.toString());
    } catch (e) {
      debugPrint("*******HATA VAR************************");
      debugPrint(e.toString());
    }
  }

  void _emailSifreKullaniciGirisYap() async {
    String _email = "sirintprk21@gmail.com";
    String _password = "password";

    try {
      if (_auth.currentUser == null) {
        User? _oturumAcanUser = (await _auth.signInWithEmailAndPassword(
                email: _email, password: _password))
            .user;
        if (_oturumAcanUser!.emailVerified) {
          debugPrint("Mail onaylı ana sayfaya gidilebilr.");
        } else {
          debugPrint("Lütfen mailinizi onaylayıp tekrar giriş yapın");
          _auth.signOut();
        }
      } else {
        debugPrint("Otrum açmış kullanıcı zaten var");
      }
    } catch (e) {
      debugPrint("**********Hata Var**********");
      debugPrint(e.toString());
    }
  }

  void _cikisYap() async {
    if (_auth.currentUser != null) {
      await _auth.signOut();
    } else {
      debugPrint("Zaten oturum açmış bir kullanıcı yok");
    }
  }
}
