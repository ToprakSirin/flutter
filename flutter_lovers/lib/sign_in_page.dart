import 'package:flutter/material.dart';

import 'common_widget/social_log_in_button.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

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
          ],
        ),
      ),
    );
  }
}
