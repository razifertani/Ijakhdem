import 'package:Ijakhdem/Core/Utils/appColors.dart';
import 'package:Ijakhdem/Core/Utils/appDrawer.dart';
import 'package:Ijakhdem/Features/Signin/Domain/Entities/profileEntity.dart';
import 'package:flutter/material.dart';

class MessagesDisplay extends StatefulWidget {
  final Profile profile;

  const MessagesDisplay({Key key, @required this.profile}) : super(key: key);

  @override
  _MessagesDisplayState createState() => _MessagesDisplayState();
}

class _MessagesDisplayState extends State<MessagesDisplay> {
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
      drawer: AppDrawer(
        profile: profile,
      ),
      body: Center(
        child: Text('Messages'),
      ),
    );
  }
}
