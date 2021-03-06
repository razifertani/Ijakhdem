// import 'dart:convert';
import 'dart:convert';

import 'package:Ijakhdem/Core/Error/exceptions.dart';
import 'package:Ijakhdem/Features/Signin/Domain/Entities/profileEntity.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';

class SocialMediaService {
  // final FirebaseAuth auth = FirebaseAuth.instance;
  // final GoogleSignIn googleSignIn = GoogleSignIn();
  // FirebaseUser firebaseUser;
  final FacebookLogin facebookSignIn = FacebookLogin();

  Future<Profile> signInWithGoogle() async {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: <String>[
        'email',
        'https://www.googleapis.com/auth/userinfo.profile'
      ],
    );

    // this.currentUser.value = User.fr
    // print(_googleSignIn.currentUser.);
    ///appending data to currentUser
    // print(graphResponse.body);

    try {
      await _googleSignIn.signOut();
      final GoogleSignInAccount googleSignInAccount =
          await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      print(googleSignInAuthentication.accessToken); // New refreshed token
      // print(_googleSignIn.currentUser.email);
      // print(_googleSignIn.currentUser.photoUrl);
      // print(_googleSignIn.currentUser.displayName);
      var response_google = await http.get(
          'https://www.googleapis.com/oauth2/v1/userinfo?alt=json',
          headers: {
            'Authorization': 'Bearer ' + googleSignInAuthentication.accessToken
          });
      GeneralInfo generalInfo = new GeneralInfo(
          email: json.decode(response_google.body)['email'],
          firstName: json.decode(response_google.body)['given_name'] ?? 'none',
          lastName: json.decode(response_google.body)['family_name'] ?? 'none',
          profilePicUrl: json.decode(response_google.body)['picture']);
      Profile profile = new Profile(
          generalInfo: generalInfo, parameters: Parameters(current: 0));
      return profile;
      //     json["given_name"] ?? '',
      // json["family_name"] ?? '',
      // json["email"],
      // null,
      // null,
      // json["picture"],
      // 'not specefied',
      // id: json["id"],
      // dob: json["birthday"],
      // GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
      // GoogleSignInAuthentication googleSignInAuthentication =
      //     await googleSignInAccount.authentication;
      // AuthCredential credential = GoogleAuthProvider.getCredential(
      //   accessToken: googleSignInAuthentication.accessToken,
      //   idToken: googleSignInAuthentication.idToken,
      // );
    } catch (e) {
      print(e.toString());
    }

    // AuthResult authResult; // = await auth.signInWithCredential(credential);
    // firebaseUser = authResult.user;
    // assert(!firebaseUser.isAnonymous);
    // assert(await firebaseUser.getIdToken() != null);
    // FirebaseUser currentUser = await auth.currentUser();
    // assert(firebaseUser.uid == currentUser.uid);
    // // model.state =ViewState.Idle;
    // print("User Name: ${firebaseUser.displayName}");
    // print("User Email ${firebaseUser.email}");

    // final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    // final GoogleSignInAuthentication googleSignInAuthentication =
    //     await googleSignInAccount.authentication;

    // final AuthCredential credential = GoogleAuthProvider.getCredential(
    //   accessToken: googleSignInAuthentication.accessToken,
    //   idToken: googleSignInAuthentication.idToken,
    // );

    // final AuthResult authResult = await auth.signInWithCredential(credential);
    // final FirebaseUser user = authResult.user;
    // assert(!user.isAnonymous);
    // assert(await user.getIdToken() != null);

    // final FirebaseUser currentUser = await auth.currentUser();
    // assert(user.uid == currentUser.uid);

    // Profile profile = Profile();
    // profile.userGeneralInfo.firstName = user.displayName;
    // profile.userGeneralInfo.lastName = '';
    // profile.userGeneralInfo.mail = user.email;
    // user.phoneNumber != null
    //     ? profile.userGeneralInfo.tel = user.phoneNumber
    //     : profile.userGeneralInfo.tel = 'Nan';
    // profile.userGeneralInfo.type = 'Google';

    Profile profile = Profile();
    return profile;
  }

  void signOutGoogle() async {
    // await googleSignIn.signOut();
  }

  Future<Profile> loginWithFB(String token) async {
    if (token == '') {
      final FacebookLoginResult result = await facebookSignIn.logIn(['email']);

      switch (result.status) {
        case FacebookLoginStatus.loggedIn:
          final FacebookAccessToken accessToken = result.accessToken;
          token = accessToken.token;
          break;
        case FacebookLoginStatus.cancelledByUser:
          throw ErrorLoggingInException();
          break;
        case FacebookLoginStatus.error:
          throw ServerExeption();
          break;
      }
    } else {
      final graphResponse = await http.get(
        'https://graph.facebook.com/v8.0/me?fields=id,birthday,name,first_name,last_name,email,picture.width(640),location{location{country,city,longitude,latitude}}&access_token=$token',
      );

      Profile profile = Profile(
        generalInfo: GeneralInfo(
          // print(json.decode(graphResponse.body)['birthday']);
          email: json.decode(graphResponse.body)['email'],
          firstName: json.decode(graphResponse.body)['first_name'],
          lastName: json.decode(graphResponse.body)['last_name'],
          profilePicUrl: json.decode(graphResponse.body)['picture']['data']
              ['url'],
        ),
        parameters: Parameters(
          current: 0,
          connexionType: 'Facebook',
        ),
      );

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool("stayConnected", true);
      prefs.setBool("facebook", true);
      prefs.setString("token", token);

      return profile;
    }
  }
}
