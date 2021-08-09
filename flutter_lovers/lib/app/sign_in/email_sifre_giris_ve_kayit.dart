import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_lovers/app/hata_exception.dart';
import 'package:flutter_lovers/common_widget/platform_duyarli_widgetler/platform_duyarli_alert_dialog.dart';

import 'package:flutter_lovers/common_widget/social_log_in_button.dart';

import 'package:flutter_lovers/viewmodel/user_view_model.dart';
import 'package:provider/provider.dart';

enum FormType { REGISTER, LOGIN }

class EmailAndPasswordLoginPage extends StatefulWidget {
  @override
  _EmailAndPasswordLoginPageState createState() =>
      _EmailAndPasswordLoginPageState();
}

class _EmailAndPasswordLoginPageState extends State<EmailAndPasswordLoginPage> {
  String? _email;
  String? _password;
  String? _butonText;
  String? _linkText;
  FormType _formType = FormType.LOGIN;
  final _formKey = GlobalKey<FormState>();

  void _formSubmit(UserViewModel _userModel) async {
    _formKey.currentState!.save();
    print("Email: $_email Sifre: $_password");

    if (_formType == FormType.LOGIN) {
      try {
        await _userModel.signInWithEmailAndPassword(_email!, _password!);
      } catch (e) {
        PlatformDuyarliAlertDialog(
          title: "Oturum Açılamadı",
          contentText: Exceptions.hataGoster(e.toString().toString()),
          basicButtonText: 'Tamam',
        ).goster(context);
      }
    } else {
      try {
        await _userModel.createUserWithEmailAndPassword(_email!, _password!);
      } catch (e) {
        PlatformDuyarliAlertDialog(
          title: "Kayıt olmada hata",
          contentText: Exceptions.hataGoster(e.toString().toString()),
          basicButtonText: 'Tamam',
        ).goster(context);
      }
    }
  }

  void _formTypeDegistir() {
    setState(() {
      _formType == FormType.REGISTER
          ? _formType = FormType.LOGIN
          : _formType = FormType.REGISTER;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _userModel = Provider.of<UserViewModel>(context);
    _butonText = _formType == FormType.LOGIN ? "Giriş Yap" : "Kayıt Ol";
    _linkText = _formType == FormType.LOGIN
        ? "Hesabınız yok mu? Kayıt Olun"
        : "Hesabınız var mı? Giriş Yapın ";
    if (_userModel.user != null) {
      Future.delayed(
        Duration(milliseconds: 1),
        () => Navigator.of(context).pop(),
      );
    }
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text("Giriş / Kayıt ol"),
      ),
      body: _userModel.state == ViewState.Idle
          ? SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      TextFormField(
                        //initialValue: "abc@gmail.com",
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          errorText: _userModel.emailErrorMessage != null
                              ? _userModel.emailErrorMessage
                              : null,
                          prefixIcon: Icon(Icons.email),
                          hintText: 'Email',
                          labelText: "Email",
                          border: OutlineInputBorder(),
                        ),
                        onSaved: (girilenEmail) {
                          _email = girilenEmail;
                        },
                      ),
                      SizedBox(height: 8),
                      TextFormField(
                        //initialValue: "password",
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          errorText: _userModel.passwordErrorMessage != null
                              ? _userModel.passwordErrorMessage
                              : null,
                          prefixIcon: Icon(Icons.lock),
                          hintText: 'Şifre',
                          labelText: "Şifre",
                          border: OutlineInputBorder(),
                        ),
                        onSaved: (girirlenSifre) {
                          _password = girirlenSifre;
                        },
                      ),
                      SizedBox(height: 8),
                      SocialLoginButton(
                        buttonColor: Theme.of(context).primaryColor,
                        buttonText: _butonText!,
                        radius: 10,
                        onPressed: () => _formSubmit(_userModel),
                      ),
                      SizedBox(height: 10),
                      TextButton(
                        onPressed: () => _formTypeDegistir(),
                        child: Text(_linkText!),
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
