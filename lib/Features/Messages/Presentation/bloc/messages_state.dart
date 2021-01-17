part of 'messages_bloc.dart';

abstract class MessagesState extends Equatable {
  MessagesState([List props = const <dynamic>[]]) : super(props);
}

class EmptyMessagesState extends MessagesState {}

class LoadingMessagesState extends MessagesState {}

class ErrorMessagesState extends MessagesState {
  final Profile profile;

  ErrorMessagesState({
    @required this.profile,
  }) : super([profile]);
}

class GoToMessagesState extends MessagesState {
  final Profile profile;

  GoToMessagesState({
    @required this.profile,
  }) : super([profile]);
}

class GoToMyJobsState extends MessagesState {
  final Profile profile;

  GoToMyJobsState({
    @required this.profile,
  }) : super([profile]);
}

class GoToPostJobState extends MessagesState {
  final Profile profile;

  GoToPostJobState({
    @required this.profile,
  }) : super([profile]);
}

class GoToProfileState extends MessagesState {
  final Profile profile;

  GoToProfileState({
    @required this.profile,
  }) : super([profile]);
}
