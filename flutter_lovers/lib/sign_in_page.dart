import 'package:flutter/material.dart';
import 'package:flutter_lovers/model/user_model.dart';
import 'package:flutter_lovers/viewmodel/user_model.dart';
import 'package:provider/provider.dart';
import 'common_widget/social_log_in_button.dart';

class SignInPage extends StatelessWidget {
 
  void _misafirGirisi(BuildContext context) async {
    final _userModel = Provider.of<UserModel>(context);
    MyUser _user = await _userModel.signInAnonymously();

    print("Oturum açan user ıd: " + _user.userID.toString());
  }
  
 void  _googleIleGiris(BuildContext context) async{
      final _userModel = Provider.of<UserModel>(context);
    MyUser _user = await _userModel.signInWithGoogle();

    print("Oturum açan user ıd: " + _user.userID.toString());
 }

  @override
  Widget build(BuildContext context) {
   
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
              onPressed: () =>_googleIleGiris(context),
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
              buttonText: "Misafir girişi",
              buttonColor: Colors.orange,
              onPressed: () => _misafirGirisi(context),
            ),
          ],
        ),
      ),
    );
  }

}
