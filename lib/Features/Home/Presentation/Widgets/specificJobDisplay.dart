import 'package:Ijakhdem/Features/Home/Presentation/bloc/home_bloc.dart';
import 'package:Ijakhdem/Features/Signin/Domain/Entities/profileEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpecificJobDisplay extends StatefulWidget {
  final Profile profile;

  SpecificJobDisplay({Key key, @required this.profile}) : super(key: key);

  @override
  _SpecificJobDisplayState createState() => _SpecificJobDisplayState();
}

class _SpecificJobDisplayState extends State<SpecificJobDisplay> {
  @override
  Widget build(BuildContext context) {
    Profile profile = widget.profile;

    return Scaffold(
      appBar: AppBar(
        title: Text('Recommended Jobs'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => dispatchGoToHome(profile),
        ),
        centerTitle: true,
        elevation: 10,
      ),
      body: Text(
        profile.generalInfo.firstName,
      ),
    );
  }

  dispatchGoToHome(Profile profile) {
    BlocProvider.of<HomeBloc>(context).dispatch(
      GoToHomeEvent(
        profile: profile,
      ),
    );
  }
}
