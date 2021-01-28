import 'package:Ijakhdem/Features/Profile/Presentation/Widgets/Components/balanceWidget.dart';
import 'package:Ijakhdem/Features/Profile/Presentation/Widgets/Components/notificationsSettingsWidget.dart';
import 'package:Ijakhdem/Features/Profile/Presentation/Widgets/Components/notificationsWidget.dart';
import 'package:Ijakhdem/Features/Profile/Presentation/Widgets/Components/onBoardingDisplay.dart';
import 'package:Ijakhdem/Features/Profile/Presentation/Widgets/Components/profileWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Ijakhdem/Core/Utils/loadingWidget.dart';
import 'package:Ijakhdem/Features/Profile/Presentation/Widgets/profileDisplay.dart';
import 'package:Ijakhdem/Features/Profile/Presentation/bloc/profile_bloc.dart';
import 'package:Ijakhdem/Features/Signin/Domain/Entities/profileEntity.dart';

class ProfilePage extends StatelessWidget {
  final Profile profile;

  const ProfilePage({Key key, @required this.profile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        if (state is EmptyProfileState) {
          return ProfileDisplay(
            profile: profile,
          );
        }

        if (state is GoToProfileState) {
          return ProfileDisplay(
            profile: state.profile,
          );
        }

        if (state is GoToProfileWidgetState) {
          return ProfileWidget(
            profile: state.profile,
          );
        }

        if (state is GoToBalanceWidgetState) {
          return BalanceWidget(
            profile: state.profile,
          );
        }

        if (state is GoToProfileDisplayState) {
          return ProfileDisplay(
            profile: state.profile,
          );
        }

        if (state is GoToNotificationsWidgetState) {
          return NotificationsWidget(
            profile: state.profile,
          );
        }

        if (state is GoToNotificationsSettingsWidgetState) {
          return NotificationsSettingsWidget(
            profile: state.profile,
          );
        }

        if (state is GoToOnBoardingState) {
          return OnBoardingDisplay(
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

        if (state is LoadingProfileState) {
          return LoadingWidget();
        }

        return LoadingWidget();
      },
    );
  }
}
