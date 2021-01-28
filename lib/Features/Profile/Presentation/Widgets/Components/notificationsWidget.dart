import 'package:Ijakhdem/Core/Utils/appColors.dart';
import 'package:Ijakhdem/Features/Profile/Presentation/bloc/profile_bloc.dart';
import 'package:Ijakhdem/Features/Signin/Domain/Entities/profileEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationsWidget extends StatefulWidget {
  final Profile profile;

  const NotificationsWidget({Key key, @required this.profile})
      : super(key: key);

  @override
  _NotificationsWidgetState createState() => _NotificationsWidgetState();
}

class _NotificationsWidgetState extends State<NotificationsWidget> {
  @override
  Widget build(BuildContext context) {
    Profile profile = widget.profile;

    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   title: ,
      //   leading: IconButton(
      //     icon: Icon(
      //       Icons.arrow_back,
      //       color: AppColors.primaryColor,
      //     ),
      //     color: AppColors.blueColor,
      //     onPressed: () {
      //       dispatchGoToProfileDisplay(profile);
      //     },
      //   ),
      //   flexibleSpace: SafeArea(
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         Text(
      //           "Notification settings",
      //           style: TextStyle(fontSize: 20),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
      appBar: AppBar(
        title: Text(
          'Notifications',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
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
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, i) {
            return ListTile(
              leading: ClipOval(
                child: Image.asset('Assets/Images/1.jpg'),
              ),
              title: Text(
                  "Jack Sparrow and 12 others bid an average \$80.0 on i need website"),
              subtitle:
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Icon(
                  Icons.check_circle_outline,
                  size: 10,
                  color: Colors.green,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Text("8d 5h 32m ago"),
                )
              ]),
            );
          }),
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
