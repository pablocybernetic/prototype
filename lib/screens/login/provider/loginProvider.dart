import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_core/firebase_core.dart'; // Import the Firebase Core package.

bool pass = false;

class LoginProvider extends ChangeNotifier {
  bool value = false;

  final formKey = GlobalKey<FormState>();
  TextEditingController login_email = TextEditingController();
  TextEditingController login_password = TextEditingController();

  void change_checkbox(newValue) {
    value = newValue;
    notifyListeners();
  }

  void change_pass(newValue) {
    pass = newValue;
    pass = !pass;
    notifyListeners();
  }

  Future<UserCredential> signInWithGoogle() async {
    // Initialize Firebase
    await Firebase.initializeApp();

    // Configure Google Sign In
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;
    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Sign in to Firebase with Google credentials
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
