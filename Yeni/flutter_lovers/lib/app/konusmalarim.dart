import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lovers/model/konusma_model.dart';
import 'package:flutter_lovers/viewmodel/user_view_model.dart';
import 'package:provider/provider.dart';

class KonusmalarimPage extends StatefulWidget {
  KonusmalarimPage({Key? key}) : super(key: key);

  @override
  _KonusmalarimPageState createState() => _KonusmalarimPageState();
}

class _KonusmalarimPageState extends State<KonusmalarimPage> {
  @override
  Widget build(BuildContext context) {
    UserViewModel _userModel = Provider.of<UserViewModel>(
      context,
    );
    return Scaffold(
        appBar: AppBar(
          title: Text("Konusmalarim"),
        ),
        body: FutureBuilder<List<KonusmaModeli>>(
            future: _userModel
                .getAllConversations(_userModel.user!.userID.toString()),
            builder: (context, konusmaListesi) {
              if (!konusmaListesi.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                var tumKonusmalar = konusmaListesi.data;
                return ListView.builder(
                  itemBuilder: (context, index) {
                    var oankiKonusma = tumKonusmalar![index];
                    return ListTile(
                      title: Text(oankiKonusma.sonYollananMesaj!),
                      subtitle: Text(oankiKonusma.konusulanUserName!),
                    );
                  },
                  itemCount: tumKonusmalar!.length,
                );
              }
            }));
  }
}
