import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

//sadece oturum açmış kullanıcıların görmesi gereken sayfa
class HomePage extends StatelessWidget {
  final User _user;
  final Function onSignOut;
  const HomePage(this._user, this.onSignOut, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () => _cikisYap,
            child: Text(
              "Çıkış Yap",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
        title: Text("Ana Sayfa"),
      ),
      body: Center(
        child: Text("Hoşgeldiniz ${_user.uid}"),
      ),
    );
  }

  _cikisYap() async {
    UserCredential _user = await FirebaseAuth.instance.signOut();
  }
}
