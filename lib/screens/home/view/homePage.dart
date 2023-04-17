import 'package:prototype/screens/login/provider/loginProvider.dart';
import 'package:prototype/screens/login/view/loginPage.dart';
import 'package:prototype/screens/personal_details/gender.dart';
import 'package:prototype/utility/constant.dart';
import 'package:prototype/utility/sharePreference.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../personal_details/dob.dart';
import '../../personal_details/names.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  LoginProvider? providerTrue;
  LoginProvider? providerFalse;
  bool details = false;

  @override
  void initState() {
    super.initState();
    // Load boolean value from SharedPreferences
    loadDetails();
  }

  // Function to load boolean value from SharedPreferences
  void loadDetails() async {
    final prefs = await SharedPreferences.getInstance();
    String? firstName = prefs.getString('firstName');
    setState(() {
      details = firstName != null;
    });
  }

  @override
  Widget build(BuildContext context) {
    providerTrue = Provider.of<LoginProvider>(context, listen: true);
    providerFalse = Provider.of<LoginProvider>(context, listen: false);

    if (details) {
      // Show current UI
      return SafeArea(
        child: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Login successfully",
                  style: GoogleFonts.acme(
                      letterSpacing: .5, fontSize: 30, color: Style.black),
                ),
                hSize(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        clear();
                        providerTrue!.login_email.clear();
                        providerTrue!.login_password.clear();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ),
                        );
                      },
                      child: Text("Clear All Data"),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        final prefs = await SharedPreferences.getInstance();

                        var getCheck = prefs.getBool('login');
                        if (providerTrue!.value == false) {
                          providerTrue!.login_email.clear();
                          providerTrue!.login_password.clear();
                          getCheck = false;
                          prefs.setBool('login', getCheck);

                          var a = loginCheck();
                          print(getCheck);
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ),
                          );
                        } else {
                          getCheck = false;
                          prefs.setBool('login', getCheck);

                          var a = loginCheck();
                          print(getCheck);

                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ),
                          );
                        }
                      },
                      child: Text("Log Out"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      // Show "Hello World" text
      return Names();
    }
  }
}
