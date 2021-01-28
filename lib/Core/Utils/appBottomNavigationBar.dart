import 'package:Ijakhdem/Core/Utils/appColors.dart';
import 'package:Ijakhdem/Features/Signin/Domain/Entities/profileEntity.dart';
import 'package:flutter/material.dart';
import 'package:titled_navigation_bar/titled_navigation_bar.dart';
import 'package:Ijakhdem/Features/Home/Presentation/Pages/homeProvider.dart';

class AppBottomNavigationBar extends StatefulWidget {
  final Profile profile;

  const AppBottomNavigationBar({Key key, @required this.profile})
      : super(key: key);

  @override
  _AppBottomNavigationBarState createState() => _AppBottomNavigationBarState();
}

class _AppBottomNavigationBarState extends State<AppBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    Profile profile = widget.profile;

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return TitledBottomNavigationBar(
      reverse: true,
      currentIndex: profile.parameters.current,
      onTap: (index) {
        profile.parameters.current = index;
        if (index == 0) {
          dispatchGoToHome(profile);
        } else if (index == 1) {
          dispatchGoToMyJobs(profile);
        } else if (index == 2) {
          dispatchGoToPostJob(profile);
        } else if (index == 3) {
          dispatchGoToMessages(profile);
        } else if (index == 4) {
          dispatchGoToProfile(profile);
        }
      },
      items: [
        TitledNavigationBarItem(
          title: Text('Home'),
          icon: Icons.home_outlined,
        ),
        TitledNavigationBarItem(
          title: Text('Search'),
          icon: Icons.search_outlined,
        ),
        TitledNavigationBarItem(
          title: Text('PostJob'),
          icon: Icons.add_box_outlined,
        ),
        TitledNavigationBarItem(
          title: Text('Messages'),
          icon: Icons.message_outlined,
        ),
        TitledNavigationBarItem(
          title: Text('Profile'),
          icon: Icons.person_outline,
        ),
      ],
    );
  }

  dispatchGoToHome(Profile profile) {
    Navigator.of(context).pushReplacementNamed(
      '/homeProvider',
      arguments: profile,
    );
  }

  dispatchGoToMyJobs(Profile profile) {
    Navigator.of(context).pushReplacementNamed(
      '/myJobsProvider',
      arguments: profile,
    );
  }

  dispatchGoToPostJob(Profile profile) {
    Navigator.of(context).pushReplacementNamed(
      '/postJobProvider',
      arguments: profile,
    );
  }

  dispatchGoToMessages(Profile profile) {
    Navigator.of(context).pushReplacementNamed(
      '/messagesProvider',
      arguments: profile,
    );
  }

  dispatchGoToProfile(Profile profile) {
    Navigator.of(context).pushReplacementNamed(
      '/profileProvider',
      arguments: profile,
    );
  }
}

//   return Drawer(
//     child: Container(
//       color: Colors.white,
//       child: Column(
//         children: <Widget>[
//           SizedBox(
//             height: screenHeight * 0.03,
//           ),
//           DrawerHeader(
//             child: Image.network(
//               "https://image.freepik.com/vecteurs-libre/profil-avatar-homme-icone-ronde_24640-14044.jpg",
//             ),
//             decoration: BoxDecoration(
//               color: Colors.transparent,
//             ),
//           ),
//           Text(
//             profile.firstName,
//             style: TextStyle(
//               fontSize: 24,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           SizedBox(
//             height: screenHeight * 0.1,
//           ),
//           GestureDetector(
//             onTap: () {
//               dispatchGoToHome(context, profile);
//             },
//             child: Text(
//               'Browse Jobs & Freelances',
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.w700,
//               ),
//               textAlign: TextAlign.center,
//             ),
//           ),
//           SizedBox(
//             height: screenHeight * 0.05,
//           ),
//           GestureDetector(
//             onTap: () {
//               dispatchGoToMyJobs(context, profile);
//             },
//             child: Text(
//               'My Jobs',
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.w700,
//               ),
//               textAlign: TextAlign.center,
//             ),
//           ),
//           SizedBox(
//             height: screenHeight * 0.05,
//           ),
//           GestureDetector(
//             onTap: () {
//               dispatchGoToPostJob(context, profile);
//             },
//             child: Text(
//               'Post Job',
//               style: TextStyle(
//                 fontFamily: 'Avenir',
//                 fontSize: 20,
//                 fontWeight: FontWeight.w700,
//               ),
//               textAlign: TextAlign.center,
//             ),
//           ),
//           SizedBox(
//             height: screenHeight * 0.05,
//           ),
//           GestureDetector(
//             onTap: () {
//               dispatchGoToMessages(context, profile);
//             },
//             child: Text(
//               'Messages',
//               style: TextStyle(
//                 fontFamily: 'Avenir',
//                 fontSize: 20,
//                 fontWeight: FontWeight.w700,
//               ),
//               textAlign: TextAlign.center,
//             ),
//           ),
//           SizedBox(
//             height: screenHeight * 0.05,
//           ),
//           GestureDetector(
//             onTap: () {
//               dispatchGoToProfile(context, profile);
//             },
//             child: Text(
//               'Profile',
//               style: TextStyle(
//                 fontFamily: 'Avenir',
//                 fontSize: 20,
//                 fontWeight: FontWeight.w700,
//               ),
//               textAlign: TextAlign.center,
//             ),
//           ),
//           Expanded(
//             child: Align(
//               alignment: Alignment.bottomCenter,
//               child: Container(
//                 height: screenHeight * 0.05,
//                 width: MediaQuery.of(context).size.width,
//                 color: AppColors.primaryColor,
//                 child: Center(
//                   child: Text(
//                     'V 0.0.1',
//                     style: TextStyle(
//                       fontSize: 20,
//                       color: Colors.white,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//               ),
//             ),
//           )
//         ],
//       ),
//     ),
//   );
