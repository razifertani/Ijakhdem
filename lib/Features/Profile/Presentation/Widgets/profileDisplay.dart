import 'package:Ijakhdem/Core/Utils/appColors.dart';
import 'package:Ijakhdem/Core/Utils/appBottomNavigationBar.dart';
import 'package:Ijakhdem/Features/Profile/Presentation/bloc/profile_bloc.dart';
import 'package:Ijakhdem/Features/Signin/Domain/Entities/profileEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileDisplay extends StatefulWidget {
  final Profile profile;

  const ProfileDisplay({Key key, @required this.profile}) : super(key: key);

  @override
  _ProfileDisplayState createState() => _ProfileDisplayState();
}

class _ProfileDisplayState extends State<ProfileDisplay> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Profile profile = widget.profile;
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: SafeArea(
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: Image.network(
                profile.generalInfo.profilePicUrl ??
                    'https://cdn3.iconfinder.com/data/icons/avatars-round-flat/33/avat-01-512.png',
              ).image,
            ),
            title: Text(
              profile.generalInfo.firstName +
                  ' ' +
                  profile.generalInfo.lastName,
            ),
            subtitle: Text("View and edit your profile"),
            trailing: IconButton(
              icon: Icon(Icons.arrow_forward_ios_sharp),
              onPressed: () {
                dispatchGoToProfileWidget(profile);
              },
            ),
          ),
        ),
      ),
      body: Container(
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      onTap: () {
                        dispatchGoToBalanceWidget(profile);
                      },
                      title: Container(
                        height: screenHeight * 0.13,
                        color: Colors.transparent,
                        child: Container(
                            decoration: BoxDecoration(
                                color: AppColors.primaryColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                new Text(
                                  "Available Balance ",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                                new Text(
                                  "\$0.00 ",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                                new Text(
                                  "You have n out of n bids remaining ",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            )),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            ListTile(
              title: Text(
                "Notifications",
                style: TextStyle(fontSize: 14),
              ),
              subtitle: Text(
                "Here is what's going on today",
                style: TextStyle(fontSize: 12),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_outlined,
                size: 14,
                color: AppColors.primaryColor,
              ),
              onTap: () {
                dispatchGoToNotificationsWidget(profile);
              },
            ),
            Divider(),
            ListTile(
              title: Text(
                "Post a Project",
                style: TextStyle(fontSize: 14),
              ),
              subtitle: Text(
                "It's free to post a project!",
                style: TextStyle(fontSize: 12),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_outlined,
                size: 14,
                color: AppColors.primaryColor,
              ),
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 8),
              child: Text(
                "Account settings",
                style: TextStyle(fontSize: 12, color: AppColors.primaryColor),
              ),
            ),
            ListTile(
              title: Text(
                "Memberships",
                style: TextStyle(fontSize: 14),
              ),
              subtitle: Text(
                "Upgrade your membership for a better value!",
                style: TextStyle(fontSize: 12),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_outlined,
                size: 14,
                color: AppColors.primaryColor,
              ),
            ),
            Divider(),
            ListTile(
              title: Text(
                "Payments/Deposit funds",
                style: TextStyle(fontSize: 14),
              ),
              subtitle: Text(
                "Details regarding your payments account",
                style: TextStyle(fontSize: 12),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_outlined,
                size: 14,
                color: AppColors.primaryColor,
              ),
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 8),
              child: Text(
                "Notifications",
                style: TextStyle(fontSize: 12, color: AppColors.primaryColor),
              ),
            ),
            ListTile(
              title: Text(
                "Notification settings",
                style: TextStyle(fontSize: 14),
              ),
              subtitle: Text(
                "Update your notification preference",
                style: TextStyle(fontSize: 12),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_outlined,
                size: 14,
                color: AppColors.primaryColor,
              ),
              onTap: () {
                dispatchGoToNotificationsSettingsWidget(profile);
              },
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 8),
              child: Text(
                "About",
                style: TextStyle(fontSize: 12, color: AppColors.primaryColor),
              ),
            ),
            ListTile(
              title: Text(
                "App Version",
                style: TextStyle(fontSize: 14),
              ),
              subtitle: Text(
                "1.0.0",
                style: TextStyle(fontSize: 12),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_outlined,
                size: 14,
                color: AppColors.primaryColor,
              ),
            ),
            Divider(),
            ListTile(
              title: Text(
                "Walkthrough",
                style: TextStyle(fontSize: 14),
              ),
              subtitle: Text(
                "Learn more about the app",
                style: TextStyle(fontSize: 12),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_outlined,
                size: 14,
                color: AppColors.primaryColor,
              ),
              onTap: () {
                dispatchGoToOnBorading(profile);
              },
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 8),
              child: Text(
                "Other",
                style: TextStyle(fontSize: 12, color: AppColors.primaryColor),
              ),
            ),
            ListTile(
              title: Text(
                "Privacy Policy",
                style: TextStyle(fontSize: 14),
              ),
              subtitle: Text(
                "Opens our privacy policy",
                style: TextStyle(fontSize: 12),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_outlined,
                size: 14,
                color: AppColors.primaryColor,
              ),
              onTap: () {
                dispatchGoToPrivacyPoliceyDisplay(profile);
              },
            ),
            Divider(),
            ListTile(
              title: Text(
                "Terms and conditions",
                style: TextStyle(fontSize: 14),
              ),
              subtitle: Text(
                "Opens our terms and conditions page",
                style: TextStyle(fontSize: 12),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_outlined,
                size: 14,
                color: AppColors.primaryColor,
              ),
              onTap: () {
                dispatchGoToTermsConditionsDisplay(profile);
              },
            ),
            Divider(),
            ListTile(
              title: Text(
                "Contact Support",
                style: TextStyle(fontSize: 14),
              ),
              subtitle: Text(
                "Our awesome Customer Support Team is ready to assist you",
                style: TextStyle(fontSize: 12),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_outlined,
                size: 14,
                color: AppColors.primaryColor,
              ),
              onTap: () {
                // Get.to(HomePage());
              },
            ),
            Divider(),
            ListTile(
              title: Text(
                "Articles and How-to's",
                style: TextStyle(fontSize: 14),
              ),
              subtitle: Text(
                "Learn everything you need to know",
                style: TextStyle(fontSize: 12),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_outlined,
                size: 14,
                color: AppColors.primaryColor,
              ),
              onTap: () {
                // Get.to(HomePage());
              },
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15.0),
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    dispatchLogout(profile);
                  },
                  child: Text(
                    "Log out",
                    style: TextStyle(color: AppColors.redColor),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: AppBottomNavigationBar(
        profile: profile,
      ),
    );
  }

  dispatchGoToProfileWidget(Profile profile) {
    BlocProvider.of<ProfileBloc>(context).dispatch(
      GoToProfileWidgetEvent(
        profile: profile,
      ),
    );
  }

  dispatchGoToBalanceWidget(Profile profile) {
    BlocProvider.of<ProfileBloc>(context).dispatch(
      GoToBalanceWidgetEvent(
        profile: profile,
      ),
    );
  }

  dispatchGoToNotificationsWidget(Profile profile) {
    BlocProvider.of<ProfileBloc>(context).dispatch(
      GoToNotificationsWidgetEvent(
        profile: profile,
      ),
    );
  }

  dispatchGoToNotificationsSettingsWidget(Profile profile) {
    BlocProvider.of<ProfileBloc>(context).dispatch(
      GoToNotificationsSettingsWidgetEvent(
        profile: profile,
      ),
    );
  }

  dispatchGoToOnBorading(Profile profile) {
    BlocProvider.of<ProfileBloc>(context).dispatch(
      GoToOnBoardingEvent(
        profile: profile,
      ),
    );
  }

  dispatchGoToTermsConditionsDisplay(profile) {
    BlocProvider.of<ProfileBloc>(context).dispatch(
      GoToTermsConditionsEvent(
        profile: profile,
      ),
    );
  }

  dispatchGoToPrivacyPoliceyDisplay(profile) {
    BlocProvider.of<ProfileBloc>(context).dispatch(
      GoToPrivacyPoliceyEvent(
        profile: profile,
      ),
    );
  }

  dispatchLogout(Profile profile) {
    BlocProvider.of<ProfileBloc>(context).dispatch(
      LogoutEvent(
        profile: profile,
      ),
    );
  }
}
