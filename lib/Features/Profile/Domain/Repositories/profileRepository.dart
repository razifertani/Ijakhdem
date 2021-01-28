import 'package:dartz/dartz.dart';
import 'package:Ijakhdem/Core/Error/failure.dart';
import 'package:Ijakhdem/Core/Utils/parameters.dart';
import 'package:Ijakhdem/Features/Signin/Domain/Entities/profileEntity.dart';

abstract class ProfileRepository {
  Future<Either<Failure, Profile>> resetPassword(
      ResetPasswordParams resetPasswordParams);
  Future<Either<Failure, String>> logout(Profile profile);
}
