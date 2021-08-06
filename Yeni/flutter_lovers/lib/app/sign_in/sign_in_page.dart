import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lovers/app/sign_in/email_sifre_giris_ve_kayit.dart';
import 'package:flutter_lovers/model/user.dart';
import 'package:flutter_lovers/viewmodel/user_view_model.dart';
import 'package:provider/provider.dart';
import '../../common_widget/social_log_in_button.dart';

class SignInPage extends StatelessWidget {
  // void _misafirGiris(BuildContext context, UserViewModel userModel) async {
  //   MyUser sonuc = await userModel.signInAnonymously();
  //   print("Oturum açan user ıd: " + sonuc.userId.toString());
  // }

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
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: Text("Oturum Açın", style: TextStyle(fontSize: 30)),
            ),
            SizedBox(height: 5),
            SocialLoginButton(
              buttonText: "Googke ile oturum açın",
              buttonColor: Colors.white,
              textColor: Colors.black54,
              buttonIcon: Image.asset("assets/images/google-logo.png"),
              onPressed: () => _googleIleGirisYap(_userModel),
            ),
            SocialLoginButton(
              buttonText: "Facebook ile oturum açın",
              buttonIcon: Image.asset("assets/images/facebook-logo.png",
                  fit: BoxFit.cover),
              onPressed: () => (){},
            ),
            SocialLoginButton(
              buttonText: "Email ile oturum açın",
              buttonColor: Colors.tealAccent.shade700,
              buttonIcon: Icon(Icons.email),
              onPressed: () => _emailIleGirs(context),
            ),
          ],
        ),
      ),
    );
  }
}