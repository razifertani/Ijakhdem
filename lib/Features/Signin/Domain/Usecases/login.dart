import 'package:Ijakhdem/Core/Error/failure.dart';
import 'package:Ijakhdem/Core/Usecases/usecases.dart';
import 'package:Ijakhdem/Core/Utils/parameters.dart';
import 'package:Ijakhdem/Features/Signin/Domain/Entities/profileEntity.dart';
import 'package:Ijakhdem/Features/Signin/Domain/Repositories/userRepository.dart';
import 'package:dartz/dartz.dart';

class Login implements Usescases<Profile, LoginParams> {
  final UserRepository userRepository;

  Login(this.userRepository);

  @override
  Future<Either<Failure, Profile>> call(LoginParams loginParams) async {
    return await userRepository.login(loginParams);
  }
}
