import 'package:flutter/material.dart';
import 'package:flutter_lovers/viewmodel/user_view_model.dart';
import 'package:provider/provider.dart';

class KullanicilarPage extends StatelessWidget {
  const KullanicilarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserViewModel _userModel = Provider.of<UserViewModel>(context);
    _userModel.getAllUser();
    return Scaffold(
      appBar: AppBar(
        title: Text("Kullanıcılar"),
      ),
      body: Center(
        child: Text("Kullanıcılar Sayfası"),
      ),
    );
  }
}
