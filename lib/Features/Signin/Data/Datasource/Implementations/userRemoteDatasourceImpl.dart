import 'dart:convert';
import 'dart:io';
import 'package:Ijakhdem/Core/Error/exceptions.dart';
import 'package:Ijakhdem/Core/Utils/parameters.dart';
import 'package:Ijakhdem/Features/Signin/Data/Datasource/Implementations/socialMediaService.dart';
import 'package:Ijakhdem/Features/Signin/Data/Datasource/userRemoteDatasource.dart';
import 'package:Ijakhdem/Features/Signin/Domain/Entities/profileEntity.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mercury_client/mercury_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final http.Client client;

  UserRemoteDataSourceImpl({@required this.client});

  @override
  Future<Profile> login(LoginParams loginParams) async {
    print('Start: ' + DateTime.now().toString());
    // String idUser, idLanguage, idSession;

    final loginResponse = await http.get(
      'http://92.222.181.118/email_sign_in?&mail=${loginParams.email}&password=${loginParams.password}',
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (loginResponse.statusCode == 200) {
      String idUser = json.decode(loginResponse.body)['id_user'];
      String idSession = json.decode(loginResponse.body)['idSession'];

      final viewResponse = await http.get(
        "http://92.222.181.118/view_user?id_user=$idUser",
        headers: {
          'Content-Type': 'application/json',
          'idSession': idSession,
        },
      );
      if (viewResponse.statusCode == 200) {
        Profile profile = Profile.fromJson(json.decode(viewResponse.body));
        profile.parameters = Parameters(
          idUser: idUser,
          idSession: idSession,
          current: 0,
        );
        // profile.generalInfo.type = 'Email';
        print(profile.parameters.idUser);

        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setBool("stayConnected", true);
        // prefs.setBool("stayConnected", false);
        prefs.setString("email", loginParams.email);
        prefs.setString("password", loginParams.password);

        print('End: ' + DateTime.now().toString());
        return profile;
      } else if (viewResponse.statusCode == 401) {
        final profile = Profile(
          parameters: Parameters(
            message: 'Session expired',
          ),
        );
        return profile;
      } else {
        throw ServerExeption();
      }
    } else if (loginResponse.statusCode == 406 ||
        loginResponse.statusCode == 403) {
      final profile = Profile(
        parameters: Parameters(
          message: json.decode(loginResponse.body)['message'],
        ),
      );
      return profile;
    } else {
      throw ServerExeption();
    }
  }

  @override
  Future<Profile> loginGoogle(String test) async {
    Profile profile = await SocialMediaService().signInWithGoogle();
    return profile;
  }

  @override
  Future<Profile> loginFacebook(String test) async {
    Profile profile = await SocialMediaService().loginWithFB();
    return profile;
  }

  @override
  Future<String> register(RegisterParams registerParams) async {
    final response = await http.get(
      "http://92.222.181.118/email_sign_up?first_name=${registerParams.firstName}&last_name=${registerParams.lastName}&email=${registerParams.email}&pwd=${registerParams.password}",
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 201) {
      final message = json.decode(response.body)['message'];
      return message;
    } else if (response.statusCode == 400 ||
        response.statusCode == 402 ||
        response.statusCode == 404 ||
        response.statusCode == 406 ||
        response.statusCode == 500) {
      final message = json.decode(response.body)['message'];
      return message;
    } else {
      throw ServerExeption();
    }
  }

  @override
  Future<String> forgotPassword(String email) async {
    final response = await http.get(
      "https://ws.interface-crm.com:444/send_link_restore_pwd?mail=$email",
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 201) {
      final message = json.decode(response.body)['message'];
      return message;
    } else if (response.statusCode == 400 ||
        response.statusCode == 402 ||
        response.statusCode == 404 ||
        response.statusCode == 406 ||
        response.statusCode == 500) {
      final message = json.decode(response.body)['message'];
      return message;
    } else {
      throw ServerExeption();
    }
  }
}
