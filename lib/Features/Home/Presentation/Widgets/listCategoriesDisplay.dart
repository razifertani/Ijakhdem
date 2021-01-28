import 'package:Ijakhdem/Core/Utils/appColors.dart';
import 'package:Ijakhdem/Features/Home/Presentation/bloc/home_bloc.dart';
import 'package:Ijakhdem/Features/Signin/Domain/Entities/profileEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListCategoriesDisplay extends StatefulWidget {
  final Profile profile;

  ListCategoriesDisplay({Key key, @required this.profile}) : super(key: key);

  @override
  _ListCategoriesDisplayState createState() => _ListCategoriesDisplayState();
}

class _ListCategoriesDisplayState extends State<ListCategoriesDisplay> {
  @override
  Widget build(BuildContext context) {
    Profile profile = widget.profile;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      // onPressed: () => Scaffold.of(context).openDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.primaryColor,
          ),
          onPressed: () => dispatchGoToHome(profile),
        ),
      ),
      body: ListView.separated(
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            height: screenHeight * 0.01,
            thickness: 1.5,
            color: Colors.grey[200],
          );
        },
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(
              'Apple iBooks Author',
              // style: TextStyle(
              //   fontWeight: FontWeight.bold,
              // ),
            ),
            trailing: Icon(
              Icons.keyboard_arrow_right,
              color: AppColors.primaryColor,
            ),
            onTap: () {
              dispatchGoToHome(profile);
            },
          );
        },
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
