import 'package:flutter/material.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profil"),
        actions: [
          TextButton(
              onPressed: () {},
              child: Text(
                "Çıkış",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ))
        ],
      ),
      body: Center(
        child: Text("Profil Sayfası"),
      ),
    );
  }
}
