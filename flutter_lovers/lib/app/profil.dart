import 'package:flutter/material.dart';
import 'package:flutter_lovers/common_widget/platform_duyarli_alert_dialog.dart';
import 'package:flutter_lovers/viewmodel/user_view_model.dart';
import 'package:provider/provider.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({Key? key}) : super(key: key);

  @override
  _ProfilPageState createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  @override
  Widget build(BuildContext context) {
    final _userModel = Provider.of<UserViewModel>(context);
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
      body: Center(
        child: Text("Profil Sayfası"),
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
}
