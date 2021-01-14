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

  String forgetmailInputValue,
      forgetmailTitleValue,
      resetpassValue,
      forgetinfoValue,
      email;
  bool checkerEmail = true;
  bool checkerPassword = true;
  String checkerEmailMessage = 'Email must be like username@serveur.extension';

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height * 0.02 / 14;

    return new Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height * .5,
                    color: Color.fromRGBO(236, 28, 64, 1),
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).size.height * .5 / 7),
                      child: Image.asset(
                        'Assets/Images/resetpassword.png',
                        alignment: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Container(
                      //margin: EdgeInsets.only(top:50),
                      padding: EdgeInsets.fromLTRB(16.0, 15, 0.0, 0.0),
                      child: Text("Forgot Password",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 28,
                            color: Color.fromRGBO(236, 28, 64, 1),
                            fontWeight: FontWeight.w600,
                          )),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Container(
                      //margin: EdgeInsets.only(top:50),
                      padding: EdgeInsets.fromLTRB(16.0, 17, 50, 0.0),
                      child: Text(
                        "Enter the email associated with your account and we'll send an email with instructions to reset your password.",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 14,
                          color: Color.fromRGBO(153, 153, 153, 1),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(16.0, 30, 50, 0.0),
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
                            color: Color.fromRGBO(236, 28, 64, 0.5),
                            fontWeight: FontWeight.w400,
                          )),
                    ),
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
                  SizedBox(
                    height: screenHeight * 50.5,
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(236, 28, 64, 50),
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      color: Colors.red,
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
                          dispatchForgotPassword(
                              forgetemailcontroller.text.trim());
                      },
                    ),
                  ),
                ],
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
}
