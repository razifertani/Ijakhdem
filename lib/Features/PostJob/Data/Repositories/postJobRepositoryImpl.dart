import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:Ijakhdem/Core/Error/exceptions.dart';
import 'package:Ijakhdem/Core/Error/failure.dart';
import 'package:Ijakhdem/Core/Network/networkInfo.dart';
import 'package:Ijakhdem/Features/PostJob/Data/Datasource/postJobRemoteDatasource.dart';
import 'package:Ijakhdem/Features/PostJob/Domain/Repositories/postJobRepository.dart';
import 'package:Ijakhdem/Features/Signin/Domain/Entities/profileEntity.dart';

class PostJobRepositoryImpl implements PostJobRepository {
  final PostJobRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  var response;

  PostJobRepositoryImpl({
    @required this.remoteDataSource,
    @required this.networkInfo,
  });

  @override
  Future<Either<Failure, Profile>> postJob(Profile profile) async {
    try {
      if (await networkInfo.isConnected == false) {
        throw ServerExeption();
      }
      response = await remoteDataSource.postJob(profile);
      if (response is Profile) {
        return Right(response);
      } else {
        return Left(response);
      }
    } on ServerExeption {
      return Left(ServerFailure());
    }
  }
}
