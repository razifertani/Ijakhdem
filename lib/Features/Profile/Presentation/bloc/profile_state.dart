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
