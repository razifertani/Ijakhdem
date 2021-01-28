part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  ProfileState([List props = const <dynamic>[]]) : super(props);
}

class EmptyProfileState extends ProfileState {}

class LoadingProfileState extends ProfileState {}

class ErrorProfileState extends ProfileState {
  final Profile profile;

  ErrorProfileState({
    @required this.profile,
  }) : super([profile]);
}

class GoToHomeState extends ProfileState {
  final Profile profile;

  GoToHomeState({
    @required this.profile,
  }) : super([profile]);
}

class GoToMyJobsState extends ProfileState {
  final Profile profile;

  GoToMyJobsState({
    @required this.profile,
  }) : super([profile]);
}

class GoToPostJobState extends ProfileState {
  final Profile profile;

  GoToPostJobState({
    @required this.profile,
  }) : super([profile]);
}

class GoToMessagesState extends ProfileState {
  final Profile profile;

  GoToMessagesState({
    @required this.profile,
  }) : super([profile]);
}

class GoToProfileState extends ProfileState {
  final Profile profile;

  GoToProfileState({
    @required this.profile,
  }) : super([profile]);
}

class GoToProfileWidgetState extends ProfileState {
  final Profile profile;

  GoToProfileWidgetState({
    @required this.profile,
  }) : super([profile]);
}

class GoToBalanceWidgetState extends ProfileState {
  final Profile profile;

  GoToBalanceWidgetState({
    @required this.profile,
  }) : super([profile]);
}

class GoToNotificationsWidgetState extends ProfileState {
  final Profile profile;

  GoToNotificationsWidgetState({
    @required this.profile,
  }) : super([profile]);
}

class GoToNotificationsSettingsWidgetState extends ProfileState {
  final Profile profile;

  GoToNotificationsSettingsWidgetState({
    @required this.profile,
  }) : super([profile]);
}

class GoToProfileDisplayState extends ProfileState {
  final Profile profile;

  GoToProfileDisplayState({
    @required this.profile,
  }) : super([profile]);
}

class GoToOnBoardingState extends ProfileState {
  final Profile profile;

  GoToOnBoardingState({
    @required this.profile,
  }) : super([profile]);
}
