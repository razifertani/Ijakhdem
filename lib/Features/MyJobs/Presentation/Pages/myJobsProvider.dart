import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Ijakhdem/Features/MyJobs/Presentation/Pages/myJobsPage.dart';
import 'package:Ijakhdem/Features/MyJobs/Presentation/bloc/myJobs_bloc.dart';
import 'package:Ijakhdem/Features/Signin/Domain/Entities/profileEntity.dart';
import 'package:Ijakhdem/injection_container.dart';

class MyJobsProvider extends StatelessWidget {
  final Profile profile;
  const MyJobsProvider({Key key, @required this.profile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => null,
      child: Scaffold(
        body: BlocProvider(
          builder: (_) => sl<MyJobsBloc>(),
          child: MyJobsPage(
            profile: profile,
          ),
        ),
      ),
    );
  }
}
