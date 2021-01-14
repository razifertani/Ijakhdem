import 'package:Ijakhdem/Features/Signin/Domain/Entities/profileEntity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class LoginParams extends Equatable {
  final String email;
  final String password;

  LoginParams({@required this.email, @required this.password})
      : super([email, password]);
}

class RegisterParams extends Equatable {
  final String firstName;
  final String lastName;
  final String email;
  final String password;

  RegisterParams({
    this.firstName,
    @required this.lastName,
    @required this.email,
    @required this.password,
  }) : super([firstName, lastName, email, password]);
}

class ResetPasswordParams extends Equatable {
  final Profile profile;
  final String oldPassword;
  final String newPassword;

  ResetPasswordParams({
    @required this.profile,
    @required this.oldPassword,
    @required this.newPassword,
  }) : super([profile, oldPassword, newPassword]);
}
