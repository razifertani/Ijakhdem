import 'package:dartz/dartz.dart';
import 'package:Ijakhdem/Core/Error/failure.dart';
import 'package:Ijakhdem/Core/Usecases/usecases.dart';
import 'package:Ijakhdem/Features/Signin/Domain/Entities/profileEntity.dart';
import 'package:Ijakhdem/Features/Signin/Domain/Repositories/userRepository.dart';

class LoginGoogle implements Usescases<Profile, String> {
  final UserRepository userRepository;

  LoginGoogle(this.userRepository);

  @override
  Future<Either<Failure, Profile>> call(String test) async {
    return await userRepository.loginGoogle(test);
  }
}
