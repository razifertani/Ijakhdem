import 'package:Ijakhdem/Features/Home/Presentation/Pages/homeProvider.dart';
import 'package:Ijakhdem/Features/Signin/Presentation/Pages/signinProvider.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/signinProvider':
        return MaterialPageRoute(
          builder: (_) => SigninProvider(
            fromLogout: settings.arguments,
          ),
        );

      case '/homeProvider':
        return MaterialPageRoute(
          builder: (_) => HomeProvider(
            profile: settings.arguments,
          ),
        );

        return errorRoute();
      default:
        return errorRoute();
    }
  }

  static Route<dynamic> errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.all(20.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Error',
                    style: TextStyle(
                      fontSize: 80.0,
                      color: Colors.red,
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Text(
                    '404 Not Found',
                    style: TextStyle(fontSize: 50.0),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
