import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

FirebaseAuth _auth = FirebaseAuth.instance;

class LoginIslemleri extends StatefulWidget {
  LoginIslemleri({Key? key}) : super(key: key);

  @override
  _LoginIslemleriState createState() => _LoginIslemleriState();
}

class _LoginIslemleriState extends State<LoginIslemleri> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _auth.authStateChanges().listen((User? user) {
      if (user == null) {
        print('Kullanıcı oturumu kapattı veya yok!');
      } else {
        if (user.emailVerified) {
          print('Kullanıcı oturumu açtı ve emali onaylı!');
        } else {
          print('Kullanıcı oturumu açtı ve emali onaylı değil!');
        }
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
              onPressed: _googleIleGiris,
              child: Text(
                "Gmail ile giriş",
              ),
              style: ElevatedButton.styleFrom(primary: Colors.teal),
            ),
            ElevatedButton(
              onPressed: _telNoGiris,
              child: Text(
                "Telefon No ile giriş",
              ),
              style: ElevatedButton.styleFrom(primary: Colors.teal),
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
      User? yeniUser = _credential.user;
      await yeniUser!.sendEmailVerification();
      if (_auth.currentUser != null) {
        debugPrint("Email gönderildi lütfen onaylayınız.");
        await _auth.signOut();
      } else {
        debugPrint("Kullanıcı oturumdan atıldı");
      }
      debugPrint(yeniUser.toString());
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
          print("Oturum açma başarılı");
        } else {
          print("Onayalama işleminizi yapmanız gerekmektedir.");
          _auth.signOut();
        }
      } else {
        print("Zaten oturum açık");
      }
    } catch (e) {
      print("Hatalı email veya şifre $e");
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
      await _auth.currentUser!.updatePassword("password2");
      print("Şifreniz güncellendi");
    } catch (e) {
      try {
        String email = 'ibrahimhalillulu@gmail.com';
        String password = 'password2';

        // Create a credential
        AuthCredential credential =
            EmailAuthProvider.credential(email: email, password: password);
        // Reauthenticate
        await FirebaseAuth.instance.currentUser!
            .reauthenticateWithCredential(credential);
        await _auth.currentUser!.updatePassword("password2");
        print("Gücellendi");
      } catch (e) {
        print("Hata oluştu $e");
      }
      print("Şifre güncellenemedi");
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

  _googleIleGiris() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      debugPrint("gmail girişi hata $e");
    }

    // Once signed in, return the UserCredential
  }

  void _telNoGiris() async {
    //+95 42 542 5422
    //123456
    await _auth.verifyPhoneNumber(
      phoneNumber: '+95 42 542 5422',
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        print("Verification failed hatası: $e");
      },
      codeSent: (String verificationId, int? resendToken) async {
        print("Kod Yollandı..");
        try {
          String smsCode = '123456';

          // Create a PhoneAuthCredential with the code
          PhoneAuthCredential credential = PhoneAuthProvider.credential(
              verificationId: verificationId, smsCode: smsCode);

          // Sign the user in (or link) with the credential
          await _auth.signInWithCredential(credential);
        } catch (e) {
          print("Kod hatası:  $e");
        }
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }
}
