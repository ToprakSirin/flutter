import 'package:flutter/material.dart';
import 'package:flutter_lovers/model/mesaj.dart';
import 'package:flutter_lovers/model/user.dart';
import 'package:flutter_lovers/viewmodel/user_view_model.dart';
import 'package:provider/provider.dart';

class Konusma extends StatefulWidget {
  MyUser currentUser;
  MyUser sohbetEdileUser;
  Konusma({required this.currentUser, required this.sohbetEdileUser});

  @override
  _KonusmaState createState() => _KonusmaState();
}

class _KonusmaState extends State<Konusma> {
  var _mesajController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _userModel = Provider.of<UserViewModel>(context);
    MyUser _currentUserID = widget.currentUser;
    MyUser _sohbetEdilenUserID = widget.sohbetEdileUser;
    return Scaffold(
        appBar: AppBar(
          title: Text("Sohbet"),
        ),
        body: Column(
          children: [
            Expanded(
              child: StreamBuilder<List<Mesaj>>(
                stream: _userModel.getMessages(_currentUserID.userID.toString(),
                    _sohbetEdilenUserID.userID.toString()),
                builder: (context, streamMesajlarListesi) {
                  if (!streamMesajlarListesi.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  List<Mesaj>? tumMesajlar = streamMesajlarListesi.data;
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      return Text(tumMesajlar![index].toString());
                    },
                    itemCount: tumMesajlar!.length,
                  );
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
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    child: FloatingActionButton(
                      elevation: 0,
                      backgroundColor: Colors.blue,
                      child: Icon(
                        Icons.navigation,
                        size: 35,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
