import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:recipe_food_app/auth/auth_result.dart';
import 'package:recipe_food_app/constants/constanst.dart';
import 'package:recipe_food_app/typdef/typdef.dart';

class Authenticator {
  const Authenticator();

  UserId? get userId => FirebaseAuth.instance.currentUser?.uid;

  //if userId == null then user has not been log in
  bool get isAlreadyLoggedIn => userId != null;

  String get displayName =>
      FirebaseAuth.instance.currentUser?.displayName ?? '';

  String? get email => FirebaseAuth.instance.currentUser?.email;

  //log out
  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
    // await FacebookAuth.instance.logOut();
  }

  //log in with facebook
  // Future<AuthResult> loginWithFacebook() async {
  //   final loginResult = await FacebookAuth.instance.login();
  //   final token = loginResult.accessToken?.token;
  //
  //   if (token == null) {
  //     return AuthResult.aborted;
  //   }
  //   final oauthCredentials = FacebookAuthProvider.credential(token);
  //
  //   try {
  //     await FirebaseAuth.instance.signInWithCredential(oauthCredentials);
  //     return AuthResult.success;
  //   } on FirebaseAuthException catch (e) {
  //     final email = e.email;
  //     final credential = e.credential;
  //     if (e.code == Constants.accountExistsWithDifferentCredential &&
  //         email != null &&
  //         credential != null) {
  //       final providers =
  //       await FirebaseAuth.instance.fetchSignInMethodsForEmail(
  //         email,
  //       );
  //       if (providers.contains(Constants.googleCom)) {
  //         await loginWithGoogle();
  //         FirebaseAuth.instance.currentUser?.linkWithCredential(
  //           credential,
  //         );
  //       }
  //       return AuthResult.success;
  //     }
  //     return AuthResult.failure;
  //   }
  // }

  Future<AuthResult> loginWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn(scopes: [
      emailScope,
    ]);

    final signInAccount = await googleSignIn.signIn();
    if (signInAccount == null) {
      print('AuthResult: ${AuthResult.aborted}');
      return AuthResult.aborted;
    }
    final googleAuth = await signInAccount.authentication;
    final oauthCredentials = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    try {
      await FirebaseAuth.instance.signInWithCredential(
        oauthCredentials,
      );
      return AuthResult.success;
    } catch (e) {
      return AuthResult.failure;
    }
  }
}
