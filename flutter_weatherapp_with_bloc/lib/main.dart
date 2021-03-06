import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weatherapp_with_bloc/blocs_weather/bloc/weather_bloc.dart';
import 'package:flutter_weatherapp_with_bloc/blocs_weather/tema/bloc/tema_bloc.dart';
import 'package:flutter_weatherapp_with_bloc/locator.dart';
import 'package:flutter_weatherapp_with_bloc/widget/weather_app.dart';

void main() {
  setupLocator();
  runApp(
    BlocProvider<TemaBloc>(
      create: (context) => TemaBloc(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: BlocProvider.of<TemaBloc>(context),
      builder: (context, TemaState state) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Weather App',
        theme: (state as UygulamaTemasi).tema,
        home: BlocProvider<WeatherBloc>(
          create: (context) => WeatherBloc(),
          child: WeatherApp(),
        ),
      ),
    );
  }
}
