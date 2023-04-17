import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prototype/screens/changePassword/provider/changeProvider.dart';
import 'package:prototype/screens/changePassword/view/changePasswordPage.dart';
import 'package:prototype/screens/home/view/homePage.dart';
import 'package:prototype/screens/registration/view/registrationPage.dart';
import 'package:prototype/utility/constant.dart';
import 'package:prototype/utility/login_reg_changePass/loginUtility.dart';
import 'package:prototype/utility/sharePreference.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
import '../provider/loginProvider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLoading = false;
  LoginProvider? providerTrue;
  LoginProvider? providerFalse;

  @override
  void initState() {
    super.initState();
    // Initialize Firebase Authentication
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        // If the user is already logged in, navigate to the home page
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      }
    });
  }

  Future<void> _login() async {
    // Validate the form input
    if (!providerFalse!.formKey.currentState!.validate()) {
      return;
    }

    // Show a loading indicator
    setState(() {
      _isLoading = true;
    });

    try {
      // Sign in with email and password
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: providerFalse!.login_email.text.trim(),
              password: providerFalse!.login_password.text.trim());

      // Hide the loading indicator
      setState(() {
        _isLoading = false;
      });

      // Save the user data in shared preferences

      final prefs = await SharedPreferences.getInstance();
      prefs.setBool('login', true);

      // Navigate to the home page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } on FirebaseAuthException catch (e) {
      // Hide the loading indicator
      setState(() {
        _isLoading = false;
      });

      // Show an error message
      if (e.code == 'user-not-found') {
        Fluttertoast.showToast(msg: 'User not found.');
      } else if (e.code == 'wrong-password') {
        Fluttertoast.showToast(msg: 'Wrong password.');
      } else {
        Fluttertoast.showToast(msg: 'Login failed. Please try again.');
      }
    } catch (e) {
      // Hide the loading indicator
      setState(() {
        _isLoading = false;
      });

      // Show an error message
      Fluttertoast.showToast(msg: 'Login failed. Please try again.');
    }
  }

  @override
  Widget build(BuildContext context) {
    providerTrue = Provider.of<LoginProvider>(context, listen: true);
    providerFalse = Provider.of<LoginProvider>(context, listen: false);

    return SafeArea(
      child: Scaffold(
        body: Form(
          key: providerFalse!.formKey,
          child: SingleChildScrollView(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    color: Style.darkBlue),
                Center(
                  child: Container(
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height / 1.5,
                    width: MediaQuery.of(context).size.width / 1.1,
                    decoration: BoxDecoration(
                      color: Style.white,
                      borderRadius: BorderRadius.circular(22),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 20, right: 8, left: 8),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 45,
                            child: Icon(
                              Icons.person,
                              size: 65,
                            ),
                          ),
                          hSize(),
                          Text(
                            "Login",
                            style: GoogleFonts.acme(
                                letterSpacing: .5,
                                fontSize: 23,
                                color: Style.black),
                          ),
                          hSize(),
                          customTextEditingController(
                              'Enter Email id',
                              Icon(
                                Icons.email,
                                color: Style.grey,
                              ),
                              providerFalse!.login_email),
                          hSize(),
                          TextFormField(
                            controller: providerFalse!.login_password,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "PLease Enter Your Password";
                              }
                              if (!RegExp(
                                      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                                  .hasMatch(value)) {
                                return "Please enter a valid Password";
                              } else {
                                return null;
                              }
                            },
                            obscureText: (pass == false) ? true : false,
                            style: TextStyle(color: Style.black),
                            decoration: InputDecoration(
                              hintText: 'Enter Password',
                              hintStyle: TextStyle(color: Style.grey),
                              prefixIcon: IconButton(
                                onPressed: () {
                                  providerTrue!.change_pass(pass);
                                },
                                icon: Icon(
                                  (pass == true) ? Icons.lock_open : Icons.lock,
                                  color: Style.grey,
                                ),
                              ),

                              // Icon(
                              //   Icons.lock,
                              //   color: Style.grey,
                              // ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Style.grey),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              border: new OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                                borderSide: new BorderSide(color: Style.grey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                                borderSide:
                                    BorderSide(width: 1, color: Style.white),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Checkbox(
                                activeColor: Style.white,
                                // autofocus: true,
                                focusColor: Style.white,
                                checkColor: Style.black,
                                value: providerFalse!.value,
                                side: MaterialStateBorderSide.resolveWith(
                                  (Set<MaterialState> states) {
                                    if (states
                                        .contains(MaterialState.selected)) {
                                      return const BorderSide(
                                          width: 2, color: Colors.grey);
                                    }
                                    return const BorderSide(
                                        width: 1, color: Colors.grey);
                                  },
                                ),
                                onChanged: (newValue) {
                                  providerFalse!.change_checkbox(newValue);
                                },
                              ),
                              Text(
                                "Remember me",
                                style: TextStyle(color: Style.grey),
                              ),
                              Spacer(),
                              TextButton(
                                onPressed: () {
                                  Provider.of<ChangePasswordProvider>(context,
                                          listen: false)
                                      .change_new_pass
                                      .clear();
                                  Provider.of<ChangePasswordProvider>(context,
                                          listen: false)
                                      .change_password
                                      .clear();
                                  Provider.of<ChangePasswordProvider>(context,
                                          listen: false)
                                      .change_re_new_pass
                                      .clear();

                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ChangePasswordPage(),
                                    ),
                                  );
                                },
                                child: Text("Change Password"),
                              ),
                            ],
                          ),
                          hSize(),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 19),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width / 1.5,
                              height: MediaQuery.of(context).size.height / 24.7,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                onPressed: () async {
                                  String? email = await readEmail();
                                  String? password = await readPassword();

                                  if (providerTrue!.formKey.currentState!
                                      .validate()) {
                                    if (providerTrue!.login_email.text !=
                                        email) {
                                      Fluttertoast.showToast(
                                          msg: "Email Id Not Same",
                                          toastLength: Toast.LENGTH_SHORT,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Style.black,
                                          textColor: Style.white,
                                          fontSize: 14.0);
                                    } else if (providerTrue!
                                            .login_password.text !=
                                        password) {
                                      Fluttertoast.showToast(
                                          msg: "Password Not Same",
                                          toastLength: Toast.LENGTH_SHORT,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Style.black,
                                          textColor: Style.white,
                                          fontSize: 14.0);
                                    } else {
                                      _login();
                                      bool? checkLogin = await loginCheck();
                                      print(checkLogin);
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => HomePage(),
                                        ),
                                      );
                                    }
                                  }
                                },
                                child: Text(
                                  "Login",
                                  style: TextStyle(fontSize: 19),
                                ),
                              ),
                            ),
                          ),
                          hSize(),
                          hSize(),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 19),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width / 1.5,
                              height: MediaQuery.of(context).size.height / 24.7,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                onPressed: () async {
                                  await signInWithGoogle(context);
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/images/google.png', // replace with your own asset image path
                                      height: 24,
                                      width: 24,
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      "Continue with Google",
                                      style: TextStyle(fontSize: 19),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          hSize(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Have Not Account Yet?",
                                style:
                                    TextStyle(color: Style.black, fontSize: 15),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const RegistrationPage(),
                                    ),
                                  );
                                },
                                child: Text("Create Account"),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<UserCredential> signInWithGoogle(BuildContext context) async {
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
    final UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);

    // Navigate to the home page if the user is signed in
    if (userCredential.user != null) {
      final prefs = await SharedPreferences.getInstance();
      prefs.setBool('login', true);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    }

    return userCredential;
  }
}
