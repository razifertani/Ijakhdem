import 'package:Ijakhdem/Core/Routes/routes.dart';
import 'package:Ijakhdem/Core/Utils/appColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:Ijakhdem/injection_container.dart' as sl;
// import 'package:device_preview/device_preview.dart' show DevicePreview;

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
    SystemChrome.setEnabledSystemUIOverlays([]);

    return MaterialApp(
      // builder: DevicePreview.appBuilder,
      title: 'Ijakhdem',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto',
        primaryColor: AppColors.primaryColor,
        buttonColor: AppColors.primaryColor,
      ),
      initialRoute: '/signinProvider',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
