import 'package:Ijakhdem/Features/Home/Presentation/Pages/homeProvider.dart';
import 'package:Ijakhdem/Features/Signin/Presentation/Pages/signinProvider.dart';
import 'package:Ijakhdem/Features/PostJob/Presentation/Pages/postJobProvider.dart';
import 'package:Ijakhdem/Features/MyJobs/Presentation/Pages/myJobsProvider.dart';
import 'package:Ijakhdem/Features/Messages/Presentation/Pages/messagesProvider.dart';
import 'package:Ijakhdem/Features/Profile/Presentation/Pages/profileProvider.dart';
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
        return PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) {
            return HomeProvider(
              profile: settings.arguments,
            );
          },
        );
      /*
        return MaterialPageRoute(
          builder: (_) => HomeProvider(
            profile: settings.arguments,
          ),
        );
  */

      case '/myJobsProvider':
        return PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) {
            return MyJobsProvider(
              profile: settings.arguments,
            );
          },
        );
      /*
        return MaterialPageRoute(
          builder: (_) => MyJobsProvider(
            profile: settings.arguments,
          ),
        );
      */
      case '/postJobProvider':
        return PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) {
            return PostJobProvider(
              profile: settings.arguments,
            );
          },
        );
      /*
        return MaterialPageRoute(
          builder: (_) => PostJobProvider(
            profile: settings.arguments,
          ),
        );
        */
      case '/messagesProvider':
        return PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) {
            return MessagesProvider(
              profile: settings.arguments,
            );
          },
        );
      /*
        return MaterialPageRoute(
          builder: (_) => MessagesProvider(
            profile: settings.arguments,
          ),
        );
*/

      case '/profileProvider':
        return PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) {
            return ProfileProvider(
              profile: settings.arguments,
            );
          },
        );
        /*
        return MaterialPageRoute(
          builder: (_) => ProfileProvider(
            profile: settings.arguments,
          ),
        );
*/
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
