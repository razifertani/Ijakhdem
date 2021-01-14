// import 'dart:convert';
import 'package:Ijakhdem/Features/Signin/Domain/Entities/profileEntity.dart';
// import 'package:http/http.dart' as http;

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_facebook_login/flutter_facebook_login.dart';
// import 'package:google_sign_in/google_sign_in.dart';

class SocialMediaService {
  // final FirebaseAuth auth = FirebaseAuth.instance;
  // final GoogleSignIn googleSignIn = GoogleSignIn();
  // final FacebookLogin facebookSignIn = FacebookLogin();

  Future<Profile> signInWithGoogle() async {
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

  Future<Profile> loginWithFB() async {
    // final result = await facebookSignIn.logIn(['email']);
    Profile profile = Profile();
    // if (result.status == FacebookLoginStatus.loggedIn) {
    //   final token = result.accessToken.token;
    //   final response = await http.get(
    //       'https://graph.facebook.com/v2.12/me?fields=name,picture,email&access_token=$token');

    //   profile.userGeneralInfo.firstName = json.decode(response.body)['name'];
    //   profile.userGeneralInfo.lastName = '';
    //   profile.userGeneralInfo.mail = json.decode(response.body)['email'];
    //   profile.userGeneralInfo.type = 'Facebook';

    return profile;
    // } else {
    //   throw ServerExeption();
  }
}
