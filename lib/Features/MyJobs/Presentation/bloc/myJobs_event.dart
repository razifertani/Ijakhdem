part of 'myJobs_bloc.dart';

abstract class MyJobsEvent extends Equatable {
  MyJobsEvent([List props = const <dynamic>[]]) : super(props);
}

class GoToMyJobsEvent extends MyJobsEvent {
  final Profile profile;

  GoToMyJobsEvent({
    @required this.profile,
  }) : super([profile]);
}

class GoToPostJobEvent extends MyJobsEvent {
  final Profile profile;

  GoToPostJobEvent({
    @required this.profile,
  }) : super([profile]);
}

class GoToMessagesEvent extends MyJobsEvent {
  final Profile profile;

  GoToMessagesEvent({
    @required this.profile,
  }) : super([profile]);
}

class GoToProfileEvent extends MyJobsEvent {
  final Profile profile;

  GoToProfileEvent({
    @required this.profile,
  }) : super([profile]);
}
