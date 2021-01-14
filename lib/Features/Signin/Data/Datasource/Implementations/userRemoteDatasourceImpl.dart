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

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final http.Client client;

  UserRemoteDataSourceImpl({@required this.client});

  @override
  Future<Profile> login(LoginParams loginParams) async {
    print('Start: ' + DateTime.now().toString());
    // String idUser, idLanguage, idSession;

    var client = HttpClient('https://foundme-dev.hotline.direct');

    var loginResponse = await client.get('email_sign_in?', parameters: {
      'mail': loginParams.email,
      'password': loginParams.password,
    });

    if (loginResponse.status == 200) {
      //   print('end login: ' + DateTime.now().toString());

      //   idUser = json.decode(loginResponse.body)['id_user'];
      //   idLanguage = json.decode(loginResponse.body)['id_language'];
      //   idSession = 'test';

      //   final viewResponse = await http.get(
      //     "https://foundme-dev.hotline.direct/view_user?id_user=$idUser",
      //     headers: {
      //       'Content-Type': 'application/json',
      //       'idSession': idSession,
      //     },
      //   );
      //   if (viewResponse.statusCode == 200) {
      //     Profile profile;
      //     // final profile = Profile.fromJson(json.decode(viewResponse.body));
      //     // print(profile.userGeneralInfo.idUser);
      //     // profile.userGeneralInfo.idUser = idUser;
      //     // profile.userGeneralInfo.idSession = idSession;
      //     // profile.userGeneralInfo.type = 'Email';
      //     // profile.parameters = Parameters();

      //     // final responseFetchApiKey = await http.get(
      //     //   'https://foundme-dev.hotline.direct/fetch_api_key?username=${loginParams.email}&password=${loginParams.password}',
      //     //   headers: {
      //     //     'Content-Type': 'application/json',
      //     //     'idSession': idSession,
      //     //   },
      //     // );

      //     // if (responseFetchApiKey.statusCode == 200) {
      //     //   profile.userGeneralInfo.apiKey =
      //     //       json.decode(responseFetchApiKey.body)['api_key'];
      //     // }

      //     SharedPreferences prefs = await SharedPreferences.getInstance();
      //     prefs.setBool("stayConnected", true);
      //     prefs.setString("email", loginParams.email);
      //     prefs.setString("password", loginParams.password);

      //     print('End: ' + DateTime.now().toString());
      //     return profile;
      //   } else if (viewResponse.statusCode == 401) {
      //     final profile = Profile(
      //         //   userGeneralInfo: UserGeneralInfo(idUser: 'Session expired'),
      //         );
      //     return profile;
      //   } else {
      //     throw ServerExeption();
      //   }
      // } else if (loginResponse.status == 403) {
      //   if (json.decode(loginResponse.body)['message'] == 'User does not exist') {
      //     final profile = Profile(
      //         //   userGeneralInfo: UserGeneralInfo(idUser: 'User does not exist'),
      //         );
      //     return profile;
      //   }
      //   if (json.decode(loginResponse.body)['message'] == 'Wrong password') {
      //     final profile = Profile(
      //         // userGeneralInfo: UserGeneralInfo(idUser: 'Wrong password'),
      //         );
      //     return profile;
      //   }
      //   if (json.decode(loginResponse.body)['message'] ==
      //       'You cannot process login until you activate your account') {
      //     final profile = Profile(
      //         // userGeneralInfo: UserGeneralInfo(
      //         //     idUser:
      //         //         'You cannot process login until you activate your account'),
      //         );
      //     return profile;
      //   }
      //   final profile = Profile(
      //       // userGeneralInfo: UserGeneralInfo(idUser: 'Login issues'),
      //       );
      //   return profile;
      // } else {
      //   throw ServerExeption();
    }
    return Profile();
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
      "https://ws.interface-crm.com:444/email_sign_up?first_name=${registerParams.firstName}&last_name=${registerParams.lastName}&password=${registerParams.password}&confirm_email=true&primary_email=${registerParams.email}",
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
