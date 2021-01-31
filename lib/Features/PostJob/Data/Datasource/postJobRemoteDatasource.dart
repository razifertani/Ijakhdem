import 'package:Ijakhdem/Features/Signin/Domain/Entities/profileEntity.dart';

abstract class PostJobRemoteDataSource {
  Future<Profile> postJob(Profile profile);
}
