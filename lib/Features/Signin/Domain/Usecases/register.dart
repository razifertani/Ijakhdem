import 'package:Ijakhdem/Core/Utils/parameters.dart';
import 'package:dartz/dartz.dart';
import 'package:Ijakhdem/Core/Error/failure.dart';
import 'package:Ijakhdem/Core/Usecases/usecases.dart';
import 'package:Ijakhdem/Features/Signin/Domain/Repositories/userRepository.dart';

class Register implements Usescases<String, RegisterParams> {
  final UserRepository userRepository;

  Register(this.userRepository);

  @override
  Future<Either<Failure, String>> call(RegisterParams registerParams) async {
    return await userRepository.register(registerParams);
  }
}
