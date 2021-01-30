// import 'dart:convert';
import 'dart:convert';

import 'package:Ijakhdem/Features/Signin/Domain/Entities/profileEntity.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:http/http.dart' as http;

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';

class SocialMediaService {
  // final FirebaseAuth auth = FirebaseAuth.instance;
  // final GoogleSignIn googleSignIn = GoogleSignIn();
  // FirebaseUser firebaseUser;
  // final FacebookLogin facebookSignIn = FacebookLogin();

  Future<Profile> signInWithGoogle() async {
    try {
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

  Future<Profile> loginWithFB(FacebookAccessToken accessToken) async {
    final graphResponse = await http.get(
        'https://graph.facebook.com/v8.0/me?fields=id,birthday,name,first_name,last_name,email,picture.width(640),location{location{country,city,longitude,latitude}}&access_token=${accessToken.token}');
    // print(json.decode(graphResponse.body)['birthday']);
    GeneralInfo generalInfo = new GeneralInfo(
        email: json.decode(graphResponse.body)['email'],
        firstName: json.decode(graphResponse.body)['first_name'],
        lastName: json.decode(graphResponse.body)['last_name'],
        profilePicUrl: json.decode(graphResponse.body)['picture']['data']
            ['url']);
    Profile profile = new Profile(
        generalInfo: generalInfo, parameters: Parameters(current: 0));
    return profile;

    // final result = await facebookSignIn.logIn(['email']);
    // Profile profile = Profile();
    // if (result.status == FacebookLoginStatus.loggedIn) {
    //   final token = result.accessToken.token;
    //   final response = await http.get(
    //       'https://graph.facebook.com/v2.12/me?fields=name,picture,email&access_token=$token');

    //   profile.userGeneralInfo.firstName = json.decode(response.body)['name'];
    //   profile.userGeneralInfo.lastName = '';
    //   profile.userGeneralInfo.mail = json.decode(response.body)['email'];
    //   profile.userGeneralInfo.type = 'Facebook';

    // return profile;
    // } else {
    //   throw ServerExeption();
  }
}
// loginMiddleWare({FacebookAccessToken accessToken}) async {
//   // final token = result.accessToken.token;
//   ///calling graphFacebook to get data
//   final graphResponse = await http.get(
//       'https://graph.facebook.com/v8.0/me?fields=id,birthday,name,first_name,last_name,email,picture.width(640),location{location{country,city,longitude,latitude}}&access_token=${accessToken.token}');
//   print(json.decode(graphResponse.body)['birthday']);
//
//   ///appending data to currentUser
//   // print(graphResponse.body);
//   // this.currentUser.value =
//   // new User.fromJsonFb(json.decode(graphResponse.body));
//
//   ///appending token to user in case for future calls
//
//   // this.currentUser.value.social = "facebook";
//   //
//   // await apiRequest(
//   //     'http://192.168.1.4:3000/workers/create', this.currentUser.toJson())
//   //     .then((value) {
//   //   this.currentUser.value.authToken.value = json.decode(value)['token'];
//   //   print(value.toString());
//   // }).then((value) {
//   //   this.connectSocket();
//   // });
// }
