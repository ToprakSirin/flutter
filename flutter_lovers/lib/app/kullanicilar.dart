import 'package:flutter/material.dart';

class KullanicilarPage extends StatelessWidget {
  const KullanicilarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kullanıcılar"),
        actions: [IconButton(onPressed: (){
          
        }, icon: Icon(Icons.title))],
      ),
      body: Center(
        child: Text("Kullanıcılar Sayfası"),
      ),
    );
  }
}
