import 'package:Ijakhdem/Core/Utils/parameters.dart';
import 'package:Ijakhdem/Features/Signin/Domain/Entities/profileEntity.dart';

abstract class ProfileRemoteDataSource {
  Future<Profile> resetPassword(ResetPasswordParams resetPasswordParams);
  Future<Profile> editProfile(Profile profile);
  Future<String> logout(Profile profile);
}
