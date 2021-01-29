import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:Ijakhdem/Core/Error/exceptions.dart';
import 'package:Ijakhdem/Core/Utils/parameters.dart';
import 'package:Ijakhdem/Features/Profile/Data/Datasource/profileRemoteDatasource.dart';
import 'package:http/http.dart' as http;
import 'package:Ijakhdem/Features/Signin/Domain/Entities/profileEntity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final http.Client client;

  ProfileRemoteDataSourceImpl({@required this.client});

  @override
  Future<Profile> resetPassword(ResetPasswordParams resetPasswordParams) async {
    // Profile profile = resetPasswordParams.profile;
    // String idUser = resetPasswordParams.profile.userGeneralInfo.idUser;
    // String idSession = resetPasswordParams.profile.userGeneralInfo.idSession;
    // String oldPassword = resetPasswordParams.oldPassword;
    // String newPassword = resetPasswordParams.newPassword;

    // final response = await http.get(
    //   "https://ws.interface-crm.com:444/update_password?id_user=$idUser&current_password=$oldPassword&new_password=$newPassword",
    //   headers: {
    //     'Content-Type': 'application/json',
    //     'idSession': idSession,
    //   },
    // );

    // if (response.statusCode == 202) {
    //   profile.userGeneralInfo.message = json.decode(response.body)['message'];
    //   return profile;
    // } else if (response.statusCode != 202) {
    //   profile.userGeneralInfo.message = json.decode(response.body)['message'];
    //   return profile;
    // } else {
    //   throw ServerExeption();
    // }
  }

  @override
  Future<String> logout(Profile profile) async {
    final String idUser = profile.parameters.idUser;
    final String idSession = profile.parameters.idSession;

    final response = await http.get(
      "http://92.222.181.118/logout?id_user=$idUser",
      headers: {
        'Content-Type': 'application/json',
        'idSession': idSession,
      },
    );

    if (response.statusCode == 202) {
      final message = json.decode(response.body)['message'];

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool("stayConnected", false);

      return message;
    } else if (response.statusCode != 200) {
      final message = 'An error occured';
      return message;
    } else {
      throw ServerExeption();
    }
  }
}
