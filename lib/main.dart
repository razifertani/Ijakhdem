import 'package:Ijakhdem/Core/Routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:Ijakhdem/injection_container.dart' as sl;
import 'package:device_preview/device_preview.dart' show DevicePreview;

void main() {
  sl.init();
  runApp(
    // DevicePreview(
    //   enabled: true,
    //   builder: (context) =>
    MyApp(),
    // ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return MaterialApp(
      // builder: DevicePreview.appBuilder,
      title: 'Ijakhdem',
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   fontFamily: 'SourceSansPro',
      //   primaryColor: Color.fromRGBO(236, 28, 64, 1.0),
      // ),
      initialRoute: '/signinProvider',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
