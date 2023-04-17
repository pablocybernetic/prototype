import 'package:prototype/screens/changePassword/provider/changeProvider.dart';
import 'package:prototype/screens/changePassword/view/changePasswordPage.dart';
import 'package:prototype/screens/intro/provider/introProvider.dart';
import 'package:prototype/screens/intro/view/introPage.dart';
import 'package:prototype/screens/login/provider/loginProvider.dart';
import 'package:prototype/screens/login/view/loginPage.dart';
import 'package:prototype/screens/registration/provider/registrationProvider.dart';
import 'package:prototype/screens/registration/view/registrationPage.dart';
import 'package:prototype/screens/splash/view/splashPage.dart';
import 'package:flutter/material.dart';
import 'package:prototype/screens/splash/view/splashPage.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart'; // Import the Firebase Core package.
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'dart:io' show Platform;
// ...

void main() async {
  // Initialize Firebase.
  if (Platform.isAndroid) {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  } else {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => IntroProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => LoginProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => RegistrationProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ChangePasswordProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashPage(),
      ),
    ),
  );
}
