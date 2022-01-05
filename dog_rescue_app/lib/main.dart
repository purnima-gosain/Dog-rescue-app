//  import 'package:firebase_core/firebase_core.dart';
import 'package:dog_rescue_app/home.dart';
import 'package:dog_rescue_app/login_register.dart';
import 'package:dog_rescue_app/option_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'splash',
    theme: ThemeData(
      textTheme: GoogleFonts.montserratTextTheme(),
    ),
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // get key => null;

  @override
  void initState() {
    new Future.delayed(
      const Duration(seconds: 3),
      () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) {
          return LoginRegister();
        }),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: ListView(children: [
        Container(
          width: 400,
          height: 800,
          color: Colors.grey[200],
          child: ClipOval(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipOval(
                child: Image.asset('assets/images/logo.jpg'),
              ),
            ],
          )),
        )
      ]),
    );
  }
}
