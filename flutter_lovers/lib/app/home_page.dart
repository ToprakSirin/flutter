import 'package:flutter/material.dart';
import 'package:flutter_lovers/app/my_custom_bottom_navigaton.dart';
import 'package:flutter_lovers/app/tabs_item.dart';
import 'package:flutter_lovers/model/user_model.dart';
import 'package:flutter_lovers/viewmodel/user_view_model.dart';
import 'package:provider/provider.dart';

//sadece oturum açmış kullanıcıların görmesi gereken sayfa
class HomePage extends StatefulWidget {
  final MyUser user;

  HomePage({
    required this.user,
  });

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TabItem _currentTab = TabItem.Kullanicilar;

  @override
  Widget build(BuildContext context) {
    final _userModel = Provider.of<UserViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () => _cikisYap(_userModel),
            child: Text(
              "Çıkış Yap",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
        title: Text("Ana Sayfa"),
      ),
      body: MyCustomBottomNavigaton(currentTab: _currentTab,onSelectedTab: (secilenTab){
        debugPrint("Seçilen tab item:"+secilenTab.toString());
      },),
    );
  }

  _cikisYap(UserViewModel userModel) async {
    bool sonuc = await userModel.signOut();

    return sonuc;
  }
}
