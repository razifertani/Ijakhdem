import 'package:dartz/dartz.dart';
import 'package:Ijakhdem/Core/Error/failure.dart';
import 'package:Ijakhdem/Core/Usecases/usecases.dart';
import 'package:Ijakhdem/Features/Profile/Domain/Repositories/profileRepository.dart';
import 'package:Ijakhdem/Features/Signin/Domain/Entities/profileEntity.dart';

class EditProfile implements Usescases<Profile, Profile> {
  final ProfileRepository profileRepository;

  EditProfile(this.profileRepository);

  @override
  Future<Either<Failure, Profile>> call(Profile profile) async {
    return await profileRepository.editProfile(profile);
  }
}
