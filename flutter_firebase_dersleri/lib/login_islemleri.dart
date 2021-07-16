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
              onPressed: _resetPassword,
              child: Text(
                "Şifremi Unuttum",
              ),
              style: ElevatedButton.styleFrom(primary: Colors.pink),
            ),
            ElevatedButton(
              onPressed: _updatePassword,
              child: Text(
                "Şifremi Güncelle",
              ),
              style: ElevatedButton.styleFrom(primary: Colors.purpleAccent),
            ),
            ElevatedButton(
              onPressed: _updateEmail,
              child: Text(
                "Email Güncelle",
              ),
              style: ElevatedButton.styleFrom(primary: Colors.brown),
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
    String _password = "password2";

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
    String _password = "password2";

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

  void _resetPassword() async {
    String _email = "sirintprk21@gmail.com";
    try {
      await _auth.sendPasswordResetEmail(email: _email);
      debugPrint("Resetleme maili gönderildi");
    } catch (e) {
      debugPrint("Şifre resetlenirken hata $e");
    }
  }

  void _updatePassword() async {
    try {
      await _auth.currentUser!.updatePassword("paswword3");
      debugPrint("Şifreniz güncellendi");
    } catch (e) {
      try {
        String email = "sirintprk21@gmail.com";
        String password = "password3";

        AuthCredential credential =
            EmailAuthProvider.credential(email: email, password: password);
        await FirebaseAuth.instance.currentUser!
            .reauthenticateWithCredential(credential);
        debugPrint("Girilen eski email şifre bilgisi doğru");
        await _auth.currentUser!.updatePassword("paswword3");
        debugPrint("Auth yeniden sağlandı,şifrede güncellendi");
      } catch (e) {
        debugPrint("hata çıktı $e");
      }
      debugPrint("Şifre güncellenirken hata çıktı $e");
    }
  }

  void _updateEmail() async {
    try {
      await _auth.currentUser!.updateEmail("emre@emre.com");
      debugPrint("Email güncellendi");
    } on FirebaseAuthException catch (e) {
      try {
        //kullanıcıdan eski oturum bilgilerini girmesi istenir.
        String email = "sirintprk21@gmail.com";
        String password = "password3";

        AuthCredential credential =
            EmailAuthProvider.credential(email: email, password: password);
        await FirebaseAuth.instance.currentUser!
            .reauthenticateWithCredential(credential);

        //güncel email ve şifre bilgisi doğruysa eski şifre yenisiyle güncellenir.
        debugPrint("Girilen eski email şifre bilgisi doğru");
        await _auth.currentUser!.updatePassword("emre@emre.com");
        debugPrint("Auth yeniden sağlandı,şifrede güncellendi");
      } catch (e) {
        debugPrint("hata çıktı $e");
      }
      debugPrint("Email güncellenirken hata çıktı $e");
    }
  }
}
