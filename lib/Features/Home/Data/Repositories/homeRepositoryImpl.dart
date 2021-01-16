import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:Ijakhdem/Core/Error/failure.dart';
import 'package:Ijakhdem/Core/Network/networkInfo.dart';
import 'package:Ijakhdem/Core/Utils/parameters.dart';
import 'package:Ijakhdem/Features/Home/Data/Datasource/homeRemoteDatasource.dart';
import 'package:Ijakhdem/Features/Home/Domain/Repositories/homeRepository.dart';
import 'package:Ijakhdem/Features/Signin/Domain/Entities/profileEntity.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  var response;

  HomeRepositoryImpl({
    @required this.remoteDataSource,
    @required this.networkInfo,
  });

  @override
  Future<Either<Failure, Profile>> resetPassword(
      ResetPasswordParams resetPasswordParams) async {}

  @override
  Future<Either<Failure, String>> logout(Profile profile) async {}
}
