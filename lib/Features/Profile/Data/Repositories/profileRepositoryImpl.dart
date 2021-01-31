import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:Ijakhdem/Core/Error/exceptions.dart';
import 'package:Ijakhdem/Core/Error/failure.dart';
import 'package:Ijakhdem/Core/Network/networkInfo.dart';
import 'package:Ijakhdem/Core/Utils/parameters.dart';
import 'package:Ijakhdem/Features/Profile/Data/Datasource/profileRemoteDatasource.dart';
import 'package:Ijakhdem/Features/Profile/Domain/Repositories/profileRepository.dart';
import 'package:Ijakhdem/Features/Signin/Domain/Entities/profileEntity.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  var response;

  ProfileRepositoryImpl({
    @required this.remoteDataSource,
    @required this.networkInfo,
  });

  @override
  Future<Either<Failure, Profile>> editProfile(Profile profile) async {
    try {
      if (await networkInfo.isConnected == false) {
        throw ServerExeption();
      }
      response = await remoteDataSource.editProfile(profile);
      if (response is Profile) {
        return Right(response);
      } else {
        return Left(response);
      }
    } on ServerExeption {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Profile>> resetPassword(
      ResetPasswordParams resetPasswordParams) async {
    try {
      if (await networkInfo.isConnected == false) {
        throw ServerExeption();
      }
      response = await remoteDataSource.resetPassword(resetPasswordParams);
      if (response is Profile) {
        return Right(response);
      } else {
        return Left(response);
      }
    } on ServerExeption {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> logout(Profile profile) async {
    try {
      if (await networkInfo.isConnected == false) {
        throw ServerExeption();
      }
      response = await remoteDataSource.logout(profile);
      if (response is String) {
        return Right(response);
      } else {
        return Left(response);
      }
    } on ServerExeption {
      return Left(ServerFailure());
    }
  }
}
