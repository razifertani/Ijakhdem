part of 'myJobs_bloc.dart';

abstract class MyJobsState extends Equatable {
  MyJobsState([List props = const <dynamic>[]]) : super(props);
}

class EmptyMyJobsState extends MyJobsState {}

class LoadingMyJobsState extends MyJobsState {}

class ErrorMyJobsState extends MyJobsState {
  final Profile profile;

  ErrorMyJobsState({
    @required this.profile,
  }) : super([profile]);
}

class GoToMyJobsState extends MyJobsState {
  final Profile profile;

  GoToMyJobsState({
    @required this.profile,
  }) : super([profile]);
}

class GoToPostJobState extends MyJobsState {
  final Profile profile;

  GoToPostJobState({
    @required this.profile,
  }) : super([profile]);
}

class GoToMessagesState extends MyJobsState {
  final Profile profile;

  GoToMessagesState({
    @required this.profile,
  }) : super([profile]);
}

class GoToProfileState extends MyJobsState {
  final Profile profile;

  GoToProfileState({
    @required this.profile,
  }) : super([profile]);
}
