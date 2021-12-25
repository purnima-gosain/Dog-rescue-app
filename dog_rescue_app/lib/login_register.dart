import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginRegister extends StatefulWidget {
  LoginRegister({Key key}) : super(key: key);

  @override
  _LoginRegisterState createState() => _LoginRegisterState();
}

class _LoginRegisterState extends State<LoginRegister> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Container(
            width: 400,
            height: 800,
            color: Colors.orange.shade700,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipOval(
                  child: Image.asset('assets/images/logo.jpg'),
                ),
                Container(
                  // height: 100,
                  width: 300,
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      // border: OutlineInputBorder(),
                      hintText: 'Username',
                      hintStyle: TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40.0)),
                        borderSide: BorderSide(color: Colors.white, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40.0)),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Container(
                  // height: 100,
                  width: 300,
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      // border: OutlineInputBorder(),
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40.0)),
                        borderSide: BorderSide(color: Colors.white, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40.0)),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                // Container(
                //   width: 100.00,
                //   height: 100.00,
                //   child: Image.asset('assets/images/dog.png'),
                // ),
                Container(
                  height: 70.9,
                  width: 150,
                  padding: EdgeInsets.all(10),
                  child: TextButton(
                    child: Text('Log in', style: TextStyle(fontSize: 20)),
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Colors.teal,
                      onSurface: Colors.white,
                      shape: (RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0),
                          side: BorderSide(color: Colors.teal))),
                    ),
                    onPressed: () {
                      print('Pressed');
                    },
                  ),
                ),
              ],
            )),
      ]),
    );
  }
}
