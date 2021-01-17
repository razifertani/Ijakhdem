import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Ijakhdem/Core/Utils/loadingWidget.dart';
import 'package:Ijakhdem/Features/PostJob/Presentation/Widgets/postJobDisplay.dart';
import 'package:Ijakhdem/Features/PostJob/Presentation/bloc/postJob_bloc.dart';
import 'package:Ijakhdem/Features/Signin/Domain/Entities/profileEntity.dart';

class PostJobPage extends StatelessWidget {
  final Profile profile;

  const PostJobPage({Key key, @required this.profile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostJobBloc, PostJobState>(
      builder: (context, state) {
        if (state is EmptyPostJobState) {
          return PostJobDisplay(
            profile: profile,
          );
        }

        if (state is GoToPostJobState) {
          return PostJobDisplay(
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

        if (state is LoadingPostJobState) {
          return LoadingWidget();
        }

        return LoadingWidget();
      },
    );
  }
}
