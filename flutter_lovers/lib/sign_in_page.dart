import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';

import 'common_widget/social_log_in_button.dart';

class SignInPage extends StatelessWidget {
  final Function(User)? onSignIn;

  const SignInPage({Key? key,required this.onSignIn}) : super(key: key);

  void _misafirGirisi() async {
    UserCredential sonuc = await FirebaseAuth.instance.signInAnonymously();
    onSignIn!(sonuc.user);
    print("Oturum açan user ıd: " + sonuc.user!.uid.toString());
  }

  @override
  Widget build(BuildContext context) {
    Widget? buttonIcon;
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Lovers"),
        elevation: 0,
      ),
      backgroundColor: Colors.grey.shade200,
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Oturum Aç",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
            ),
            SizedBox(
              height: 8,
            ),
            SocialLoginButton(
              buttonColor: Colors.white,
              buttonText: "Gmail ile Giriş Yap",
              textColor: Colors.black87,
              buttonIcon: Image.asset("assets/images/google-logo.png"),
              onPressed: () {},
            ),
            SocialLoginButton(
              buttonColor: Color(0xFF334D92),
              buttonText: "Facebook ile Giriş Yap",
              buttonIcon: Image.asset("assets/images/facebook-logo.png"),
              textColor: Colors.white,
              radius: 16,
              onPressed: () {},
            ),
            SocialLoginButton(
              buttonColor: Color(0xFF334D92),
              buttonText: "Email ile Giriş Yap",
              buttonIcon: Icon(
                Icons.email,
                size: 32,
              ),
              onPressed: () {},
            ),
            SocialLoginButton(
              buttonIcon: Icon(Icons.supervised_user_circle),
              buttonText: "Misafir Girişi",
              onPressed: _misafirGirisi,
            ),
          ],
        ),
      ),
    );
  }
}
