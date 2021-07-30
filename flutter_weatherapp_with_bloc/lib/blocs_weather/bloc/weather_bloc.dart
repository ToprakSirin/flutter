import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_weatherapp_with_bloc/locator.dart';

import 'package:flutter_weatherapp_with_bloc/models/weather.dart';
import 'package:flutter_weatherapp_with_bloc/data/weather_repository.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository = locator<WeatherRepository>();
  //final WeatherRepository weatherRepository2 = locator.get<WeatherRepository>();

  WeatherBloc() : super(InitialWeatherState());

  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    if (event is FetchWeatherEvent) {
      yield WeatherLoadingState();
      try {
        final Weather getirilenWeather =
            await weatherRepository.getWeather(event.sehirAdi);
        //hava durumunu getiren kodlar
        yield WeatherLoadedState(weather: getirilenWeather);
      } catch (e) {
        yield WeatherErrorState();
      }
    }
  }
}
