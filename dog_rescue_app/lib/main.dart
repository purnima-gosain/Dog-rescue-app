import 'dart:async';
import 'package:dog_rescue_app/screens/login_register.dart';
import 'package:dog_rescue_app/screens/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:dog_rescue_app/controllers/google_login_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'splash',
    theme: ThemeData(
      textTheme: GoogleFonts.montserratTextTheme(),
    ),
    home: SplashScreen(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => GoogleSignInController(),
            child: LoginScreen(key: key),
          )
        ],
        child: MaterialApp(
          home: LoginScreen(key: key),
        ));
  }
}

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => new _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   get key => null;

//   // get key => null;

//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//         providers: [
//           ChangeNotifierProvider(
//             create: (context) => GoogleSignInController(),
//             child: LoginScreen(key: key),
//           )
//         ],
//         child: MaterialApp(
//           home: SplashScreen(),
//         ));
//   }
// }
