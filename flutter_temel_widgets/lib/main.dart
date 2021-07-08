import 'package:flutter/material.dart';
import 'package:flutter_temel_widgets/image_widgets.dart';
import 'package:flutter_temel_widgets/my_counter_page.dart';
import 'package:flutter_temel_widgets/popup_menu_kullanimi.dart';
import 'package:flutter_temel_widgets/temel_buton_turleri.dart';

import 'dropdown_button_kullanimi.dart';

void main() {
  debugPrint('main metodu çalıştı');
  runApp(MyApp()); // flutter projesini ayağa kaldıran yapı
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    debugPrint('myapp metodu çalıştı');
    return MaterialApp(
      title: 'My Counter App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.teal,
          outlinedButtonTheme:
              OutlinedButtonThemeData(style: OutlinedButton.styleFrom()),
          textButtonTheme: TextButtonThemeData(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue))),
          textTheme: TextTheme(
              headline1: TextStyle(
                  color: Colors.purple, fontWeight: FontWeight.bold))),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Buton Örnekleri'),
          actions: [PopupMenuKullanimi()],
        ),
        body: PopupMenuKullanimi(),
      ), // Uygulamanın ilk açılış sayfası
    );
  }
}
