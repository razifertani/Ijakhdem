import 'package:Ijakhdem/Core/Utils/appColors.dart';
import 'package:Ijakhdem/Core/Utils/appBottomNavigationBar.dart';
import 'package:Ijakhdem/Features/Signin/Domain/Entities/profileEntity.dart';
import 'package:flutter/material.dart';

class PostJobDisplay extends StatefulWidget {
  final Profile profile;

  const PostJobDisplay({Key key, @required this.profile}) : super(key: key);

  @override
  _PostJobDisplayState createState() => _PostJobDisplayState();
}

class _PostJobDisplayState extends State<PostJobDisplay> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Profile profile = widget.profile;
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Post Job',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Text('Post Job'),
      ),
      bottomNavigationBar: AppBottomNavigationBar(
        profile: profile,
      ),
    );
  }
}
