import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lovers/home_page.dart';
import 'package:flutter_lovers/sign_in_page.dart';

//Uygulama ilk açıldığında çalışacak sayfa
class LandingPage extends StatefulWidget {
  LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  User? _user;

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
      return HomePage(_user!, onSignOut: () {
        _updateUser(null);
      });
    }
  }

  Future<void> _checkUser() async {
    //bu işlem uzun sürecek ve işlem bitince sana geriye firebase user nesnesi döndürcek
    _user = await FirebaseAuth.instance.currentUser!;
  }

  void _updateUser(User user) {
    setState(() {
      _user = user;
    });
  }
}
