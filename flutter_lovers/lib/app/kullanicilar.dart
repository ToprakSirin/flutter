/*
import 'package:flutter/material.dart';
import 'package:flutter_lovers/app/konusma.dart';
import 'package:flutter_lovers/model/user.dart';
import 'package:flutter_lovers/viewmodel/user_view_model.dart';
import 'package:provider/provider.dart';

class KullanicilarPage extends StatefulWidget {
  const KullanicilarPage({Key? key}) : super(key: key);

  @override
  _KullanicilarPageState createState() => _KullanicilarPageState();
}

class _KullanicilarPageState extends State<KullanicilarPage> {
  @override
  Widget build(BuildContext context) {
    final _userModel = Provider.of<UserViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Kullanicilar"),
      ),
      body: RefreshIndicator(
        onRefresh: () => _kullanicilarPageYenile(),
        child: FutureBuilder<List<MyUser>>(
            future: _userModel.getAllUser(),
            builder:
                (BuildContext context, AsyncSnapshot<List<MyUser>> result) {
              if (result.hasData) {
                List<MyUser>? allUsers = result.data;
                if (allUsers!.length - 1 > 0) {
                  return ListView.builder(
                    itemCount: allUsers.length,
                    itemBuilder: (context, index) {
                      MyUser anlikUser = allUsers[index];
                      if (anlikUser.userId != _userModel.user!.userId) {
                        return ListTile(
                          leading: CircleAvatar(
                            radius: 35,
                            backgroundImage:
                                NetworkImage(anlikUser.profilURL.toString()),
                          ),
                          subtitle: Text(anlikUser.email.toString()),
                          title: Text(anlikUser.userName.toString()),
                          onTap: () =>
                              _chatPage(context, _userModel, anlikUser),
                        );
                      } else {
                        return SizedBox();
                      }
                    },
                  );
                } else {
                  return RefreshIndicator(
                    child: SingleChildScrollView(
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.supervised_user_circle,
                                size: 80,
                              ),
                              Text(
                                "Kayıtlı kullanıcı bulunamadı",
                                style: TextStyle(fontSize: 25),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    onRefresh: () => _kullanicilarPageYenile(),
                  );
                }
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }

  void _chatPage(
      BuildContext context, UserViewModel userModel, MyUser anlikUser) {
    Navigator.of(context, rootNavigator: true).push(
      MaterialPageRoute(
        builder: (context) => KonusmaPage(
          currentUser: userModel.user!,
          sohbetEdilenUser: anlikUser,
        ),
      ),
    );
  }

  Future<void> _kullanicilarPageYenile() async {
    setState(() {});
  }
}
*/

import 'package:flutter/material.dart';
import 'package:flutter_lovers/app/konusma.dart';
import 'package:flutter_lovers/model/user.dart';
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
        body: FutureBuilder<List<MyUser>>(
          future: _userModel.getAllUser(),
          builder: (context, sonuc) {
            if (sonuc.hasData) {
              var tumKullanicilar = sonuc.data;

              if (tumKullanicilar!.length - 1 > 0) {
                return ListView.builder(
                    itemCount: tumKullanicilar.length,
                    itemBuilder: (context, index) {
                      var oankiUser = sonuc.data![index];
                      if (oankiUser.userId != _userModel.user!.userId) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context, rootNavigator: true).push(
                              MaterialPageRoute(
                                builder: (context) => KonusmaPage(
                                  currentUser: _userModel.user!,
                                  sohbetEdilenUser: oankiUser,
                                ),
                              ),
                            );
                          },
                          child: ListTile(
                            title: Text(oankiUser.userName.toString()),
                            subtitle: Text(oankiUser.email.toString()),
                            leading: CircleAvatar(
                              backgroundImage:
                                  NetworkImage(oankiUser.profilURL.toString()),
                            ),
                          ),
                        );
                      } else {}
                      return Container();
                    });
              } else {
                return Center(
                  child: Text("Kayıtlı Kullanıcı yok"),
                );
              }
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}
