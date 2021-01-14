import 'package:Ijakhdem/Core/Utils/alertDialogPopup.dart';
import 'package:Ijakhdem/Core/Utils/inputChecker.dart';
import 'package:Ijakhdem/Features/Signin/Presentation/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';

class LoginDisplay extends StatefulWidget {
  final String message;

  const LoginDisplay({
    Key key,
    this.message,
  }) : super(key: key);

  @override
  _LoginDisplayState createState() => _LoginDisplayState();
}

class _LoginDisplayState extends State<LoginDisplay> {
  String email = '';
  String password = '';
  String message = 'null';
  bool checkerEmail = true;
  bool checkerPassword = true;
  String checkerEmailMessage = 'Email must be like username@serveur.extension';
  String checkerPasswordMessage =
      'Password must contain at least 8 characters, 1 uppercase letter, 1 number, and 1 special character';
  bool toggleVisibility = true;

  static showOverlay(
      BuildContext context, String headerMessage, String message) {
    Navigator.of(context).push(AlertDialogPopup(headerMessage, message));
  }

  @override
  void initState() {
    super.initState();

    if (widget.message != null && widget.message != 'null') {
      Future.delayed(Duration.zero,
          () => showOverlay(context, "Problem infos", widget.message));
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width * 0.04 / 14.5;
    double screenHeight = MediaQuery.of(context).size.height * 0.02 / 14;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(screenWidth * 16, screenWidth * 52,
              screenWidth * 16, screenWidth * 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Image.asset(
                  "Assets/Images/logo.png",
                  height: screenHeight * 80,
                  width: screenWidth * 201.64,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40, bottom: 37),
                child: Center(
                    child: Image.asset(
                  "Assets/Images/splash.png",
                  fit: BoxFit.cover,
                  height: screenWidth * 130, //145.95,
                  width: screenWidth * 150, //197.57,
                )),
              ),
              Text(
                'Login',
                textScaleFactor: 1.0,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: screenWidth * 28,
                    color: Color(0xff231F20)),
              ),
              SizedBox(
                height: screenHeight * 29,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    initialValue: email,
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      email = value;
                      setState(() {
                        checkerEmail = regExpEmail.hasMatch(email);
                      });
                    },
                    style: TextStyle(
                        color: Color(0xff231F20),
                        fontWeight: FontWeight.w500,
                        fontSize: screenWidth * 21),
                    decoration: InputDecoration(
                        hintText: 'Email',
                        hintStyle: TextStyle(
                            color: Colors.grey[800],
                            fontWeight: FontWeight.w400,
                            fontSize: screenWidth * 21)),
                  ),
                  checkerEmail
                      ? Container()
                      : Padding(
                          padding: EdgeInsets.only(top: 12.0),
                          child: Center(
                            child: Text(
                              checkerEmailMessage,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                ],
              ),
              SizedBox(
                height: screenHeight * 18,
              ),
              Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextFormField(
                        initialValue: password,
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) {
                          password = value;
                          setState(() {
                            checkerPassword = regExpPassword.hasMatch(password);
                          });
                        },
                        style: TextStyle(
                            color: Color(0xff231F20),
                            fontWeight: FontWeight.w500,
                            fontSize: screenWidth * 21),
                        obscureText: toggleVisibility,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                              icon: toggleVisibility
                                  ? Icon(
                                      Icons.visibility_off,
                                    )
                                  : Icon(
                                      Icons.visibility,
                                    ),
                              onPressed: () {
                                setState(() {
                                  toggleVisibility = !toggleVisibility;
                                });
                              }),
                          hintText: 'Password',
                          hintStyle: TextStyle(
                            color: Colors.grey[800],
                            fontWeight: FontWeight.w400,
                            fontSize: screenWidth * 21,
                          ),
                        ),
                      ),
                      checkerPassword
                          ? Container()
                          : Padding(
                              padding: EdgeInsets.only(top: 12.0),
                              child: Center(
                                child: Text(
                                  checkerPasswordMessage,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: screenWidth * 10.5,
              ),
              GestureDetector(
                  onTap: () {
                    dispatchGoToForgotPassword();
                  },
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: screenWidth * 14,
                      color: Color(0xffEC1C40),
                    ),
                  )),
              SizedBox(
                height: screenHeight * 35,
              ),
              ButtonTheme(
                height: screenWidth * 64.0,
                minWidth: MediaQuery.of(context).size.width ?? double.infinity,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: RaisedButton(
                  color: Colors.blue[900],
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      letterSpacing: screenWidth * 0.2,
                      fontSize: screenWidth * 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onPressed: () {
                    if (checkerEmail &&
                        checkerPassword &&
                        email != null &&
                        password != null) {
                      dispatchLogin(
                        email,
                        password,
                      );
                    }
                  },
                ),
              ),
              SizedBox(
                height: screenHeight * 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      dispatchLoginFacebook();
                    },
                    child: Row(
                      children: [
                        Image.asset(
                          "Assets/Images/icon-fb.png",
                          height: screenWidth * 21,
                          width: screenWidth * 21,
                        ),
                        SizedBox(width: 2),
                        Text(
                          'USING FACEBOOK',
                          style: TextStyle(
                              fontSize: screenWidth * 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff231F20)),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: screenHeight * 25,
                    width: screenWidth * 1,
                    color: Color(0xff231F20),
                  ),
                  InkWell(
                    onTap: () {
                      dispatchLoginGoogle();
                    },
                    child: Row(
                      children: [
                        Image.asset(
                          "Assets/Images/icon-google.png",
                          height: screenWidth * 21,
                          width: screenWidth * 21,
                        ),
                        SizedBox(width: 2),
                        Text(
                          'USING GOOGLE',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: screenWidth * 14,
                              color: Color(0xff231F20)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: screenHeight * 68,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'New User?',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Color(0xff999999),
                        fontSize: screenWidth * 14),
                  ),
                  GestureDetector(
                    onTap: () {
                      dispatchGoToSignup();
                    },
                    child: Text(
                      'Create an account',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.underline,
                          color: Color(0xffEC1C40),
                          fontSize: screenWidth * 14),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: screenHeight * 50,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void dispatchLogin(String email, String password) {
    BlocProvider.of<LoginBloc>(context).dispatch(SigninEvent(
      email: email,
      password: password,
      isConnected: false,
    ));
  }

  void dispatchLoginFacebook() {
    BlocProvider.of<LoginBloc>(context).dispatch(SigningGoogleEvent());
  }

  void dispatchLoginGoogle() {
    BlocProvider.of<LoginBloc>(context).dispatch(SigningFacebookEvent());
  }

  void dispatchGoToSignup() {
    BlocProvider.of<LoginBloc>(context).dispatch(GoToSignupEvent());
  }

  void dispatchGoToForgotPassword() {
    BlocProvider.of<LoginBloc>(context).dispatch(GoToForgotPasswordEvent());
  }
}
