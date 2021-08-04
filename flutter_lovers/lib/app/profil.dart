import 'package:flutter/material.dart';
import 'package:flutter_lovers/common_widget/platform_duyarli_alert_dialog.dart';
import 'package:flutter_lovers/common_widget/social_log_in_button.dart';
import 'package:flutter_lovers/viewmodel/user_view_model.dart';
import 'package:provider/provider.dart';

class ProfilPage extends StatefulWidget {
  @override
  _ProfilPageState createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  TextEditingController? _controllerUserName;
  @override
  void initState() {
    super.initState();
    _controllerUserName = TextEditingController();
  }

  @override
  void dispose() {
    _controllerUserName!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _userModel = Provider.of<UserViewModel>(context);
    _controllerUserName!.text = _userModel.user!.userName!;
    print("Profil sayfasındaki user değerleri" + _userModel.user.toString());
    return Scaffold(
      appBar: AppBar(
        title: Text("Profil"),
        actions: [
          TextButton(
              onPressed: () => _cikisIcinOnayIste(context, _userModel),
              child: Text(
                "Çıkış",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 75,
                  backgroundColor: Colors.white,
                  backgroundImage:
                      NetworkImage(_userModel.user!.profilURL.toString()),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  initialValue: _userModel.user!.email,
                  readOnly: true,
                  decoration: InputDecoration(
                      labelText: "Emailiniz",
                      hintText: 'Email',
                      border: OutlineInputBorder()),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _controllerUserName,
                  // initialValue: _userModel.user!.userName,
                  decoration: InputDecoration(
                      labelText: "Kullanıcı Adı",
                      hintText: 'KullanıcıAdı',
                      border: OutlineInputBorder()),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SocialLoginButton(
                    buttonText: "Değişiklikleri Kaydet",
                    onPressed: () {
                      _userNameGuncelle(context, _userModel);
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> _cikisIcinOnayIste(
      BuildContext context, UserViewModel userModel) async {
    bool sonuc = await PlatformDuyarliAlertDialog(
      baslik: "Emin misiniz",
      icerik: "Çıkmak İstediğinizden emin misiniz?",
      anaButonYazisi: "Onayla",
      iptalButonYazisi: "Vazgeç",
    ).goster(context);
    if (sonuc == true) {
      _cikisYap(userModel, context);
    }
    return sonuc;
  }

  Future<bool> _cikisYap(UserViewModel userModel, BuildContext context) async {
    bool sonuc = await userModel.signOut();
    return sonuc;
  }

  void _userNameGuncelle(BuildContext context, UserViewModel userModel) async {
    if (userModel.user!.userName != _controllerUserName!.text) {
      bool updateResult = await userModel.updateUserName(
          userModel.user!.userID.toString(), _controllerUserName!.text);

      if (updateResult == true) {
        userModel.user!.userName = _controllerUserName!.text;
        PlatformDuyarliAlertDialog(
                baslik: "Başarılı",
                icerik: "UserName değiştirildi",
                anaButonYazisi: "Tamam")
            .goster(context);
      } else {
        PlatformDuyarliAlertDialog(
                baslik: "Hata",
                icerik: "UserName dzatewn kullanımda farklı giriniz",
                anaButonYazisi: "Tamam")
            .goster(context);
      }
    } else {
      PlatformDuyarliAlertDialog(
              baslik: "Hata",
              icerik: "UserName değişiklik yapmadınız",
              anaButonYazisi: "Tamam")
          .goster(context);
    }
  }
}
