import 'package:flutter/material.dart';
import 'package:flutter_lovers/model/user_model.dart';
import 'package:flutter_lovers/viewmodel/user_model.dart';
import 'package:provider/provider.dart';

//sadece oturum açmış kullanıcıların görmesi gereken sayfa
class HomePage extends StatelessWidget {
  final MyUser user;

  HomePage({
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () => _cikisYap(context),
            child: Text(
              "Çıkış Yap",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
        title: Text("Ana Sayfa"),
      ),
      body: Center(
        child: Text("Hoşgeldiniz ${user.userID}"),
      ),
    );
  }

  _cikisYap(BuildContext context) async {
    final _userModel = Provider.of<UserModel>(context);
    bool sonuc = await _userModel.signOut();

    return sonuc;
  }
}
