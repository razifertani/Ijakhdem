import 'package:Ijakhdem/Core/Utils/appColors.dart';
import 'package:Ijakhdem/Features/Profile/Presentation/bloc/profile_bloc.dart';
import 'package:Ijakhdem/Features/Signin/Domain/Entities/profileEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BalanceWidget extends StatefulWidget {
  final Profile profile;

  const BalanceWidget({Key key, @required this.profile}) : super(key: key);

  @override
  _BalanceWidgetState createState() => _BalanceWidgetState();
}

class _BalanceWidgetState extends State<BalanceWidget> {
  @override
  Widget build(BuildContext context) {
    Profile profile = widget.profile;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          shadowColor: Colors.blueAccent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              dispatchGoToProfileDisplay(profile);
            },
          ),
        ),
        backgroundColor: Colors.blueAccent,
        body: Container(
          color: Colors.blueAccent,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  padding: EdgeInsets.all(8),
                  child: ListTile(
                    title: Text(
                      "Available Balance",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    subtitle: Text(
                      "Your account balance from differenct currencies\n you preferred",
                      style: TextStyle(color: Colors.white70),
                    ),
                  )),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: Container(
                      width: double.infinity,
                      child: OutlineButton(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        // materialTapTargetSize: MaterialTapTargetSize.padded,
                        onPressed: () => print("go to deposit page"),
                        borderSide: BorderSide(color: Colors.white),
                        child: Text(
                          "Deposit Money",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(3),
                    child: Text(
                      "These value are indication and are subject to change on settlment",
                      style: TextStyle(fontSize: 10, color: Colors.white70),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
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
