import 'package:Ijakhdem/Core/Utils/parameters.dart';
import 'package:Ijakhdem/Features/Signin/Domain/Entities/profileEntity.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

abstract class UserRemoteDataSource {
  Future<Profile> login(LoginParams loginParams);
  Future<Profile> loginGoogle(String test);
  Future<Profile> loginFacebook(String token);
  Future<String> register(RegisterParams registerParams);
  Future<String> forgotPassword(String email);
}
