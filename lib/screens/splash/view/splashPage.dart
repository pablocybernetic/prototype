import 'dart:async';

import 'package:prototype/screens/home/view/homePage.dart';
import 'package:prototype/screens/intro/provider/introProvider.dart';
import 'package:prototype/screens/intro/view/introPage.dart';
import 'package:prototype/screens/login/view/loginPage.dart';
import 'package:prototype/screens/registration/view/registrationPage.dart';
import 'package:prototype/utility/constant.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:prototype/utility/sharePreference.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  IntroProvider? providerTrue;
  IntroProvider? providerFalse;

  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 2),
      () async {
        bool? check = await providerTrue!.readIntroPageShar();

        bool? checkLogin = await loginCheck();

        if (check == true) {
          if (checkLogin == true) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ),
            );
          } else {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => LoginPage(),
              ),
            );
          }
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => IntroPage(),
            ),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    providerTrue = Provider.of<IntroProvider>(context, listen: true);
    providerFalse = Provider.of<IntroProvider>(context, listen: false);
    return WillPopScope(
      onWillPop: () async {
        // Exit the app
        return true;
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Style.white,
          body: Center(
            child: Lottie.asset(
              'assets/animation/4.json',
              repeat: true,
              reverse: false,
            ),
          ),
        ),
      ),
    );
  }
}
