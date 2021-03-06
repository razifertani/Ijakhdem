import 'package:Ijakhdem/Core/Utils/appColors.dart';
import 'package:Ijakhdem/Features/Profile/Presentation/bloc/profile_bloc.dart';
import 'package:Ijakhdem/Features/Signin/Domain/Entities/profileEntity.dart';
import 'package:Ijakhdem/Features/Signin/Presentation/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TermsOfUseDisplay extends StatefulWidget {
  final Profile profile;

  const TermsOfUseDisplay({Key key, this.profile}) : super(key: key);

  @override
  _TermsOfUseDisplayState createState() => _TermsOfUseDisplayState();
}

class _TermsOfUseDisplayState extends State<TermsOfUseDisplay> {
  @override
  Widget build(BuildContext context) {
    Profile profile = widget.profile;

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
                      dispatchGoToProfileDisplay(profile);
                    },
                  ),
                  Text(
                    'Terms & Conditions',
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

  dispatchGoToProfileDisplay(profile) {
    BlocProvider.of<ProfileBloc>(context).dispatch(
      GoToProfileDisplayEvent(
        profile: profile,
      ),
    );
  }
}

class PrivacyPolicyDisplay extends StatefulWidget {
  final Profile profile;

  const PrivacyPolicyDisplay({Key key, this.profile}) : super(key: key);

  @override
  _PrivacyPolicyDisplayState createState() => _PrivacyPolicyDisplayState();
}

class _PrivacyPolicyDisplayState extends State<PrivacyPolicyDisplay> {
  @override
  Widget build(BuildContext context) {
    Profile profile = widget.profile;

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
                      dispatchGoToProfileDisplay(profile);
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

  dispatchGoToProfileDisplay(profile) {
    BlocProvider.of<ProfileBloc>(context).dispatch(
      GoToProfileDisplayEvent(
        profile: profile,
      ),
    );
  }
}
