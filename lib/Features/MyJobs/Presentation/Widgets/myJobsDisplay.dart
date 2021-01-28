import 'package:Ijakhdem/Core/Utils/appColors.dart';
import 'package:Ijakhdem/Core/Utils/appBottomNavigationBar.dart';
import 'package:Ijakhdem/Features/Signin/Domain/Entities/profileEntity.dart';
import 'package:flutter/material.dart';

class MyJobsDisplay extends StatefulWidget {
  final Profile profile;

  const MyJobsDisplay({Key key, @required this.profile}) : super(key: key);

  @override
  _MyJobsDisplayState createState() => _MyJobsDisplayState();
}

class _MyJobsDisplayState extends State<MyJobsDisplay> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Profile profile = widget.profile;
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      // onPressed: () => Scaffold.of(context).openDrawer(),
      appBar: AppBar(
        title: Text('Browse'),
        centerTitle: true,
        elevation: 10,
      ),
      body: Center(
        child: Text('My Jobs'),
      ),
      bottomNavigationBar: AppBottomNavigationBar(
        profile: profile,
      ),
    );
  }
}
