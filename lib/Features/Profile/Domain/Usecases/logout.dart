import 'package:dartz/dartz.dart';
import 'package:Ijakhdem/Core/Error/failure.dart';
import 'package:Ijakhdem/Core/Usecases/usecases.dart';
import 'package:Ijakhdem/Features/Profile/Domain/Repositories/profileRepository.dart';
import 'package:Ijakhdem/Features/Signin/Domain/Entities/profileEntity.dart';

class Logout implements Usescases<String, Profile> {
  final ProfileRepository profileRepository;

  Logout(this.profileRepository);

  @override
  Future<Either<Failure, String>> call(Profile profile) async {
    return await profileRepository.logout(profile);
  }
}
