part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  ProfileEvent([List props = const <dynamic>[]]) : super(props);
}

class GoToHomeEvent extends ProfileEvent {
  final Profile profile;

  GoToHomeEvent({
    @required this.profile,
  }) : super([profile]);
}

class GoToMyJobsEvent extends ProfileEvent {
  final Profile profile;

  GoToMyJobsEvent({
    @required this.profile,
  }) : super([profile]);
}

class GoToPostJobEvent extends ProfileEvent {
  final Profile profile;

  GoToPostJobEvent({
    @required this.profile,
  }) : super([profile]);
}

class GoToMessagesEvent extends ProfileEvent {
  final Profile profile;

  GoToMessagesEvent({
    @required this.profile,
  }) : super([profile]);
}

class GoToProfileEvent extends ProfileEvent {
  final Profile profile;

  GoToProfileEvent({
    @required this.profile,
  }) : super([profile]);
}

class GoToProfileWidgetEvent extends ProfileEvent {
  final Profile profile;

  GoToProfileWidgetEvent({
    @required this.profile,
  }) : super([profile]);
}

class GoToBalanceWidgetEvent extends ProfileEvent {
  final Profile profile;

  GoToBalanceWidgetEvent({
    @required this.profile,
  }) : super([profile]);
}

class GoToNotificationsWidgetEvent extends ProfileEvent {
  final Profile profile;

  GoToNotificationsWidgetEvent({
    @required this.profile,
  }) : super([profile]);
}

class GoToNotificationsSettingsWidgetEvent extends ProfileEvent {
  final Profile profile;

  GoToNotificationsSettingsWidgetEvent({
    @required this.profile,
  }) : super([profile]);
}

class GoToProfileDisplayEvent extends ProfileEvent {
  final Profile profile;

  GoToProfileDisplayEvent({
    @required this.profile,
  }) : super([profile]);
}
