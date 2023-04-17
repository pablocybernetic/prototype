import 'package:prototype/screens/changePassword/provider/changeProvider.dart';
import 'package:prototype/screens/login/view/loginPage.dart';
import 'package:prototype/utility/constant.dart';
import 'package:prototype/utility/login_reg_changePass/changePasswordUtility.dart';
import 'package:prototype/utility/sharePreference.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  ChangePasswordProvider? providerTrue;
  ChangePasswordProvider? providerFalse;

  @override
  Widget build(BuildContext context) {
    providerTrue = Provider.of<ChangePasswordProvider>(context, listen: true);
    providerFalse = Provider.of<ChangePasswordProvider>(context, listen: false);

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
                            "Change Password",
                            style: GoogleFonts.acme(
                                letterSpacing: .5,
                                fontSize: 23,
                                color: Style.black),
                          ),
                          hSize(),
                          change_pass('Enter Old Password',
                              providerFalse!.change_password),
                          hSize(),
                          change_new_pass("Enter New Password",
                              providerFalse!.change_new_pass),
                          hSize(),
                          change_new_pass("Re Enter New Password",
                              providerFalse!.change_re_new_pass),
                          hSize(),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 19),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height / 14.7,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                onPressed: () async {
                                  final prefs =
                                      await SharedPreferences.getInstance();

                                  var change_password_getData =
                                      prefs.getString('password');
                                  // print(change_password);

                                  if (providerTrue!.formKey.currentState!
                                      .validate()) {
                                    if (providerTrue!.change_password.text !=
                                        change_password_getData) {
                                      // print(
                                      //     "${providerTrue!.change_new_pass.text}");
                                      Fluttertoast.showToast(
                                          msg: "Old Password Not Same",
                                          toastLength: Toast.LENGTH_SHORT,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Style.black,
                                          textColor: Style.white,
                                          fontSize: 14.0);
                                    } else if (providerTrue!
                                            .change_new_pass.text !=
                                        providerTrue!.change_re_new_pass.text) {
                                      // print(
                                      //     "${providerTrue!.change_new_pass.text}");
                                      // print(
                                      //     "${providerTrue!.change_re_new_pass.text}");

                                      Fluttertoast.showToast(
                                          msg:
                                              "New Password And New Re Password Are Not Match",
                                          toastLength: Toast.LENGTH_SHORT,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Style.black,
                                          textColor: Style.white,
                                          fontSize: 14.0);
                                    } else if (providerTrue!
                                            .change_password.text ==
                                        providerTrue!.change_new_pass.text) {
                                      Fluttertoast.showToast(
                                          msg:
                                              "Old Password And New Password Are Same",
                                          toastLength: Toast.LENGTH_SHORT,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Style.black,
                                          textColor: Style.white,
                                          fontSize: 14.0);
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          duration: Duration(seconds: 2),
                                          content: Text("Password Changed !!"),
                                        ),
                                      );

                                      change_password_getData =
                                          providerTrue!.change_new_pass.text;
                                      print(change_password_getData);
                                      prefs.setString(
                                          'password', change_password_getData);

                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => LoginPage(),
                                        ),
                                      );
                                    }

                                    // Navigator.pushReplacement(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //     builder: (context) => HomePage(),
                                    //   ),
                                    // );
                                  }

                                  // else if (providerTrue!.login_email.text !=
                                  //     email) {
                                  //   Fluttertoast.showToast(
                                  //       msg: "Email Id Not Same",
                                  //       toastLength: Toast.LENGTH_SHORT,
                                  //       timeInSecForIosWeb: 1,
                                  //       backgroundColor: Style.white,
                                  //       textColor: Style.black,
                                  //       fontSize: 14.0);
                                  // } else if (providerTrue!.login_password.text !=
                                  //     password) {
                                  //   Fluttertoast.showToast(
                                  //       msg: "Password Not Same",
                                  //       toastLength: Toast.LENGTH_SHORT,
                                  //       timeInSecForIosWeb: 1,
                                  //       backgroundColor: Style.white,
                                  //       textColor: Style.black,
                                  //       fontSize: 14.0);
                                  // } else {
                                  //   Navigator.pushReplacement(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //       builder: (context) => HomePage(),
                                  //     ),
                                  //   );
                                  // }

                                  //  else if (providerTrue!.formKey.currentState!
                                  //     .validate()) {
                                  //   Navigator.pushReplacement(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //       builder: (context) => RegistrationPage(),
                                  //     ),
                                  //   );
                                  // }
                                },
                                child: Text(
                                  "Login",
                                  style: TextStyle(fontSize: 19),
                                ),
                              ),
                            ),
                          ),
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
