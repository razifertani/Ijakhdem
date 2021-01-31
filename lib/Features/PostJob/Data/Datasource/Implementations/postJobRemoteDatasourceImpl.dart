import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:Ijakhdem/Core/Error/exceptions.dart';
import 'package:Ijakhdem/Features/PostJob/Data/Datasource/postJobRemoteDatasource.dart';
import 'package:http/http.dart' as http;
import 'package:Ijakhdem/Features/Signin/Domain/Entities/profileEntity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PostJobRemoteDataSourceImpl implements PostJobRemoteDataSource {
  final http.Client client;

  PostJobRemoteDataSourceImpl({@required this.client});

  @override
  Future<Profile> postJob(Profile profile) async {
    final String idUser = profile.parameters.idUser;
    final String idSession = profile.parameters.idSession;

    final response = await http.get(
      "https://foundme-dev.hotline.direct/logout?id_user=$idUser",
      headers: {
        'Content-Type': 'application/json',
        'idSession': idSession,
      },
    );

    if (response.statusCode == 200) {
      final message = json.decode(response.body)['message'];

      return profile;
    } else if (response.statusCode != 200) {
      // final message = 'An error occured';
      return profile;
    } else {
      throw ServerExeption();
    }
  }
}
