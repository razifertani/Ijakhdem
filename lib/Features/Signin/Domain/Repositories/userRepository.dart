import 'package:Ijakhdem/Core/Error/failure.dart';
import 'package:Ijakhdem/Core/Utils/parameters.dart';
import 'package:Ijakhdem/Features/Signin/Domain/Entities/profileEntity.dart';
import 'package:dartz/dartz.dart';

abstract class UserRepository {
  Future<Either<Failure, Profile>> login(LoginParams loginParams);
  Future<Either<Failure, Profile>> loginGoogle(String test);
  Future<Either<Failure, Profile>> loginFacebook(String token);
  Future<Either<Failure, String>> register(RegisterParams registerParams);
  Future<Either<Failure, String>> forgotPassword(String email);
}
