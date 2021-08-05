import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_lovers/common_widget/platform_duyarli_alert_dialog.dart';
import 'package:flutter_lovers/common_widget/social_log_in_button.dart';
import 'package:flutter_lovers/viewmodel/user_view_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ProfilPage extends StatefulWidget {
  @override
  _ProfilPageState createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  TextEditingController? _controllerUserName;
  XFile? _profilPhoto;

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
    print("Profil sayfasındaki user değerleri" + _userModel.user.toString());
    _controllerUserName!.text = _userModel.user!.userName!;
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
                child: GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Container(
                            height: 160,
                            child: Column(
                              children: [
                                ListTile(
                                  leading: Icon(Icons.camera),
                                  title: Text("Kameradan çek"),
                                  onTap: () {
                                    _kameradanFotoCek();
                                  },
                                ),
                                ListTile(
                                  leading: Icon(Icons.image),
                                  title: Text("Galeriden Seç"),
                                  onTap: () {
                                    _galeridenFotoSec();
                                  },
                                ),
                              ],
                            ),
                          );
                        });
                  },
                  child: CircleAvatar(
                    radius: 75,
                 
                    //backgroundImage: _profilFoto == null ? NetworkImage(_userModel.user!.profilURL) : FileImage(_profilPhoto),
                  ),
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
                      _profilFotoGuncelle(context, _userModel);
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
    }
  }

  void _kameradanFotoCek() async {
    ImagePicker _picker = ImagePicker();
    XFile? _yeniResim = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      _profilPhoto = _yeniResim;
      Navigator.of(context).pop();
    });
  }

  void _galeridenFotoSec() async {
    ImagePicker _picker = ImagePicker();
    XFile? _yeniResim = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _profilPhoto = _yeniResim;
      Navigator.of(context).pop();
    });
  }

  void _profilFotoGuncelle(
      BuildContext context, UserViewModel userModel) async {
    if (_profilPhoto != null) {
      String url = await userModel.uploadFile(
          userModel.user!.userID, "profil_foto", _profilPhoto!);
      print("gelen url: $url");

      if (url != null) {
        PlatformDuyarliAlertDialog(
                baslik: "Hata",
                icerik: "Profil fotoğrafınız güncellendi",
                anaButonYazisi: "Tamam")
            .goster(context);
      }
    }
  }
}
