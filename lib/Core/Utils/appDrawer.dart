import 'package:Ijakhdem/Core/Utils/appColors.dart';
import 'package:Ijakhdem/Features/Signin/Domain/Entities/profileEntity.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  final Profile profile;

  const AppDrawer({Key key, @required this.profile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Drawer(
      child: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: screenHeight * 0.03,
            ),
            DrawerHeader(
              child: Image.network(
                "https://image.freepik.com/vecteurs-libre/profil-avatar-homme-icone-ronde_24640-14044.jpg",
              ),
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
            ),
            SizedBox(
              height: screenHeight * 0.1,
            ),
            GestureDetector(
              onTap: () {
                dispatchGoToHome(context, profile);
              },
              child: Text(
                'Browse Jobs & Freelances',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: screenHeight * 0.05,
            ),
            GestureDetector(
              onTap: () {
                dispatchGoToMyJobs(context, profile);
              },
              child: Text(
                'My Jobs',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: screenHeight * 0.05,
            ),
            GestureDetector(
              onTap: () {
                dispatchGoToPostJob(context, profile);
              },
              child: Text(
                'Post Job',
                style: TextStyle(
                  fontFamily: 'Avenir',
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: screenHeight * 0.05,
            ),
            GestureDetector(
              onTap: () {
                dispatchGoToMessages(context, profile);
              },
              child: Text(
                'Messages',
                style: TextStyle(
                  fontFamily: 'Avenir',
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: screenHeight * 0.05,
            ),
            GestureDetector(
              onTap: () {
                dispatchGoToProfile(context, profile);
              },
              child: Text(
                'Profile',
                style: TextStyle(
                  fontFamily: 'Avenir',
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: screenHeight * 0.05,
                  width: MediaQuery.of(context).size.width,
                  color: AppColors.primaryColor,
                  child: Center(
                    child: Text(
                      'V 0.0.1',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  dispatchGoToHome(BuildContext context, Profile profile) {
    Navigator.of(context).pushReplacementNamed(
      '/homeProvider',
      arguments: profile,
    );
  }

  dispatchGoToMyJobs(BuildContext context, Profile profile) {
    Navigator.of(context).pushReplacementNamed(
      '/myJobsProvider',
      arguments: profile,
    );
  }

  dispatchGoToPostJob(BuildContext context, Profile profile) {
    Navigator.of(context).pushReplacementNamed(
      '/postJobProvider',
      arguments: profile,
    );
  }

  dispatchGoToMessages(BuildContext context, Profile profile) {
    Navigator.of(context).pushReplacementNamed(
      '/messagesProvider',
      arguments: profile,
    );
  }

  dispatchGoToProfile(BuildContext context, Profile profile) {
    Navigator.of(context).pushReplacementNamed(
      '/profileProvider',
      arguments: profile,
    );
  }
}
