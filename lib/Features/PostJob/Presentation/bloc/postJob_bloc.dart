import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:Ijakhdem/Features/Signin/Domain/Entities/profileEntity.dart';

part 'postJob_event.dart';
part 'postJob_state.dart';

class PostJobBloc extends Bloc<PostJobEvent, PostJobState> {
  PostJobBloc();

  @override
  PostJobState get initialState => EmptyPostJobState();

  @override
  Stream<PostJobState> mapEventToState(
    PostJobEvent event,
  ) async* {
    if (event is GoToPostJobEvent) {
      yield GoToPostJobState(
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
