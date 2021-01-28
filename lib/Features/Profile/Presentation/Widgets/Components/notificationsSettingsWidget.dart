import 'package:Ijakhdem/Core/Utils/appColors.dart';
import 'package:Ijakhdem/Features/Profile/Presentation/bloc/profile_bloc.dart';
import 'package:Ijakhdem/Features/Signin/Domain/Entities/profileEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationsSettingsWidget extends StatefulWidget {
  final Profile profile;

  const NotificationsSettingsWidget({Key key, @required this.profile})
      : super(key: key);

  @override
  _NotificationsSettingsWidgetState createState() =>
      _NotificationsSettingsWidgetState();
}

class _NotificationsSettingsWidgetState
    extends State<NotificationsSettingsWidget> {
  @override
  Widget build(BuildContext context) {
    Profile profile = widget.profile;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.primaryColor,
          ),
          color: AppColors.blueColor,
          onPressed: () {
            dispatchGoToProfileDisplay(profile);
          },
        ),
        flexibleSpace: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Notification settings",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text(
              "Show Notifications",
              style: TextStyle(fontSize: 14),
            ),
            trailing: Switch(
              value: true,
              onChanged: (val) {
                print(val);
              },
            ),
            onTap: () {
              // Get.to(Notifications());
            },
          ),
          Divider(
            height: 0,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 10),
            child: Text(
              "Jobs",
              style: TextStyle(fontSize: 12, color: AppColors.primaryColor),
            ),
          ),
          ListTile(
            title: Text(
              "Show Notifications",
              style: TextStyle(fontSize: 14),
            ),
            trailing: Switch(
              value: true,
              onChanged: (val) {
                print(val);
              },
            ),
            onTap: () {
              // Get.to(Notifications());
            },
          ),
          CheckboxListTile(
            dense: true,
            tristate: false,
            value: true,
            onChanged: (val) {
              print("do something");
            },
            title: Text(
              "Open jobs",
              style: TextStyle(fontSize: 14),
            ),
            subtitle: Text(
              "Show silently",
              style: TextStyle(fontSize: 12),
            ),
          ),
          CheckboxListTile(
            dense: true,
            tristate: false,
            value: true,
            onChanged: (val) {
              print("do something");
            },
            title: Text(
              "In progress jobs",
              style: TextStyle(fontSize: 14),
            ),
            subtitle: Text(
              "Make sound and pop up on screen",
              style: TextStyle(fontSize: 12),
            ),
          ),
          Divider(
            height: 5,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 10),
            child: Text(
              "Messaging",
              style: TextStyle(fontSize: 12, color: AppColors.primaryColor),
            ),
          ),
          ListTile(
            title: Text(
              "Show Notifications",
              style: TextStyle(fontSize: 14),
            ),
            trailing: Switch(
              value: true,
              onChanged: (val) {
                print(val);
              },
            ),
            onTap: () {
              // Get.to(Notifications());
            },
          ),
          CheckboxListTile(
            dense: true,
            tristate: false,
            value: true,
            onChanged: (val) {
              print("do something");
            },
            title: Text(
              "Incoming group messages",
              style: TextStyle(fontSize: 14),
            ),
            subtitle: Text(
              "Make sound and pop up on screen",
              style: TextStyle(fontSize: 12),
            ),
          ),
          CheckboxListTile(
            dense: true,
            tristate: false,
            value: true,
            onChanged: (val) {
              print("do something");
            },
            title: Text(
              "Incoming messages",
              style: TextStyle(fontSize: 14),
            ),
            subtitle: Text(
              "Make sound and pop up on screen",
              style: TextStyle(fontSize: 12),
            ),
          ),
          CheckboxListTile(
            dense: true,
            tristate: false,
            value: true,
            onChanged: (val) {
              print("do something");
            },
            title: Text(
              "Message requests",
              style: TextStyle(fontSize: 14),
            ),
            subtitle: Text(
              "Make sound ",
              style: TextStyle(fontSize: 12),
            ),
          ),
          Divider(
            height: 5,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 10),
            child: Text(
              "Payments",
              style: TextStyle(fontSize: 12, color: AppColors.primaryColor),
            ),
          ),
          ListTile(
            title: Text(
              "Show Notifications",
              style: TextStyle(fontSize: 14),
            ),
            trailing: Switch(
              value: true,
              onChanged: (val) {
                print(val);
              },
            ),
            onTap: () {
              // Get.to(Notifications());
            },
          ),
          CheckboxListTile(
            dense: true,
            tristate: false,
            value: true,
            onChanged: (val) {
              print("do something");
            },
            title: Text(
              "Payments",
              style: TextStyle(fontSize: 14),
            ),
            subtitle: Text(
              "Make sound and pop up on screen",
              style: TextStyle(fontSize: 12),
            ),
          ),
          Divider(
            height: 5,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 10),
            child: Text(
              "Miscellaneous",
              style: TextStyle(fontSize: 12, color: AppColors.primaryColor),
            ),
          ),
          ListTile(
            title: Text(
              "Show Notifications",
              style: TextStyle(fontSize: 14),
            ),
            trailing: Switch(
              value: true,
              onChanged: (val) {
                print(val);
              },
            ),
            onTap: () {
              // Get.to(Notifications());
            },
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
