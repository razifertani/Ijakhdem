part of 'postJob_bloc.dart';

abstract class PostJobState extends Equatable {
  PostJobState([List props = const <dynamic>[]]) : super(props);
}

class EmptyPostJobState extends PostJobState {}

class LoadingPostJobState extends PostJobState {}

class ErrorPostJobState extends PostJobState {
  final Profile profile;

  ErrorPostJobState({
    @required this.profile,
  }) : super([profile]);
}

class GoToPostJobState extends PostJobState {
  final Profile profile;

  GoToPostJobState({
    @required this.profile,
  }) : super([profile]);
}

class GoToMyJobsState extends PostJobState {
  final Profile profile;

  GoToMyJobsState({
    @required this.profile,
  }) : super([profile]);
}

class GoToMessagesState extends PostJobState {
  final Profile profile;

  GoToMessagesState({
    @required this.profile,
  }) : super([profile]);
}

class GoToProfileState extends PostJobState {
  final Profile profile;

  GoToProfileState({
    @required this.profile,
  }) : super([profile]);
}
