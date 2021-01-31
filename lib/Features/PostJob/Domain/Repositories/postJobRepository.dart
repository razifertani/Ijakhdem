import 'package:dartz/dartz.dart';
import 'package:Ijakhdem/Core/Error/failure.dart';
import 'package:Ijakhdem/Features/Signin/Domain/Entities/profileEntity.dart';

abstract class PostJobRepository {
  Future<Either<Failure, Profile>> postJob(Profile profile);
}
