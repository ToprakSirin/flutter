import 'package:flutter/material.dart';
import 'package:flutter_lovers/common_widget/social_log_in_button.dart';
import 'package:flutter_lovers/model/user_model.dart';
import 'package:flutter_lovers/viewmodel/user_view_model.dart';
import 'package:provider/provider.dart';

enum FormType { Register, Login }

class EmailveSifreLoginPage extends StatefulWidget {
  EmailveSifreLoginPage({Key? key}) : super(key: key);

  @override
  _EmailveSifreLoginPageState createState() => _EmailveSifreLoginPageState();
}

class _EmailveSifreLoginPageState extends State<EmailveSifreLoginPage> {
  String? _email, _sifre;
  String? _butonText, _linkText;
  var _formType = FormType.Login;
  final _formKey = GlobalKey<FormState>();

  _formSubmit(BuildContext context) async {
    _formKey.currentState!.save();
    final _userModel = Provider.of<UserViewModel>(context);

    if (_formType == FormType.Login) {
      MyUser _girisYapanUser =
          await _userModel.signInWithEmailandPassword(_email!, _sifre!);
      if (_girisYapanUser != null)
        print("Oturum açan user id:" + _girisYapanUser.userID.toString());
    } else {
      MyUser _olusturulanUser =
          await _userModel.createUserWithEmailandPassword(_email!, _sifre!);
      if (_olusturulanUser != null)
        print("Oturum açan user id:" + _olusturulanUser.userID.toString());
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
    _butonText = _formType == FormType.Register ? "Giriş Yap" : "Kayıt Ol";
    _linkText = _formType == FormType.Login
        ? "Hesabınız Yok mu? Kayıt Olun"
        : "Hesabınız var mı? Giriş Yapın";
    return Scaffold(
      appBar: AppBar(
        title: Text("Giriş/Kayit"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.mail),
                    hintText: 'Email',
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (girilenEmail) {
                    _email != girilenEmail;
                  },
                ),
                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.mail),
                    hintText: 'Şifre',
                    labelText: 'Şifre',
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (girilenSifre) {
                    _email != girilenSifre;
                  },
                ),
                SizedBox(
                  height: 8,
                ),
                SocialLoginButton(
                  buttonText: _butonText!,
                  buttonColor: Theme.of(context).primaryColor,
                  radius: 20,
                  onPressed: _formSubmit(context),
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
      ),
    );
  }
}
