// import 'package:dog_rescue_app/splash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './login_register.dart';

void main() {
  runApp(new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'splash',
      theme: ThemeData(fontFamily: 'Esteban'),
      home: new MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    new Future.delayed(
      const Duration(seconds: 3),
      () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginRegister()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: ListView(children: [
        Container(
            width: 400,
            height: 800,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.bottomCenter,
                  colors: [Colors.orange.shade700, Colors.white10]),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Center(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Dog Rescue App",
                        //textAlign: TextAlign.center,
                        style: GoogleFonts.esteban(
                          textStyle: TextStyle(
                            fontSize: 48.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Align(
                    alignment: Alignment(0.2, -0.2),
                    child: Text(
                      "Let's Rescue",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.esteban(
                        textStyle: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.normal),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 100.00,
                  height: 100.00,
                  child: Image.asset('assets/images/dog.png'),
                ),
              ],
            )),
      ]),
    );
  }
}
