import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Ijakhdem/Core/Utils/loadingWidget.dart';
import 'package:Ijakhdem/Features/Messages/Presentation/Widgets/messagesDisplay.dart';
import 'package:Ijakhdem/Features/Messages/Presentation/bloc/messages_bloc.dart';
import 'package:Ijakhdem/Features/Signin/Domain/Entities/profileEntity.dart';

class MessagesPage extends StatelessWidget {
  final Profile profile;

  const MessagesPage({Key key, @required this.profile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MessagesBloc, MessagesState>(
      builder: (context, state) {
        if (state is EmptyMessagesState) {
          return MessagesDisplay(
            profile: profile,
          );
        }

        if (state is GoToMessagesState) {
          return MessagesDisplay(
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

        if (state is LoadingMessagesState) {
          return LoadingWidget();
        }

        return LoadingWidget();
      },
    );
  }
}
