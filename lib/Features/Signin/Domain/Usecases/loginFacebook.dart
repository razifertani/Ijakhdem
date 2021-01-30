import 'package:Ijakhdem/Core/Error/failure.dart';
import 'package:Ijakhdem/Core/Usecases/usecases.dart';
import 'package:Ijakhdem/Features/Signin/Domain/Entities/profileEntity.dart';
import 'package:Ijakhdem/Features/Signin/Domain/Repositories/userRepository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class LoginFacebook implements Usescases<Profile, FacebookAccessToken> {
  final UserRepository userRepository;

  LoginFacebook(this.userRepository);

  @override
  Future<Either<Failure, Profile>> call(FacebookAccessToken token) async {
    return await userRepository.loginFacebook(token);
  }
}
