import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lovers/model/user_model.dart';
import 'package:flutter_lovers/services/auth_base.dart';

//sadece oturum açmış kullanıcıların görmesi gereken sayfa
class HomePage extends StatelessWidget {
  final AuthBase authService;
  final Function onSignOut;
  final MyUser user;

  HomePage({required this.user,required this.authService, required this.onSignOut});

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
        child: Text("Hoşgeldiniz ${user.userID}"),
      ),
    );
  }

  _cikisYap() async {
    bool sonuc = await authService.signOut();
    onSignOut();
    return sonuc;
  }
}
