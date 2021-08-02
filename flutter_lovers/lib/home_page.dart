import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

//sadece oturum açmış kullanıcıların görmesi gereken sayfa
class HomePage extends StatelessWidget {
  const HomePage(this._user, {Key? key}) : super(key: key);
  final User _user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ana Sayfa"),
      ),
      body: Center(
        child: Text("Hoşgeldiniz ${_user.uid}"),
      ),
    );
  }
}
