import 'package:flutter/material.dart';
import 'package:flutter_weatherapp_with_bloc/widget/hava_durumu_resim.dart';
import 'package:flutter_weatherapp_with_bloc/widget/location.dart';
import 'package:flutter_weatherapp_with_bloc/widget/max_min_sicaklik.dart';
import 'package:flutter_weatherapp_with_bloc/widget/sehir_sec.dart';
import 'package:flutter_weatherapp_with_bloc/widget/son_guncelleme.dart';

class WeatherApp extends StatelessWidget {
  String kullanicininSectigiSehir = "Ankara";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather App"),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              kullanicininSectigiSehir = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SehirSecWidget(),
                  ));
              debugPrint("Seçilen Şehir: " + kullanicininSectigiSehir);
            },
          ),
        ],
      ),
      body: Center(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  child: LocationWidget(
                secilenSehir: kullanicininSectigiSehir,
              )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: SonGuncellemeWidget()),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: HavaDurumuResimWidget()),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(child: MaxveMinSicaklikWidget()),
            ),
          ],
        ),
      ),
    );
  }
}
