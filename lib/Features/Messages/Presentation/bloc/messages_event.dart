part of 'messages_bloc.dart';

abstract class MessagesEvent extends Equatable {
  MessagesEvent([List props = const <dynamic>[]]) : super(props);
}

class GoToMessagesEvent extends MessagesEvent {
  final Profile profile;

  GoToMessagesEvent({
    @required this.profile,
  }) : super([profile]);
}

class GoToMyJobsEvent extends MessagesEvent {
  final Profile profile;

  GoToMyJobsEvent({
    @required this.profile,
  }) : super([profile]);
}

class GoToPostJobEvent extends MessagesEvent {
  final Profile profile;

  GoToPostJobEvent({
    @required this.profile,
  }) : super([profile]);
}

class GoToProfileEvent extends MessagesEvent {
  final Profile profile;

  GoToProfileEvent({
    @required this.profile,
  }) : super([profile]);
}
