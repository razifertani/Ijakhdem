import 'dart:async';
import 'dart:convert';
import 'package:Ijakhdem/Core/Utils/parameters.dart';
import 'package:Ijakhdem/Features/Signin/Domain/Entities/profileEntity.dart';
import 'package:Ijakhdem/Features/Signin/Domain/Usecases/forgotPassword.dart';
import 'package:Ijakhdem/Features/Signin/Domain/Usecases/login.dart';
import 'package:Ijakhdem/Features/Signin/Domain/Usecases/loginFacebook.dart';
import 'package:Ijakhdem/Features/Signin/Domain/Usecases/loginGoogle.dart';
import 'package:Ijakhdem/Features/Signin/Domain/Usecases/register.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:http/http.dart' as http;
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final Login login;
  final LoginGoogle loginGoogle;
  final LoginFacebook loginFacebook;
  final Register register;
  final ForgotPassword forgotPassword;

  ///facebook login a integrer
  static final FacebookLogin facebookSignIn = new FacebookLogin();

  LoginBloc(
      {@required this.login,
      @required this.loginGoogle,
      @required this.loginFacebook,
      @required this.register,
      @required this.forgotPassword});

  @override
  LoginState get initialState => SplashScreenDisplayState();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is GoToOnBoardingEvent) {
      yield GoToOnBoardingState();
    }
    if (event is SigninEvent) {
      if (event.isConnected) {
        yield SplashScreenWidgetState();
      } else {
        yield LoadingLoginState();
      }
      final loginParams =
          LoginParams(email: event.email, password: event.password);
      final failureOrToken = await login(loginParams);
      yield* failureOrToken.fold((failure) async* {
        yield ErrorLoginState(
          message: 'Server failure it will be up in a minute',
        );
      }, (profile) async* {
        if (profile.parameters.message != null) {
          yield ErrorLoginState(
            message: profile.parameters.message,
          );
        } else {
          yield LoadedState(profile: profile);
        }
      });
    }

    if (event is SigningGoogleEvent) {
      yield LoadingLoginState();
      final failureOrToken = await loginGoogle('Test');
      yield* failureOrToken.fold((failure) async* {
        yield ErrorLoginState(
          message: 'Server failure it will be up in a minute',
        );
      }, (profile) async* {
        yield LoadedState(profile: profile);
      });
    }

    if (event is SigningFacebookEvent) {
      yield LoadingLoginState();
      final failureOrToken = await loginFacebook(event.token);
      yield* failureOrToken.fold((failure) async* {
        yield ErrorLoginState(
          message: 'Server failure it will be up in a minute',
        );
      }, (profile) async* {
        yield LoadedState(profile: profile);
      });
    }

    if (event is SignupEvent) {
      yield LoadingLoginState();
      final registerParams = RegisterParams(
        firstName: event.firstName,
        lastName: event.lastName,
        email: event.email,
        password: event.password,
      );
      final failureOrToken = await register(registerParams);
      yield* failureOrToken.fold((failure) async* {
        yield ErrorLoginState(
          message: 'Server failure it will be up in a minute',
        );
      }, (message) async* {
        if (message !=
            "User succesfully created on prestashop DB and foun me DB ") {
          yield ErrorLoginState(
            message: message,
          );
        } else {
          yield RegistredState(message: message);
        }
      });
    }

    if (event is ForgotPasswordEvent) {
      yield LoadingLoginState();
      final failureOrToken = await forgotPassword(event.email);
      yield* failureOrToken.fold((failure) async* {
        yield ErrorLoginState(
          message: 'Server failure it will be up in a minute',
        );
      }, (message) async* {
        if (message == "Error occured during sending mail" ||
            message == "User does not exist") {
          yield ErrorLoginState(
            message: message,
          );
        } else {
          yield ForgotPasswordState(
            message: 'Email was sent successfully',
          );
        }
      });
    }

    if (event is GoToSignupEvent) {
      yield GoToSignupState();
    }

    if (event is GoToSigninEvent) {
      yield GoToSigninState();
    }

    if (event is GoToForgotPasswordEvent) {
      yield GoToForgotPasswordState();
    }

    if (event is GoToTermsOfUseEvent) {
      yield GoToTermsOfUseState();
    }

    if (event is GoToPrivacyPolicyEvent) {
      yield GoToPrivacyPolicyState();
    }
  }
}
