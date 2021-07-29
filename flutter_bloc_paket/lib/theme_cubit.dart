import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(_acikTema);

  static final _acikTema = ThemeData(
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
        backgroundColor: Colors.teal,
      ),
      primarySwatch: Colors.purple,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      brightness: Brightness.light);
  static final _koyuTema = ThemeData(
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        foregroundColor: Colors.orange, backgroundColor: Colors.yellow),
    brightness: Brightness.dark,
    primarySwatch: Colors.purple,
  );

  void temaDegistir() {
    emit(state.brightness == Brightness.dark ? _acikTema : _koyuTema);
  }
}
