part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  HomeEvent([List props = const <dynamic>[]]) : super(props);
}

class GoToHomeEvent extends HomeEvent {
  final Profile profile;

  GoToHomeEvent({
    @required this.profile,
  }) : super([profile]);
}

class GoToMyJobsEvent extends HomeEvent {
  final Profile profile;

  GoToMyJobsEvent({
    @required this.profile,
  }) : super([profile]);
}

class GoToPostJobEvent extends HomeEvent {
  final Profile profile;

  GoToPostJobEvent({
    @required this.profile,
  }) : super([profile]);
}

class GoToMessagesEvent extends HomeEvent {
  final Profile profile;

  GoToMessagesEvent({
    @required this.profile,
  }) : super([profile]);
}

class GoToProfileEvent extends HomeEvent {
  final Profile profile;

  GoToProfileEvent({
    @required this.profile,
  }) : super([profile]);
}

class GoToRecommendedJobsEvent extends HomeEvent {
  final Profile profile;

  GoToRecommendedJobsEvent({
    @required this.profile,
  }) : super([profile]);
}

class GoToListCategoriesEvent extends HomeEvent {
  final Profile profile;

  GoToListCategoriesEvent({
    @required this.profile,
  }) : super([profile]);
}

class GoToSpecificJobEvent extends HomeEvent {
  final Profile profile;

  GoToSpecificJobEvent({
    @required this.profile,
  }) : super([profile]);
}
