import 'package:Ijakhdem/Core/Error/failure.dart';
import 'package:Ijakhdem/Core/Usecases/usecases.dart';
import 'package:Ijakhdem/Features/Signin/Domain/Entities/profileEntity.dart';
import 'package:Ijakhdem/Features/Signin/Domain/Repositories/userRepository.dart';
import 'package:dartz/dartz.dart';

class LoginFacebook implements Usescases<Profile, String> {
  final UserRepository userRepository;

  LoginFacebook(this.userRepository);

  @override
  Future<Either<Failure, Profile>> call(String test) async {
    return await userRepository.loginFacebook(test);
  }
}
