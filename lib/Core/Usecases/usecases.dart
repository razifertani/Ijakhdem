import 'package:Ijakhdem/Core/Error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class Usescases<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
