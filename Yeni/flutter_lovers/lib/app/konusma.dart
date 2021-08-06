import 'package:cloud_firestore_platform_interface/src/timestamp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lovers/model/mesaj.dart';
import 'package:flutter_lovers/model/user.dart';
import 'package:flutter_lovers/viewmodel/user_view_model.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Konusma extends StatefulWidget {
  MyUser currentUser;
  MyUser sohbetEdilenUser;
  Konusma({required this.currentUser, required this.sohbetEdilenUser});

  @override
  _KonusmaState createState() => _KonusmaState();
}

class _KonusmaState extends State<Konusma> {
  var _mesajController = TextEditingController();
  ScrollController _scrollController = new ScrollController();

  Widget build(BuildContext context) {
    final _userModel = Provider.of<UserViewModel>(context);
    MyUser _currentUser = widget.currentUser;
    MyUser _sohbetEdilenUser = widget.sohbetEdilenUser;

    return Scaffold(
      appBar: AppBar(
        title: Text("Konuşma"),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<List<Mesaj>>(
              stream: _userModel.getMessages(
                  _currentUser.userID!, _sohbetEdilenUser.userID!),
              builder:
                  (context, AsyncSnapshot<List<Mesaj>> streamMesajlarListesi) {
                if (streamMesajlarListesi.hasData) {
                  return ListView.builder(
                    reverse: true,
                    controller: _scrollController,
                    itemBuilder: (context, index) {
                      return _konusmaBalonuOlustur(
                          streamMesajlarListesi.data![index]);
                    },
                    itemCount: streamMesajlarListesi.data!.length,
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 8, left: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  flex: 9,
                  child: TextField(
                    controller: _mesajController,
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "Mesajınızı yazın",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide.none)),
                    cursorColor: Colors.blue,
                    style: TextStyle(fontSize: 16.0, color: Colors.black),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: FloatingActionButton(
                    child: Icon(Icons.navigation),
                    onPressed: () {
                      if (_mesajController.text.trim().length > 0) {
                        Mesaj _kaydedilecekMesaj = Mesaj(
                            kimden: _currentUser.userID.toString(),
                            kime: _sohbetEdilenUser.userID.toString(),
                            bendenMi: true,
                            mesaj: _mesajController.text);

                        _userModel.saveMessage(_kaydedilecekMesaj);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _konusmaBalonuOlustur(Mesaj oankiMesaj) {
    Color _gelenMesajRenk = Colors.blue;
    Color _gidenMesajRenk = Theme.of(context).primaryColor;

    var _saatDakikaDegeri = "";

    try {
      _saatDakikaDegeri = _saatDakikaGoster(oankiMesaj.date ?? Timestamp(1, 1));
    } catch (e) {
      print("hata var:" + e.toString());
    }

    var _benimMesajimMi = oankiMesaj.bendenMi;
    if (_benimMesajimMi) {
      return Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Flexible(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: _gidenMesajRenk,
                    ),
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(4),
                    child: Text(
                      oankiMesaj.mesaj,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Text(_saatDakikaDegeri),
              ],
            ),
          ],
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.grey.withAlpha(40),
                ),
                Flexible(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: _gelenMesajRenk,
                    ),
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(4),
                    child: Text(oankiMesaj.mesaj),
                  ),
                ),
                Text(_saatDakikaDegeri),
              ],
            )
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
      );
    }
  }

  String _saatDakikaGoster(Timestamp? date) {
    return DateFormat.Hm().format(date!.toDate());
  }
}
