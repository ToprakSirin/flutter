import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_navigations/green_page.dart';
import 'package:flutter_navigations/orange_page.dart';
import 'package:flutter_navigations/red_page.dart';
import 'package:flutter_navigations/route_generated.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      //home: AnaSayfa(),
      /*  routes: {
        '/redPage': (context) => RedPage(),
        '/': (context) => AnaSayfa(),
        '/orangepage': (context) => OrangePage(),
      },
      onUnknownRoute: (settings) => MaterialPageRoute(
          builder: (context) => Scaffold(
                appBar: AppBar(
                  title: Text('Error'),
                ),
                body: Center(
                  child: Text('404'),
                ),
              )), */

      onGenerateRoute: RouteGenerator.routeGenerator,
    );
  }
}

class AnaSayfa extends StatelessWidget {
  const AnaSayfa({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigation Islemleri'),
      ),
      body: Center(
          child: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              int? _gelenSayi = await Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (redcontext) => RedPage(),
                ),
              );
              print('Ana Sayfadaki sayı $_gelenSayi');
            },
            style: ElevatedButton.styleFrom(primary: Colors.red.shade300),
            child: Text(
              'Kırmızı Sayfaya Git IOS',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Navigator.push(context, route);
              Navigator.of(context)
                  .push(
                    MaterialPageRoute(
                      builder: (redcontext) => RedPage(),
                    ),
                  )
                  .then((value) => debugPrint('Gelen sayi $value'));
            },
            style: ElevatedButton.styleFrom(primary: Colors.red.shade600),
            child: Text(
              'Kırmızı Sayfaya Git Android',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).maybePop();
            },
            style: ElevatedButton.styleFrom(primary: Colors.red.shade600),
            child: Text(
              'Maybe Pop Kullanımı',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (Navigator.canPop(context)) {
                print("Evet pop olabilir..");
              } else {
                print("Hayır olamaz");
              }
            },
            style: ElevatedButton.styleFrom(primary: Colors.red.shade600),
            child: Text(
              'Can Pop Kullanımı',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => GreenPage(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(primary: Colors.red.shade600),
            child: Text(
              'Push Replacement Kullanımı',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              //Navigator.of(context).pushNamed(routeName);
              Navigator.pushNamed(context, '/OrangePage');
            },
            style: ElevatedButton.styleFrom(primary: Colors.blue.shade600),
            child: Text(
              'Pushname Kullanımı',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              //Navigator.of(context).pushNamed(routeName);
              Navigator.pushNamed(context, '/yellowPage');
            },
            style: ElevatedButton.styleFrom(primary: Colors.yellow.shade600),
            child: Text(
              'Pushname Kullanımı',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/ogrenciListesi', arguments: 60);
            },
            style: ElevatedButton.styleFrom(primary: Colors.orange.shade600),
            child: Text(
              'Liste Olustur',
            ),
          ),
        ],
      )),
    );
  }
}
