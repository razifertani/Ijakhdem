import 'dart:async';
import 'package:Ijakhdem/Core/Utils/alertDialogPopup.dart';
import 'package:Ijakhdem/Core/Utils/appColors.dart';
import 'package:Ijakhdem/Core/Utils/inputChecker.dart';
import 'package:Ijakhdem/Features/Signin/Presentation/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterDisplay extends StatefulWidget {
  final String message;

  const RegisterDisplay({Key key, this.message}) : super(key: key);

  @override
  _RegisterDisplayState createState() => _RegisterDisplayState();
}

class _RegisterDisplayState extends State<RegisterDisplay> {
  bool _toggleVisibility = true;
  String message = 'null';
  String fName, lName, email, password;
  bool checkerFName = true;
  bool checkerLName = true;
  bool checkerEmail = true;
  bool checkerPassword = true;
  String checkerNameMessage = 'Name should not contain symbols';
  String checkerEmailMessage = 'Email must be like username@serveur.extension';
  String checkerPasswordMessage =
      'Password must contain at least 8 characters, 1 uppercase letter, 1 number, and 1 special character';

  static showOverlay(
      BuildContext context, String headerMessage, String message) {
    Navigator.of(context).push(AlertDialogPopup(headerMessage, message));
  }

  @override
  void initState() {
    if (widget.message != null) {
      Future.delayed(
          Duration.zero, () => showOverlay(context, "Problem infos", message));
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width * 0.04 / 14.5;
    double screenHeight = MediaQuery.of(context).size.height * 0.02 / 14;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(16, 52, 16, 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Image.asset(
                  "Assets/Images/logo.png",
                  fit: BoxFit.fitHeight,
                  height: screenHeight * 150,
                ),
              ),
              SizedBox(
                height: (MediaQuery.of(context).size.height * 0.02 / 14) * 57,
              ),
              Text(
                'Create New Account',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize:
                      (MediaQuery.of(context).size.width * 0.04 / 14.5) * 28,
                  color: AppColors.primaryColor,
                ),
              ),
              SizedBox(
                height: (MediaQuery.of(context).size.width * 0.04 / 14.5) * 29,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        TextFormField(
                          keyboardType: TextInputType.text,
                          style: TextStyle(
                              color: AppColors.blackColor,
                              fontWeight: FontWeight.w500,
                              fontSize: (MediaQuery.of(context).size.width *
                                      0.04 /
                                      14.5) *
                                  21),
                          onChanged: (value) {
                            fName = value;
                            setState(() {
                              checkerFName = regExpName.hasMatch(fName);
                            });
                          },
                          decoration: InputDecoration(
                            hintText: 'First Name',
                            hintStyle: TextStyle(
                                color: AppColors.hintColor,
                                fontWeight: FontWeight.w400,
                                fontSize: (MediaQuery.of(context).size.width *
                                        0.04 /
                                        14.5) *
                                    21),
                          ),
                        ),
                        checkerFName
                            ? Container()
                            : Padding(
                                padding: EdgeInsets.only(top: 12.0),
                                child: Center(
                                  child: Text(
                                    checkerNameMessage,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: (MediaQuery.of(context).size.width * 0.04 / 14.5) *
                        11.5,
                  ),
                  Expanded(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        TextFormField(
                          keyboardType: TextInputType.text,
                          style: TextStyle(
                              color: AppColors.blackColor,
                              fontWeight: FontWeight.w500,
                              fontSize: (MediaQuery.of(context).size.width *
                                      0.04 /
                                      14.5) *
                                  21),
                          onChanged: (value) {
                            lName = value;
                            setState(() {
                              checkerLName = regExpName.hasMatch(lName);
                            });
                          },
                          decoration: InputDecoration(
                            hintText: 'Last Name',
                            hintStyle: TextStyle(
                                color: AppColors.hintColor,
                                fontWeight: FontWeight.w400,
                                fontSize: (MediaQuery.of(context).size.width *
                                        0.04 /
                                        14.5) *
                                    21),
                          ),
                        ),
                        checkerLName
                            ? Container()
                            : Padding(
                                padding: EdgeInsets.only(top: 12.0),
                                child: Center(
                                  child: Text(
                                    checkerNameMessage,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: (MediaQuery.of(context).size.height * 0.02 / 14) * 29,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(
                        color: AppColors.blackColor,
                        fontWeight: FontWeight.w500,
                        fontSize:
                            (MediaQuery.of(context).size.width * 0.04 / 14.5) *
                                21),
                    onChanged: (value) {
                      email = value;
                      setState(() {
                        checkerEmail = regExpEmail.hasMatch(email);
                      });
                    },
                    decoration: InputDecoration(
                        hintText: 'Email',
                        hintStyle: TextStyle(
                            color: AppColors.hintColor,
                            fontWeight: FontWeight.w400,
                            fontSize: (MediaQuery.of(context).size.width *
                                    0.04 /
                                    14.5) *
                                21)),
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
                height: (MediaQuery.of(context).size.height * 0.02 / 14) * 23.5,
              ),
              Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(
                            color: AppColors.blackColor,
                            fontWeight: FontWeight.w500,
                            fontSize: (MediaQuery.of(context).size.width *
                                    0.04 /
                                    14.5) *
                                21),
                        onChanged: (value) {
                          password = value;
                          setState(() {
                            checkerPassword = regExpPassword.hasMatch(password);
                          });
                        },
                        obscureText: _toggleVisibility,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                              icon: _toggleVisibility
                                  ? Icon(
                                      Icons.visibility_off,
                                    )
                                  : Icon(
                                      Icons.visibility,
                                    ),
                              onPressed: () {
                                setState(() {
                                  _toggleVisibility = !_toggleVisibility;
                                });
                              }),
                          hintText: 'Password',
                          hintStyle: TextStyle(
                              color: AppColors.hintColor,
                              fontWeight: FontWeight.w400,
                              fontSize: (MediaQuery.of(context).size.width *
                                      0.04 /
                                      14.5) *
                                  21),
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
                height: (MediaQuery.of(context).size.height * 0.02 / 14) * 24,
              ),
              ButtonTheme(
                height: screenWidth * 64.0,
                minWidth: MediaQuery.of(context).size.width ?? double.infinity,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: RaisedButton(
                  color: AppColors.primaryColor,
                  child: Text(
                    'Register Now',
                    style: TextStyle(
                      color: Colors.white,
                      letterSpacing: screenWidth * 0.2,
                      fontSize: screenWidth * 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onPressed: () {
                    if ((fName == null || fName == '') &&
                        (lName == null || lName == '') &&
                        (email == null || email == '') &&
                        (password == null || password == '')) {
                      setState(() {
                        checkerFName = false;
                        checkerLName = false;
                        checkerEmail = false;
                        checkerPassword = false;
                      });
                    } else if (fName == null || fName == '') {
                      setState(() {
                        checkerFName = false;
                      });
                    } else if (lName == null || lName == '') {
                      setState(() {
                        checkerLName = false;
                      });
                    } else if (email == null || email == '') {
                      setState(() {
                        checkerEmail = false;
                      });
                    } else if (password == null || password == '') {
                      setState(() {
                        checkerPassword = false;
                      });
                    } else if (checkerEmail && checkerPassword) {
                      dispatchRegister(
                        fName,
                        lName,
                        email,
                        password,
                      );
                    }
                    if (checkerFName &&
                        checkerLName &&
                        checkerEmail &&
                        checkerPassword &&
                        fName != null &&
                        lName != null &&
                        email != null &&
                        password != null) {
                      dispatchRegister(
                        fName,
                        lName,
                        email,
                        password,
                      );
                    }
                  },
                ),
              ),
              SizedBox(
                height: (MediaQuery.of(context).size.height * 0.02 / 14) * 37.5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  GestureDetector(
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
                        Container(
                          width: screenWidth * 5,
                        ),
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
                  GestureDetector(
                    onTap: () {},
                    child: Row(
                      children: [
                        Image.asset(
                          "Assets/Images/icon-google.png",
                          height: screenWidth * 21,
                          width: screenWidth * 21,
                        ),
                        Container(
                          width: screenWidth * 5,
                        ),
                        Text(
                          'USING GOOGLE',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: screenWidth * 14,
                            color: AppColors.blackColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: (MediaQuery.of(context).size.height * 0.02 / 14) * 54.4,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Already have an account ? ',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: AppColors.blackColor,
                        fontSize:
                            (MediaQuery.of(context).size.width * 0.04 / 14.5) *
                                12),
                  ),
                  GestureDetector(
                    onTap: () {
                      dispatchGoToLogin();
                    },
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                          color: AppColors.primaryColor,
                          fontSize: (MediaQuery.of(context).size.width *
                                  0.04 /
                                  14.5) *
                              12),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: (MediaQuery.of(context).size.height * 0.02 / 14) * 19,
              ),
              Center(
                  child: Text(
                'By registration, ',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize:
                      (MediaQuery.of(context).size.width * 0.04 / 14.5) * 12,
                  color: AppColors.blackColor,
                ),
              )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'I agree to the ',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: AppColors.blackColor,
                        fontSize:
                            (MediaQuery.of(context).size.width * 0.04 / 14.5) *
                                12),
                  ),
                  GestureDetector(
                    onTap: () {
                      dispatchGoToTermsOfUse();
                    },
                    child: Text(
                      'Terms of Use',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                          color: AppColors.primaryColor,
                          fontSize: (MediaQuery.of(context).size.width *
                                  0.04 /
                                  14.5) *
                              12),
                    ),
                  ),
                  Text(
                    " and ",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: AppColors.blackColor,
                        fontSize:
                            (MediaQuery.of(context).size.width * 0.04 / 14.5) *
                                12),
                  ),
                  GestureDetector(
                    onTap: () {
                      dispatchGoToPrivacyPolicy();
                    },
                    child: Text(
                      'Privacy Policy',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                          color: AppColors.primaryColor,
                          fontSize: (MediaQuery.of(context).size.width *
                                  0.04 /
                                  14.5) *
                              12),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: (MediaQuery.of(context).size.height * 0.02 / 14) * 50,
              ),
            ],
          ),
        ),
      ),
    );
  }

  dispatchRegister(String fName, String lName, String email, String password) {
    BlocProvider.of<LoginBloc>(context).dispatch(
      SignupEvent(
        firstName: fName,
        lastName: lName,
        email: email,
        password: password,
      ),
    );
  }

  dispatchGoToLogin() {
    BlocProvider.of<LoginBloc>(context).dispatch(GoToSigninEvent());
  }

  dispatchLoginFacebook() {
    BlocProvider.of<LoginBloc>(context).dispatch(SigningFacebookEvent(
      token: '',
      isConnected: false,
    ));
  }

  dispatchGoToTermsOfUse() {
    BlocProvider.of<LoginBloc>(context).dispatch(GoToTermsOfUseEvent());
  }

  dispatchGoToPrivacyPolicy() {
    BlocProvider.of<LoginBloc>(context).dispatch(GoToPrivacyPolicyEvent());
  }
}
