// import 'package:dog_rescue_app/splash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'splash',
      theme: ThemeData(fontFamily: 'Esteban'),
      home: Scaffold(
        body: ListView(
          children: [
            Container(
                width: 400,
                height: 800,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.orange.shade900, Colors.white10]),
                ),
                child: Column(
                  children: [
                    Container(
                      child: Center(
                        child: Align(
                          alignment: Alignment(0.2, -1),
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
                      child: Text("Let's Rescue",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.esteban(
                              textStyle: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.normal))),
                    ))
                  ],
                )),
            Container()
          ],
        ),
      ),
    );
  }
}
