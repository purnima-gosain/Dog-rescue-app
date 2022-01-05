import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: camel_case_types
class Option_screen extends StatefulWidget {
  Option_screen({Key? key}) : super(key: key);

  @override
  _Option_screenState createState() => _Option_screenState();
}

// ignore: camel_case_types
class _Option_screenState extends State<Option_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey[200],
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(40, 70, 0, 0),
            child: Text(
              "Welcome",
              style: GoogleFonts.montserrat(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange[700]),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(40, 10, 0, 30),
            child: Text(
              "Please login or signup to continue using our app.",
              style: GoogleFonts.montserrat(
                fontSize: 18,
              ),
            ),
          ),
          Container(
            child: ClipOval(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipOval(
                  child: Image.asset('assets/images/logo.jpg'),
                ),
              ],
            )),
          ),
          Container(
            height: 80,
            width: 150,
            padding: EdgeInsets.all(10),
            child: TextButton(
              onPressed: () {},
              child:
                  Text("Sign up", style: GoogleFonts.montserrat(fontSize: 20)),
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.teal,
                onSurface: Colors.white,
                shape: (RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: BorderSide(color: Colors.teal))),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
