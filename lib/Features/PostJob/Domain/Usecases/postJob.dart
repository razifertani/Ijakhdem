import 'package:Ijakhdem/Features/PostJob/Domain/Repositories/postJobRepository.dart';
import 'package:dartz/dartz.dart';
import 'package:Ijakhdem/Core/Error/failure.dart';
import 'package:Ijakhdem/Core/Usecases/usecases.dart';
import 'package:Ijakhdem/Features/Signin/Domain/Entities/profileEntity.dart';

class ResetPassword implements Usescases<Profile, Profile> {
  final PostJobRepository postJobRepository;

  ResetPassword(this.postJobRepository);

  @override
  Future<Either<Failure, Profile>> call(Profile profile) async {
    return await postJobRepository.postJob(profile);
  }
}
