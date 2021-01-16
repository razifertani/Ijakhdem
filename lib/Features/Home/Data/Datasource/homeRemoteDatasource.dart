import 'package:Ijakhdem/Core/Utils/parameters.dart';
import 'package:Ijakhdem/Features/Signin/Domain/Entities/profileEntity.dart';

abstract class HomeRemoteDataSource {
  Future<Profile> resetPassword(ResetPasswordParams resetPasswordParams);
  Future<String> logout(Profile profile);
}
