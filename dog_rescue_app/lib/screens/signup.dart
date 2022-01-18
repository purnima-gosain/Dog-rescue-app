import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home.dart';

class SIgnUp extends StatefulWidget {
  SIgnUp({Key? key}) : super(key: key);

  @override
  _SIgnUpState createState() => _SIgnUpState();
}

class _SIgnUpState extends State<SIgnUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Container(
          // height: 100,
          width: 300,
          padding: EdgeInsets.all(10),
          child: TextFormField(
            //controller: emailController,
            decoration: InputDecoration(
              // border: OutlineInputBorder(),
              hintText: 'Email',
              hintStyle: TextStyle(color: Colors.grey),
              filled: true,
              fillColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: Colors.white, width: 2),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
          ),
        ),
        Container(
          width: 300,
          padding: EdgeInsets.all(10),
          child: TextFormField(
            //controller: nameController,
            decoration: InputDecoration(
              hintText: 'Password',
              hintStyle: TextStyle(color: Colors.grey),
              filled: true,
              fillColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: Colors.white, width: 2),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          child: ElevatedButton(
            child: Ink(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.teal, Colors.teal.shade100]),
                  borderRadius: BorderRadius.circular(10)),
              child: Container(
                height: 60.9,
                width: 300,
                alignment: Alignment.center,
                child:
                    Text('Log in', style: GoogleFonts.montserrat(fontSize: 20)),
              ),
            ),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.zero,
              primary: Colors.white,
              onSurface: Colors.white,
              shape: (RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(color: Colors.teal))),
            ),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => HomeScreen()));
            },
          ),
        ),
      ],
    ));
  }
}
