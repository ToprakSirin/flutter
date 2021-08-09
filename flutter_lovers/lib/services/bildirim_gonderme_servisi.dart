import 'package:flutter_lovers/model/mesaj.dart';
import 'package:flutter_lovers/model/user.dart';
import 'package:http/http.dart' as http;

class BildirimGondermeServis {
  Future<bool> bildirimGonder(Mesaj gonderilecekBildirim,
      MyUser gonderenUser, String token) async {
    String endURL = "https://fcm.googleapis.com/fcm/send";
    String firebaseKey =
        "AAAABCx-gMw:APA91bGov1noChHhk-CpNBKiw7B_Z9lXhs3cbQtX1K-5Q09uZuE0wb9qHr-dp-bmW8eFlXbn1G-BA9ijedkha3suwVBhtEd260bHAHXgCYOZiO2fLya1UGYRUhDwHY_uVpgE3f8FQrvc";
    Map<String, String> headers = {
      "Content-type": "application/json",
      "Authorization": "key=$firebaseKey"
    };

    String json =
        '{ "to" : "$token", "data" : { "message" : "${gonderilecekBildirim.message}", "title": "${gonderenUser.userName} yeni mesaj", "profilURL": "${gonderenUser.profilURL}", "gonderenUserID" : "${gonderenUser.userId}" } }';

    http.Response response =
        await http.post(Uri.parse(endURL), headers: headers, body: json);

    if (response.statusCode == 200) {
      print("işlem basarılı");
    } else {
      /*print("işlem basarısız:" + response.statusCode.toString());
      print("jsonumuz:" + json);*/
    }
    throw Exception();
  }
}
