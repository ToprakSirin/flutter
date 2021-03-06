import 'dart:convert';
import 'package:flutter_weatherapp_with_bloc/models/weather.dart';
import 'package:http/http.dart' as http;

class WeatherApiClient {
  static const baseUrl = "https://www.metaweather.com";
  final http.Client httpClient = http.Client();

  Future<int> getLocationID(String sehirAdi) async {
    final sehirUrl = baseUrl + "/api/location/search/?query=" + sehirAdi;

    final gelenCevap = await httpClient.get(Uri.parse(sehirUrl));

    if (gelenCevap.statusCode != 200) {
      throw Exception("Veri Getirilemedi");
    }
    final gelenCevapJSON = (jsonDecode(gelenCevap.body)) as List;
    return gelenCevapJSON[0]["woeid"];
  }

  Future<Weather> getWeather(int sehirID) async {
    final havaDurumuUrl = baseUrl + "/api/location/$sehirID";
    final havaDurumuGelenCevap = await httpClient.get(Uri.parse(havaDurumuUrl));
    if (havaDurumuGelenCevap.statusCode != 200) {
      throw Exception("Veri Getirilemedi");
    }
    final havaDurumuCevapJSON = (jsonDecode(havaDurumuGelenCevap.body));
    return Weather.fromJson(havaDurumuCevapJSON);
  }
}
