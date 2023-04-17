import 'package:prototype/screens/intro/provider/introProvider.dart';
import 'package:prototype/screens/login/view/loginPage.dart';
import 'package:prototype/screens/registration/view/registrationPage.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  IntroProvider? providerTrue;
  IntroProvider? providerFalse;

  @override
  Widget build(BuildContext context) {
    providerTrue = Provider.of<IntroProvider>(context, listen: true);
    providerFalse = Provider.of<IntroProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        body: IntroductionScreen(
          showDoneButton: true,
          onDone: () async {
            providerFalse!.introPageShar();

            // Provider.of<IntroProvider>(context, listen: true)
            //     .readIntroPageShar();
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginPage(),
              ),
            );
            // if (providerTrue!.intro == false) {
            //   Navigator.pushReplacement(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => const LoginPage(),
            //     ),
            //   );
            // }

            //  else {
            //   Navigator.pushReplacement(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => const LoginPage(),
            //     ),
            //   );
            // }
            // providerFalse!.introPageShar();
          },
          done: Text("done"),
          showNextButton: true,
          next: Text("next"),
          skip: Text("skip"),
          showSkipButton: true,
          pages: [
            PageViewModel(
              image: Center(
                child: Lottie.asset(
                  'assets/animation/1.json',
                  repeat: true,
                  reverse: false,
                ),
              ),
              body:
                  "Discover your favorite celebrities' latest content across all platforms with CelebLinkz.",
              title: "Sign Up",
            ),
            PageViewModel(
              image: Center(
                child: Lottie.asset(
                  'assets/animation/2.json',
                  repeat: true,
                  reverse: false,
                ),
              ),
              body:
                  "Stay up-to-date with your favorite celebrities' latest content across all platforms with FameFrame.",
              title: "Sign in",
            ),
            PageViewModel(
              image: Center(
                child: Lottie.asset(
                  'assets/animation/3.json',
                  repeat: true,
                  reverse: false,
                ),
              ),
              body:
                  "Why are you waiting..Get the latest updates on your favorite celebrities' content across all platforms with StarLinkz.",
              title: "Go",
            ),
          ],
        ),
      ),
    );
  }
}
