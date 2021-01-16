import 'package:Ijakhdem/Features/Signin/Domain/Entities/profileEntity.dart';
import 'package:flutter/material.dart';
import 'package:Ijakhdem/Core/Utils/parameters.dart';
import 'package:Ijakhdem/Features/Home/Data/Datasource/homeRemoteDatasource.dart';
import 'package:http/http.dart' as http;

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final http.Client client;

  HomeRemoteDataSourceImpl({@required this.client});

  @override
  Future<Profile> resetPassword(
      ResetPasswordParams resetPasswordParams) async {}

  @override
  Future<String> logout(Profile profile) async {}
}
