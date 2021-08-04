import 'package:flutter/material.dart';

import 'package:flutter_lovers/common_widget/social_log_in_button.dart';
import 'package:flutter_lovers/model/user_model.dart';
import 'package:flutter_lovers/viewmodel/user_view_model.dart';
import 'package:provider/provider.dart';

enum FormType { Register, Login }

class EmailveSifreLoginPage extends StatefulWidget {
  @override
  _EmailveSifreLoginPageState createState() => _EmailveSifreLoginPageState();
}

class _EmailveSifreLoginPageState extends State<EmailveSifreLoginPage> {
  String? _email;
  String? _sifre;
  String? _butonText;
  String? _linkText;
  FormType _formType = FormType.Login;
  final _formKey = GlobalKey<FormState>();

  _formSubmit(UserViewModel userModel) async {
    _formKey.currentState!.save();

    if (_formType == FormType.Login) {
      MyUser _girisYapanUser =
          await userModel.signInWithEmailandPassword(_email!, _sifre!);
      if (_girisYapanUser != null)
        print("Oturum açan user id:" + _girisYapanUser.userID.toString());
    } else {
      MyUser _olusturulanUser =
          await userModel.createUserWithEmailandPassword(_email!, _sifre!);
      if (_olusturulanUser != null)
        print("Oluşturulan:" + _olusturulanUser.userID.toString());
    }
  }

  void _degistir() {
    setState(
      () {
        _formType =
            _formType == FormType.Login ? FormType.Register : FormType.Login;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final _userModel = Provider.of<UserViewModel>(context);
    _butonText = _formType == FormType.Register ? "Giriş Yap" : "Kayıt Ol";
    _linkText = _formType == FormType.Login
        ? "Hesabınız Yok mu? Kayıt Olun"
        : "Hesabınız var mı? Giriş Yapın";

    if (_userModel.user != null) {
      Future.delayed(Duration(milliseconds: 200), () {
        Navigator.of(context).pop();
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Giriş/Kayit"),
      ),
      body: _userModel.state == ViewState.Idle
          ? SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        initialValue: "emre@emre.com",
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          errorText: _userModel.emailErrorMessage != null
                              ? _userModel.emailErrorMessage
                              : null,
                          prefixIcon: Icon(Icons.mail),
                          hintText: 'Email',
                          labelText: 'Email',
                          border: OutlineInputBorder(),
                        ),
                        onSaved: (girilenEmail) {
                          _email = girilenEmail;
                        },
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        initialValue: "password",
                        obscureText: true,
                        decoration: InputDecoration(
                          errorText: _userModel.passwordErrorMessage != null
                              ? _userModel.passwordErrorMessage
                              : null,
                          prefixIcon: Icon(Icons.mail),
                          hintText: 'Şifre',
                          labelText: 'Şifre',
                          border: OutlineInputBorder(),
                        ),
                        onSaved: (girilenSifre) {
                          _email = girilenSifre;
                        },
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      SocialLoginButton(
                        buttonIcon: Icon(Icons.format_align_center),
                        buttonText: _butonText!,
                        buttonColor: Theme.of(context).primaryColor,
                        radius: 20,
                        onPressed: _formSubmit(_userModel),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextButton(
                        onPressed: () => _degistir(),
                        child: Text(
                          _linkText!,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
