part of 'postJob_bloc.dart';

abstract class PostJobEvent extends Equatable {
  PostJobEvent([List props = const <dynamic>[]]) : super(props);
}

class GoToPostJobEvent extends PostJobEvent {
  final Profile profile;

  GoToPostJobEvent({
    @required this.profile,
  }) : super([profile]);
}

class GoToMyJobsEvent extends PostJobEvent {
  final Profile profile;

  GoToMyJobsEvent({
    @required this.profile,
  }) : super([profile]);
}

class GoToMessagesEvent extends PostJobEvent {
  final Profile profile;

  GoToMessagesEvent({
    @required this.profile,
  }) : super([profile]);
}

class GoToProfileEvent extends PostJobEvent {
  final Profile profile;

  GoToProfileEvent({
    @required this.profile,
  }) : super([profile]);
}
