import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:Ijakhdem/Features/Signin/Domain/Entities/profileEntity.dart';
import 'package:Ijakhdem/Features/Profile/Domain/Usecases/logout.dart';
import 'package:Ijakhdem/Features/Profile/Domain/Usecases/resetPassword.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ResetPassword resetPassword;
  final Logout logout;

  ProfileBloc({
    @required this.resetPassword,
    @required this.logout,
  });

  @override
  ProfileState get initialState => EmptyProfileState();

  @override
  Stream<ProfileState> mapEventToState(
    ProfileEvent event,
  ) async* {
    if (event is GoToHomeEvent) {
      yield GoToHomeState(
        profile: event.profile,
      );
    }

    if (event is GoToMyJobsEvent) {
      yield GoToMyJobsState(
        profile: event.profile,
      );
    }

    if (event is GoToPostJobEvent) {
      yield GoToPostJobState(
        profile: event.profile,
      );
    }

    if (event is GoToMessagesEvent) {
      yield GoToMessagesState(
        profile: event.profile,
      );
    }

    if (event is GoToMessagesEvent) {
      yield GoToMessagesState(
        profile: event.profile,
      );
    }

    if (event is GoToProfileEvent) {
      yield GoToProfileState(
        profile: event.profile,
      );
    }

    if (event is GoToProfileWidgetEvent) {
      yield GoToProfileWidgetState(
        profile: event.profile,
      );
    }

    if (event is GoToBalanceWidgetEvent) {
      yield GoToBalanceWidgetState(
        profile: event.profile,
      );
    }

    if (event is GoToNotificationsWidgetEvent) {
      yield GoToNotificationsWidgetState(
        profile: event.profile,
      );
    }

    if (event is GoToNotificationsSettingsWidgetEvent) {
      yield GoToNotificationsSettingsWidgetState(
        profile: event.profile,
      );
    }

    if (event is GoToProfileDisplayEvent) {
      yield GoToProfileDisplayState(
        profile: event.profile,
      );
    }

    if (event is GoToOnBoardingEvent) {
      yield GoToOnBoardingState(
        profile: event.profile,
      );
    }

    if (event is GoToTermsConditionsEvent) {
      yield GoToTermsConditionsState(
        profile: event.profile,
      );
    }

    if (event is GoToPrivacyPoliceyEvent) {
      yield GoToPrivacyPoliceyState(
        profile: event.profile,
      );
    }

    if (event is LogoutEvent) {
      yield LoadingProfileState();
      final failureOrToken = await logout(event.profile);
      yield* failureOrToken.fold((failure) async* {
        yield ErrorProfileState(
          profile: event.profile,
        );
      }, (message) async* {
        yield GoToSigninState();
      });
    }
  }
}
