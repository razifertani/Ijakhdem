part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  HomeState([List props = const <dynamic>[]]) : super(props);
}

class EmptyHomeState extends HomeState {}

class LoadingHomeState extends HomeState {}

class ErrorHomeState extends HomeState {
  final Profile profile;

  ErrorHomeState({
    @required this.profile,
  }) : super([profile]);
}

class GoToHomeState extends HomeState {
  final Profile profile;

  GoToHomeState({
    @required this.profile,
  }) : super([profile]);
}

class GoToMyJobsState extends HomeState {
  final Profile profile;

  GoToMyJobsState({
    @required this.profile,
  }) : super([profile]);
}

class GoToPostJobState extends HomeState {
  final Profile profile;

  GoToPostJobState({
    @required this.profile,
  }) : super([profile]);
}

class GoToMessagesState extends HomeState {
  final Profile profile;

  GoToMessagesState({
    @required this.profile,
  }) : super([profile]);
}

class GoToProfileState extends HomeState {
  final Profile profile;

  GoToProfileState({
    @required this.profile,
  }) : super([profile]);
}

class GoToRecommendedJobsState extends HomeState {
  final Profile profile;

  GoToRecommendedJobsState({
    @required this.profile,
  }) : super([profile]);
}

class GoToListCategoriesState extends HomeState {
  final Profile profile;

  GoToListCategoriesState({
    @required this.profile,
  }) : super([profile]);
}

class GoToSpecificJobState extends HomeState {
  final Profile profile;

  GoToSpecificJobState({
    @required this.profile,
  }) : super([profile]);
}
