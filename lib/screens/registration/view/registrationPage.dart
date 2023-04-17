import 'package:prototype/screens/home/view/homePage.dart';
import 'package:prototype/screens/login/view/loginPage.dart';
import 'package:prototype/screens/registration/provider/registrationProvider.dart';
import 'package:prototype/utility/constant.dart';
import 'package:prototype/utility/login_reg_changePass/RegistrationUtility.dart';
import 'package:prototype/utility/login_reg_changePass/loginUtility.dart';
import 'package:prototype/utility/sharePreference.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  RegistrationProvider? providerTrue;
  RegistrationProvider? providerFalse;
  @override
  Widget build(BuildContext context) {
    providerTrue = Provider.of<RegistrationProvider>(context, listen: true);
    providerFalse = Provider.of<RegistrationProvider>(context, listen: false);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Style.black,
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
                    height: MediaQuery.of(context).size.height / 1.3,
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
                            "Registration",
                            style: GoogleFonts.acme(
                                letterSpacing: .5,
                                fontSize: 23,
                                color: Style.black),
                          ),
                          hSize(),
                          reg_email_textformfield(
                              'Enter Email id',
                              Icon(
                                Icons.email,
                                color: Style.grey,
                              ),
                              providerTrue!.registration_email),
                          hSize(),
                          reg_password_textFormField('Enter Password',
                              providerTrue!.registration_password),
                          hSize(),
                          reg_re_password_textFormField('Enter Re-Password',
                              providerTrue!.registration_re_password),
                          hSize(),
                          reg_phone_number(providerFalse!.phone_num),
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
                                onPressed: () {},
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
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              // ElevatedButton(
                              //   onPressed: () {
                              //     providerTrue!.registration_email.clear();
                              //     providerTrue!.registration_password.clear();
                              //     providerTrue!.registration_re_password
                              //         .clear();
                              //     providerTrue!.phone_num.clear();
                              //   },
                              //   child: Text("Clear Data"),
                              // ),
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
                                  if (providerTrue!.formKey.currentState!
                                      .validate()) {
                                    if (providerTrue!
                                            .registration_password.text !=
                                        providerTrue!
                                            .registration_re_password.text) {
                                      Fluttertoast.showToast(
                                          msg:
                                              "Password and re password are not same",
                                          toastLength: Toast.LENGTH_SHORT,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Style.white,
                                          textColor: Style.black,
                                          fontSize: 14.0);
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          duration: Duration(seconds: 2),
                                          content: Text("Password Changed !!"),
                                        ),
                                      );
                                      save(
                                          providerTrue!.registration_email.text,
                                          providerTrue!
                                              .registration_password.text,
                                          providerTrue!
                                              .registration_re_password.text,
                                          providerTrue!.phone_num.text);
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => LoginPage(),
                                        ),
                                      );
                                    }
                                  }
                                },
                                child: Text(
                                  "Register",
                                  style: TextStyle(fontSize: 19),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Already have an Account?",
                                style:
                                    TextStyle(color: Style.black, fontSize: 15),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const LoginPage(),
                                    ),
                                  );
                                },
                                child: Text("Login Account"),
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
}
