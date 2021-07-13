import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_google_maps/flutter_google_maps.dart';
import 'package:provider/provider.dart';
import 'package:tracker/components/util/color_util.dart';
import 'package:tracker/components/util/screen_util.dart';
import 'package:tracker/models/driver_home/driver_home_model.dart';
import 'package:tracker/models/login/login_model.dart';
import 'package:tracker/views/splash/splash_view.dart';

void main() {
  GoogleMap.init('AIzaSyDsWCMuFTSi9rOnkS15qEg4_DlcIzZU2ms');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            return MultiProvider(
              providers: [
                ChangeNotifierProvider(
                  create: (context) => LoginModel(),
                ),
                ChangeNotifierProvider(
                  create: (context) => DriverHomeModel.instance(),
                ),
              ],
              child: MaterialApp(
                theme: ThemeData(
                    primaryColor: HexColor(hexColor: "FFD64D"),
                    buttonColor: HexColor(hexColor: "000000")),
                debugShowCheckedModeBanner: false,
                home: SplashScreen(),
              ),
            );
          },
        );
      },
    );
  }
}
