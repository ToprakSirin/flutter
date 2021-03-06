import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lovers/admob_islemleri.dart';
import 'package:flutter_lovers/app/konusma.dart';
import 'package:flutter_lovers/model/konusma_model.dart';
import 'package:flutter_lovers/model/user.dart';
import 'package:flutter_lovers/viewmodel/user_view_model.dart';
import 'package:provider/provider.dart';

class KonusmalarimPage extends StatefulWidget {
  const KonusmalarimPage({Key? key}) : super(key: key);

  @override
  _KonusmalarimPageState createState() => _KonusmalarimPageState();
}

class _KonusmalarimPageState extends State<KonusmalarimPage> {
  @override
  void initState() {
    super.initState();
    RewardedVideoAd.instance.load(
        adUnitId: AdmobIslemleri.odulluReklamTest,
        targetingInfo: AdmobIslemleri.targetingInfo);

    RewardedVideoAd.instance.listener =
        (RewardedVideoAdEvent event, {String? rewardType, int? rewardAmount}) {
      if (event == RewardedVideoAdEvent.rewarded) {
        print(" *************** ODULLU REKLAM ***** ODUL VER");
        odulluReklamLoad();
      } else if (event == RewardedVideoAdEvent.loaded) {
        print(
            " *************** ODULLU REKLAM ***** REKLAM yuklendı ve gosterilecek");
        RewardedVideoAd.instance.show();
      } else if (event == RewardedVideoAdEvent.closed) {
        print(" *************** ODULLU REKLAM ***** REKLAM KAPATILDI");
      } else if (event == RewardedVideoAdEvent.failedToLoad) {
        print(" *************** ODULLU REKLAM ***** REKLAM BULUNAMADI");
        odulluReklamLoad();
      } else if (event == RewardedVideoAdEvent.completed) {
        print(" *************** ODULLU REKLAM ***** COMPLETED");
      }
    };
  }

  void odulluReklamLoad() {
    RewardedVideoAd.instance.load(
        adUnitId: AdmobIslemleri.odulluReklamTest,
        targetingInfo: AdmobIslemleri.targetingInfo);
  }

  @override
  Widget build(BuildContext context) {
    UserViewModel _userModel =
        Provider.of<UserViewModel>(context, listen: true);

    return Scaffold(
      appBar:
          AppBar(title: Text("                  KONUŞMALARIM               ")),
      body: Container(
        child: FutureBuilder<List<KonusmaModel>>(
          future: _userModel
              .getAllConversations(_userModel.user!.userId.toString()),
          builder: (context, AsyncSnapshot<List<KonusmaModel>> snapshot) {
            if (snapshot.hasData) {
              print("snapshot boyutu   " + snapshot.data!.length.toString());
              if (snapshot.data!.length > 0) {
                return RefreshIndicator(
                  onRefresh: () => _konusmalarimListesiniYenile(),
                  child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(snapshot
                              .data![index].konusulanUserProfilURL
                              .toString()),
                        ),
                        title: Text(
                            snapshot.data![index].sonYollananMesaj.toString()),
                        subtitle: Text(
                            snapshot.data![index].konusulanUserName.toString()),
                        trailing: Text(
                            snapshot.data![index].aradakiZamanFarki.toString()),
                        onTap: () => _chatPage(
                          _userModel,
                          MyUser.userIdAndProfilPhotoAndUserName(
                            userId: snapshot.data![index].kimleKonusuyor,
                            profilURL:
                                snapshot.data![index].konusulanUserProfilURL,
                            userName: snapshot.data![index].konusulanUserName,
                          ),
                        ),
                      );
                    },
                  ),
                );
              } else {
                return RefreshIndicator(
                  onRefresh: () => _konusmalarimListesiniYenile(),
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
                );
              }
            } else {
              return Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
        ),
      ),
    );
  }

  Future<void> _konusmalarimListesiniYenile() async {
    setState(() {});
  }

  void _chatPage(UserViewModel userModel, MyUser anlikUser) {
    Navigator.of(context, rootNavigator: true).push(
      MaterialPageRoute(
        builder: (context) => KonusmaPage(
            currentUser: userModel.user!, sohbetEdilenUser: anlikUser),
      ),
    );
  }
}
