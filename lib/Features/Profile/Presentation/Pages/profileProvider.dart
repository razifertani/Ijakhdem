import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Ijakhdem/Features/Profile/Presentation/Pages/profilePage.dart';
import 'package:Ijakhdem/Features/Profile/Presentation/bloc/profile_bloc.dart';
import 'package:Ijakhdem/Features/Signin/Domain/Entities/profileEntity.dart';
import 'package:Ijakhdem/injection_container.dart';
import 'package:Ijakhdem/Core/Utils/appBottomNavigationBar.dart';

class ProfileProvider extends StatelessWidget {
  final Profile profile;
  const ProfileProvider({Key key, @required this.profile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => null,
      child: Scaffold(
        body: BlocProvider(
          builder: (_) => sl<ProfileBloc>(),
          child: ProfilePage(
            profile: profile,
          ),
        ),
      ),
    );
  }
}
