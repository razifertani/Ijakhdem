import 'dart:async';
import 'package:Ijakhdem/Core/Utils/appColors.dart';
import 'package:Ijakhdem/Features/Signin/Presentation/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenDisplay extends StatefulWidget {
  const SplashScreenDisplay({
    Key key,
  }) : super(key: key);

  @override
  _SplashScreenDisplayState createState() => _SplashScreenDisplayState();
}

class _SplashScreenDisplayState extends State<SplashScreenDisplay> {
  Future<bool> stayConnected;

  @override
  void initState() {
    super.initState();

    Timer(Duration(milliseconds: 2000), () {
      stayLoggedIn();
    });
  }

  stayLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getBool("stayConnected") == true) {
      BlocProvider.of<LoginBloc>(context).dispatch(
        SigninEvent(
          email: prefs.getString("email"),
          password: prefs.getString("password"),
          isConnected: true,
        ),
      );
    } else {
      Timer(Duration(milliseconds: 1000), () {
        BlocProvider.of<LoginBloc>(context).dispatch(GoToOnBoardingEvent());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "Assets/Images/logo.png",
              height: screenHeight * 0.4,
              width: screenWidth * 0.8,
            ),
            SizedBox(
              height: screenHeight * 0.1,
            ),
            Text(
              "V 0.0.1",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: AppColors.blackColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
