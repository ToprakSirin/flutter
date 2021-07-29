//import 'package:equatable/equatable.dart';
part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class InitialWeatherState extends WeatherState {}

class WeatherLoadingState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  final Weather weather;
  WeatherLoadedState({required this.weather}) : super();
}

class WeatherErrorState extends WeatherState {}
