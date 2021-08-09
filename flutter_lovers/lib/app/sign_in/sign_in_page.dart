import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lovers/app/sign_in/email_sifre_giris_ve_kayit.dart';

import 'package:flutter_lovers/viewmodel/user_view_model.dart';
import 'package:provider/provider.dart';
import '../../common_widget/social_log_in_button.dart';

class SignInPage extends StatelessWidget {
  /*  void _misafirGiris(BuildContext context, UserViewModel userModel) async {
  //   MyUser sonuc = await userModel.signInAnonymously();
    print("Oturum açan user ıd: " + sonuc.userId.toString());
   } */

  void _googleIleGirisYap(UserViewModel userModel) async {
    await userModel.signInWithGoogle();
  }

  void _emailIleGirs(BuildContext context) {
    Navigator.of(context).push(
      // Cupertino sayfanın yandan açılmasını sağlar ios cihazlarda olduğu gibi
      CupertinoPageRoute(builder: (context) => EmailAndPasswordLoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _userModel = Provider.of<UserViewModel>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text("Flutter lovers"), elevation: 0),
      backgroundColor: Colors.grey.shade200,
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: Text("OTURUM AÇIN",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 8),
            SocialLoginButton(
              buttonText: "Gmail ile Giriş Yap",
              textColor: Colors.black87,
              buttonColor: Colors.white,
              buttonIcon: Image.asset("assets/images/google-logo.png"),
              onPressed: () => _googleIleGirisYap(_userModel),
            ),
            SocialLoginButton(
              buttonColor: Color(0xFF334D92),
              buttonText: "Facebook ile Giriş Yap",
              buttonIcon: Image.asset("assets/images/facebook-logo.png",
                  fit: BoxFit.cover),
              onPressed: () {},
            ),
            SocialLoginButton(
              buttonText: "Email ve Şifre ile Giriş yap",
              buttonIcon: Icon(
                Icons.email,
                color: Colors.white,
                size: 32,
              ),
              onPressed: () => _emailIleGirs(context),
            ),
            /*SocialLoginButton(
              onPressed: () => _misafirGirisi(context),
              butonColor: Colors.teal,
              butonIcon: Icon(Icons.supervised_user_circle),
              butonText: "Misafir Girişi",
            ),*/
          ],
        ),
      ),
    );
  }
}
