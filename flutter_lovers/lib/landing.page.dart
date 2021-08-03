import 'package:flutter/material.dart';
import 'package:flutter_lovers/home_page.dart';
import 'package:flutter_lovers/locator.dart';
import 'package:flutter_lovers/model/user_model.dart';
import 'package:flutter_lovers/services/auth_base.dart';
import 'package:flutter_lovers/services/fake_auth_service.dart';
import 'package:flutter_lovers/services/firebase_auth.service.dart';

import 'package:flutter_lovers/sign_in_page.dart';

//Uygulama ilk açıldığında çalışacak sayfa
class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  MyUser? _user;
  AuthBase authService = locator<FakeAuthService>();

  @override
  void initState() {
    super.initState();
    _checkUser();

    ;
  }

  @override
  Widget build(BuildContext context) {
    if (_user == null) {
      return SignInPage(
        onSignIn: (user) {
          _updateUser(user);
        },
      );
    } else {
      return HomePage(
          user: _user!,
          onSignOut: () {
            _updateUser(null!);
          });
    }
  }

  Future<void> _checkUser() async {
    //bu işlem uzun sürecek ve işlem bitince sana geriye firebase user nesnesi döndürcek
    _user = (await authService.currentUser()) as MyUser?;
  }

  void _updateUser(MyUser user) {
    setState(() {
      _user = user;
    });
  }
}
