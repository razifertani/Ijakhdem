import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Ijakhdem/Core/Utils/loadingWidget.dart';
import 'package:Ijakhdem/Features/MyJobs/Presentation/Widgets/myJobsDisplay.dart';
import 'package:Ijakhdem/Features/MyJobs/Presentation/bloc/myJobs_bloc.dart';
import 'package:Ijakhdem/Features/Signin/Domain/Entities/profileEntity.dart';

class MyJobsPage extends StatelessWidget {
  final Profile profile;

  const MyJobsPage({Key key, @required this.profile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyJobsBloc, MyJobsState>(
      builder: (context, state) {
        if (state is EmptyMyJobsState) {
          return MyJobsDisplay(
            profile: profile,
          );
        }

        if (state is GoToMyJobsState) {
          return MyJobsDisplay(
            profile: state.profile,
          );
        }

        if (state is GoToMyJobsState) {
          //
        }

        if (state is GoToPostJobState) {
          // Navigator
        }

        if (state is GoToMessagesState) {
          // Navigator
        }

        if (state is GoToProfileState) {
          // Navigator
        }

        if (state is LoadingMyJobsState) {
          return LoadingWidget();
        }

        return LoadingWidget();
      },
    );
  }
}
