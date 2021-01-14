import 'package:Ijakhdem/Core/Error/failure.dart';
import 'package:Ijakhdem/Core/Usecases/usecases.dart';
import 'package:Ijakhdem/Features/Signin/Domain/Repositories/userRepository.dart';
import 'package:dartz/dartz.dart';

class ForgotPassword implements Usescases<String, String> {
  final UserRepository userRepository;

  ForgotPassword(this.userRepository);

  @override
  Future<Either<Failure, String>> call(String email) async {
    return await userRepository.forgotPassword(email);
  }
}
