import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:Ijakhdem/Core/Utils/parameters.dart';
import 'package:Ijakhdem/Features/Home/Domain/Usecases/logout.dart';
import 'package:Ijakhdem/Features/Home/Domain/Usecases/resetPassword.dart';
import 'package:Ijakhdem/Features/Signin/Domain/Entities/profileEntity.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ResetPassword resetPassword;
  final Logout logout;

  HomeBloc({
    @required this.resetPassword,
    @required this.logout,
  });

  @override
  HomeState get initialState => EmptyHomeState();

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is GoToRecommendedJobsEvent) {
      yield GoToRecommendedJobsState(
        profile: event.profile,
      );
    }

    if (event is GoToListCategoriesEvent) {
      yield GoToListCategoriesState(
        profile: event.profile,
      );
    }

    if (event is GoToSpecificJobEvent) {
      yield GoToSpecificJobState(
        profile: event.profile,
      );
    }

    if (event is GoToHomeEvent) {
      yield GoToHomeState(
        profile: event.profile,
      );
    }

    if (event is GoToMyJobsEvent) {
      yield GoToMyJobsState(
        profile: event.profile,
      );
    }

    if (event is GoToPostJobEvent) {
      yield GoToPostJobState(
        profile: event.profile,
      );
    }

    if (event is GoToMessagesEvent) {
      yield GoToMessagesState(
        profile: event.profile,
      );
    }

    if (event is GoToMessagesEvent) {
      yield GoToMessagesState(
        profile: event.profile,
      );
    }

    if (event is GoToProfileEvent) {
      yield GoToProfileState(
        profile: event.profile,
      );
    }
  }
}
