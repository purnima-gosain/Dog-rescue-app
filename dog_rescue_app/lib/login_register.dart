import 'package:dog_rescue_app/provider/google_sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'splash',
    theme: ThemeData(
      textTheme: GoogleFonts.montserratTextTheme(),
    ),
    home: new LoginRegister(),
  ));
}

class LoginRegister extends StatefulWidget {
  //LoginRegister({required Key key}) : super(key: key);

  @override
  _LoginRegisterState createState() => _LoginRegisterState();
}

class _LoginRegisterState extends State<LoginRegister> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: Scaffold(
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
                  Container(
                    child: Text(
                      'Forget password?',
                      style: TextStyle(color: Colors.teal),
                    ),
                  ),
                  Container(
                    height: 70.9,
                    width: 150,
                    padding: EdgeInsets.all(10),
                    child: TextButton(
                      child: Text('Log in',
                          style: GoogleFonts.montserrat(fontSize: 20)),
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
                  Container(
                    height: 90,
                    width: 300,
                    padding: EdgeInsets.all(10),
                    child: Builder(
                      builder: (BuildContext newContext) {
                        return ElevatedButton(
                          child: Container(
                            margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/images/google_logo.png",
                                  height: 28,
                                  width: 40,
                                  alignment: Alignment(0.09, 0.5),
                                ),
                                Text('Sign in with Google',
                                    style: GoogleFonts.montserrat(
                                      fontStyle: FontStyle.normal,
                                      fontSize: 20,
                                      color: Colors.black,
                                    )),
                              ],
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            //backgroundColor: Colors.white,
                            onSurface: Colors.white,
                            shape: (RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40.0),
                                side: BorderSide(color: Colors.white))),
                          ),
                          onPressed: () {
                            final provider = Provider.of<GoogleSignInProvider>(
                                context,
                                listen: false);
                            provider.googleLogin();
                          },
                        );
                      },
                    ),
                  )
                ],
              )),
        ]),
      ));
}
