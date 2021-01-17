import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:Ijakhdem/Features/Signin/Domain/Entities/profileEntity.dart';

part 'myJobs_event.dart';
part 'myJobs_state.dart';

class MyJobsBloc extends Bloc<MyJobsEvent, MyJobsState> {
  MyJobsBloc();

  @override
  MyJobsState get initialState => EmptyMyJobsState();

  @override
  Stream<MyJobsState> mapEventToState(
    MyJobsEvent event,
  ) async* {
    if (event is GoToMyJobsEvent) {
      yield GoToMyJobsState(
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
