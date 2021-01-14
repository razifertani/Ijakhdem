import 'package:Ijakhdem/Core/Utils/appColors.dart';
import 'package:Ijakhdem/Features/Signin/Presentation/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TermsOfUseDisplay extends StatefulWidget {
  const TermsOfUseDisplay({Key key}) : super(key: key);

  @override
  _TermsOfUseDisplayState createState() => _TermsOfUseDisplayState();
}

class _TermsOfUseDisplayState extends State<TermsOfUseDisplay> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Flexible(
            child: Container(
              padding: EdgeInsets.fromLTRB(
                screenWidth * 0.02,
                screenHeight * 0.1,
                screenWidth * 0.0,
                screenHeight * 0.00,
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    color: AppColors.blackColor,
                    onPressed: () {
                      dispatchGoToSignup();
                    },
                  ),
                  Text(
                    'Terms Of Use',
                    style: TextStyle(
                      fontSize: 28,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            child: Container(
              padding: EdgeInsets.fromLTRB(
                screenWidth * 0.06,
                screenHeight * 0.06,
                screenWidth * 0.06,
                screenHeight * 0.00,
              ),
              child: Text(
                'Oporteat pericula vim at, sea ea epicuri tincidunt. Malis iracundia pri eu, prima movet definitionem sea ne. Id quo vero accommodare, sed cu velit summo. Et usu semper invenire reprehendunt, lucilius deserunt definiebas ex sit, dolor equidem consulatu pro et. Nulla quando voluptua est ea, enim debitis sententiae usu ei, usu graecis epicuri te. Usu eu rebum tamquam, decore impetus adipisci sed ut.\n Oporteat pericula vim at, sea ea epicuri tincidunt. Malis iracundia pri eu, prima movet definitionem sea ne. Id quo vero accommodare, sed cu velit summo. Et usu semper invenire reprehendunt, lucilius deserunt definiebas ex sit, dolor equidem consulatu pro et. Nulla quando voluptua est ea, enim debitis sententiae usu ei, usu graecis epicuri te. Usu eu rebum tamquam, decore impetus adipisci sed ut.\n Oporteat pericula vim at, sea ea epicuri tincidunt. Malis iracundia pri eu, prima movet definitionem sea ne. Id quo vero accommodare, sed cu velit summo. Et usu semper invenire reprehendunt, lucilius deserunt definiebas ex sit, dolor equidem consulatu pro et. Nulla quando voluptua est ea, enim debitis sententiae usu ei, usu graecis epicuri te. Usu eu rebum tamquam, decore impetus adipisci sed ut.\n Oporteat pericula vim at, sea ea epicuri tincidunt. Malis iracundia pri eu, prima movet definitionem sea ne. Id quo vero accommodare, sed cu velit summo. Et usu semper invenire reprehendunt, lucilius deserunt definiebas ex sit, dolor equidem consulatu pro et. Nulla quando voluptua est ea, enim debitis sententiae usu ei, usu graecis epicuri te. Usu eu rebum tamquam, decore impetus adipisci sed ut.\n Oporteat pericula vim at, sea ea epicuri tincidunt. Malis iracundia pri eu, prima movet definitionem sea ne. Id quo vero accommodare, sed cu velit summo. Et usu semper invenire reprehendunt, lucilius deserunt definiebas ex sit, dolor equidem consulatu pro et. Nulla quando voluptua est ea, enim debitis sententiae usu ei, usu graecis epicuri te. Usu eu rebum tamquam, decore impetus adipisci sed ut.\n Oporteat pericula vim at, sea ea epicuri tincidunt. Malis iracundia pri eu, prima movet definitionem sea ne. Id quo vero accommodare, sed cu velit summo. Et usu semper invenire reprehendunt, lucilius deserunt definiebas ex sit, dolor equidem consulatu pro et. Nulla quando voluptua est ea, enim debitis sententiae usu ei, usu graecis epicuri te. Usu eu rebum tamquam, decore impetus adipisci sed ut.\n Oporteat pericula vim at, sea ea epicuri tincidunt. Malis iracundia pri eu, prima movet definitionem sea ne. Id quo vero accommodare, sed cu velit summo. Et usu semper invenire reprehendunt, lucilius deserunt definiebas ex sit, dolor equidem consulatu pro et. Nulla quando voluptua est ea, enim debitis sententiae usu ei, usu graecis epicuri te. Usu eu rebum tamquam, decore impetus adipisci sed ut.\n Oporteat pericula vim at, sea ea epicuri tincidunt. Malis iracundia pri eu, prima movet definitionem sea ne. Id quo vero accommodare, sed cu velit summo. Et usu semper invenire reprehendunt, lucilius deserunt definiebas ex sit, dolor equidem consulatu pro et. Nulla quando voluptua est ea, enim debitis sententiae usu ei, usu graecis epicuri te. Usu eu rebum tamquam, decore impetus adipisci sed ut.\n',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void dispatchGoToSignup() {
    BlocProvider.of<LoginBloc>(context).dispatch(GoToSignupEvent());
  }
}

class PrivacyPolicyDisplay extends StatefulWidget {
  const PrivacyPolicyDisplay({Key key}) : super(key: key);

  @override
  _PrivacyPolicyDisplayState createState() => _PrivacyPolicyDisplayState();
}

class _PrivacyPolicyDisplayState extends State<PrivacyPolicyDisplay> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Flexible(
            child: Container(
              padding: EdgeInsets.fromLTRB(
                screenWidth * 0.02,
                screenHeight * 0.1,
                screenWidth * 0.0,
                screenHeight * 0.00,
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    color: AppColors.blackColor,
                    onPressed: () {
                      dispatchGoToSignup();
                    },
                  ),
                  Text(
                    'Privacy Policey',
                    style: TextStyle(
                      fontSize: 28,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            child: Container(
              padding: EdgeInsets.fromLTRB(
                screenWidth * 0.06,
                screenHeight * 0.06,
                screenWidth * 0.06,
                screenHeight * 0.00,
              ),
              child: Text(
                'Oporteat pericula vim at, sea ea epicuri tincidunt. Malis iracundia pri eu, prima movet definitionem sea ne. Id quo vero accommodare, sed cu velit summo. Et usu semper invenire reprehendunt, lucilius deserunt definiebas ex sit, dolor equidem consulatu pro et. Nulla quando voluptua est ea, enim debitis sententiae usu ei, usu graecis epicuri te. Usu eu rebum tamquam, decore impetus adipisci sed ut.\n Oporteat pericula vim at, sea ea epicuri tincidunt. Malis iracundia pri eu, prima movet definitionem sea ne. Id quo vero accommodare, sed cu velit summo. Et usu semper invenire reprehendunt, lucilius deserunt definiebas ex sit, dolor equidem consulatu pro et. Nulla quando voluptua est ea, enim debitis sententiae usu ei, usu graecis epicuri te. Usu eu rebum tamquam, decore impetus adipisci sed ut.\n Oporteat pericula vim at, sea ea epicuri tincidunt. Malis iracundia pri eu, prima movet definitionem sea ne. Id quo vero accommodare, sed cu velit summo. Et usu semper invenire reprehendunt, lucilius deserunt definiebas ex sit, dolor equidem consulatu pro et. Nulla quando voluptua est ea, enim debitis sententiae usu ei, usu graecis epicuri te. Usu eu rebum tamquam, decore impetus adipisci sed ut.\n Oporteat pericula vim at, sea ea epicuri tincidunt. Malis iracundia pri eu, prima movet definitionem sea ne. Id quo vero accommodare, sed cu velit summo. Et usu semper invenire reprehendunt, lucilius deserunt definiebas ex sit, dolor equidem consulatu pro et. Nulla quando voluptua est ea, enim debitis sententiae usu ei, usu graecis epicuri te. Usu eu rebum tamquam, decore impetus adipisci sed ut.\n Oporteat pericula vim at, sea ea epicuri tincidunt. Malis iracundia pri eu, prima movet definitionem sea ne. Id quo vero accommodare, sed cu velit summo. Et usu semper invenire reprehendunt, lucilius deserunt definiebas ex sit, dolor equidem consulatu pro et. Nulla quando voluptua est ea, enim debitis sententiae usu ei, usu graecis epicuri te. Usu eu rebum tamquam, decore impetus adipisci sed ut.\n Oporteat pericula vim at, sea ea epicuri tincidunt. Malis iracundia pri eu, prima movet definitionem sea ne. Id quo vero accommodare, sed cu velit summo. Et usu semper invenire reprehendunt, lucilius deserunt definiebas ex sit, dolor equidem consulatu pro et. Nulla quando voluptua est ea, enim debitis sententiae usu ei, usu graecis epicuri te. Usu eu rebum tamquam, decore impetus adipisci sed ut.\n Oporteat pericula vim at, sea ea epicuri tincidunt. Malis iracundia pri eu, prima movet definitionem sea ne. Id quo vero accommodare, sed cu velit summo. Et usu semper invenire reprehendunt, lucilius deserunt definiebas ex sit, dolor equidem consulatu pro et. Nulla quando voluptua est ea, enim debitis sententiae usu ei, usu graecis epicuri te. Usu eu rebum tamquam, decore impetus adipisci sed ut.\n Oporteat pericula vim at, sea ea epicuri tincidunt. Malis iracundia pri eu, prima movet definitionem sea ne. Id quo vero accommodare, sed cu velit summo. Et usu semper invenire reprehendunt, lucilius deserunt definiebas ex sit, dolor equidem consulatu pro et. Nulla quando voluptua est ea, enim debitis sententiae usu ei, usu graecis epicuri te. Usu eu rebum tamquam, decore impetus adipisci sed ut.\n',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void dispatchGoToSignup() {
    BlocProvider.of<LoginBloc>(context).dispatch(GoToSignupEvent());
  }
}
