import 'package:dartz/dartz.dart';
import 'package:Ijakhdem/Core/Error/failure.dart';
import 'package:Ijakhdem/Core/Usecases/usecases.dart';
import 'package:Ijakhdem/Core/Utils/parameters.dart';
import 'package:Ijakhdem/Features/Profile/Domain/Repositories/profileRepository.dart';
import 'package:Ijakhdem/Features/Signin/Domain/Entities/profileEntity.dart';

class ResetPassword implements Usescases<Profile, ResetPasswordParams> {
  final ProfileRepository homeRepository;

  ResetPassword(this.homeRepository);

  @override
  Future<Either<Failure, Profile>> call(
      ResetPasswordParams resetPasswordParams) async {
    return await homeRepository.resetPassword(resetPasswordParams);
  }
}
