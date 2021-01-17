import 'package:Ijakhdem/Core/Utils/appColors.dart';
import 'package:Ijakhdem/Core/Utils/inputChecker.dart';
import 'package:Ijakhdem/Features/Signin/Presentation/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordDisplay extends StatefulWidget {
  @override
  _ForgotPasswordDisplayState createState() => _ForgotPasswordDisplayState();
}

class _ForgotPasswordDisplayState extends State<ForgotPasswordDisplay> {
  TextEditingController forgetemailcontroller = new TextEditingController();

  String forgetinfoValue;
  String email;
  bool checkerEmail = true;
  String checkerEmailMessage = 'Email must be like username@serveur.extension';

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: [
                Container(
                  height: screenHeight * 0.5,
                  color: AppColors.primaryColor,
                  width: screenWidth,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: screenHeight * 0.1),
                    child: Image.asset(
                      'Assets/Images/logo.png',
                      alignment: Alignment.bottomCenter,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.03,
                    vertical: screenHeight * 0.08,
                  ),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back),
                    color: AppColors.whiteTextColor,
                    // iconSize: ,
                    onPressed: () {
                      dispatchGoToSignin();
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              width: double.infinity,
              child: Container(
                padding: EdgeInsets.fromLTRB(
                  screenWidth * 0.05,
                  screenHeight * 0.03,
                  screenWidth * 0.05,
                  screenHeight * 0.00,
                ),
                child: Text(
                  "Forgot Password",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 28,
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Container(
                padding: EdgeInsets.fromLTRB(
                  screenWidth * 0.05,
                  screenHeight * 0.03,
                  screenWidth * 0.05,
                  screenHeight * 0.00,
                ),
                child: Text(
                  "Enter the email associated with your account and we'll send an email with instructions to reset your password.",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(
                screenWidth * 0.05,
                screenHeight * 0.03,
                screenWidth * 0.05,
                screenHeight * 0.00,
              ),
              child: TextField(
                keyboardType: TextInputType.visiblePassword,
                controller: forgetemailcontroller,
                onChanged: (value) {
                  email = value;
                  setState(() {
                    checkerEmail = regExpEmail.hasMatch(email);
                  });
                },
                decoration: InputDecoration(
                    hintText: 'Email',
                    contentPadding: const EdgeInsets.only(left: 11),
                    hintStyle: TextStyle(
                      fontSize: 18.0,
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.w400,
                    )),
              ),
            ),
            checkerEmail
                ? Container()
                : Padding(
                    padding: EdgeInsets.fromLTRB(
                      screenWidth * 0.05,
                      screenHeight * 0.03,
                      screenWidth * 0.05,
                      screenHeight * 0.00,
                    ),
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
            SizedBox(
              height: screenHeight * 0.05,
            ),
            Container(
              width: screenWidth * 0.88,
              height: screenHeight * 0.06,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                color: AppColors.primaryColor,
                child: Text(
                  'Reset Password',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onPressed: () {
                  if (checkerEmail && email != null)
                    dispatchForgotPassword(forgetemailcontroller.text.trim());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void dispatchForgotPassword(String email) {
    BlocProvider.of<LoginBloc>(context)
        .dispatch(ForgotPasswordEvent(email: email));
  }

  void dispatchGoToSignin() {
    BlocProvider.of<LoginBloc>(context).dispatch(GoToSigninEvent());
  }
}
