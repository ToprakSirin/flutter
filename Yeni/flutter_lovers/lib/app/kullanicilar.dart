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
                      if (oankiUser.userID != _userModel.user!.userID) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context, rootNavigator: true).push(
                              MaterialPageRoute(
                                builder: (context) => Konusma(
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
