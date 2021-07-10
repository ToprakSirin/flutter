import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'models/gonderi.dart';

class RemoteApiKullanimi extends StatefulWidget {
  const RemoteApiKullanimi({Key? key}) : super(key: key);

  @override
  _RemoteApiKullanimiState createState() => _RemoteApiKullanimiState();
}

class _RemoteApiKullanimiState extends State<RemoteApiKullanimi> {
  Future<List<Gonderi>> _gonderiGetir() async {
    var response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    if (response.statusCode == 200) {
      //return Gonderi.fromJson(json.decode(response.body));
      return (jsonDecode(response.body) as List)
          .map((tekGonderiMap) => Gonderi.fromJson(tekGonderiMap))
          .toList();
    } else {
      throw Exception("Bağlanamadı ${response.statusCode}");
    }
  }

  /*  @override
  void initState() {
    super.initState();
    _gonderiGetir().then((okunanGonderi) {
      gonderi = okunanGonderi;
      debugPrint("gelen değer :" + gonderi!.title.toString());
    });
  } */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Remot Api Kullanımı"),
        ),
        body: FutureBuilder(
          future: _gonderiGetir(),
          builder: (BuildContext context, AsyncSnapshot<List<Gonderi>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(itemCount:snapshot.data!.length ,itemBuilder: (context,index){
                return ListTile(
                title: Text(snapshot.data![index].title.toString()),
                subtitle: Text(snapshot.data![index].toString()),
                leading: CircleAvatar(
                  child: Text(snapshot.data![index].id.toString()),
                ),
              );
              });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}
