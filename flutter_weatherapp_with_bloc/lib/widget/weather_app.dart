import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weatherapp_with_bloc/blocs_weather/bloc/weather_bloc.dart';
import 'package:flutter_weatherapp_with_bloc/widget/hava_durumu_resim.dart';
import 'package:flutter_weatherapp_with_bloc/widget/location.dart';
import 'package:flutter_weatherapp_with_bloc/widget/max_min_sicaklik.dart';
import 'package:flutter_weatherapp_with_bloc/widget/sehir_sec.dart';
import 'package:flutter_weatherapp_with_bloc/widget/son_guncelleme.dart';

class WeatherApp extends StatelessWidget {
  String _kullanicininSectigiSehir = "Ankara";
  @override
  Widget build(BuildContext context) {
    final _weatherBloc = BlocProvider.of<WeatherBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather App"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () async {
                _kullanicininSectigiSehir = await Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SehirSecWidget()));
                if (_kullanicininSectigiSehir != null) {
                  _weatherBloc.add(
                      FetchWeatherEvent(sehirAdi: _kullanicininSectigiSehir));
                }
              }),
        ],
      ),
      body: Center(
        child: BlocBuilder(
          bloc: _weatherBloc,
          builder: (context, WeatherState state) {
            if (state is InitialWeatherState) {
              return Center(
                child: Text("Şehir Seçiniz"),
              );
            }
            if (state is WeatherLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is WeatherLoadedState) {
              final getirilenWeather = state.weather;
              getirilenWeather.consolidatedWeather[0];

              return ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                        child: LocationWidget(
                      secilenSehir: getirilenWeather.title,
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
              );
            }
            if (state is WeatherErrorState) {
              return Text("Hata Oluştu");
            }
            return Text("Hata ");
          },
        ),
      ),
    );
  }
}
