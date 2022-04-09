import 'package:dog_rescue_app/screens/login_register.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  get key => null;

  @override
  void initState() {
    new Future.delayed(
      const Duration(seconds: 3),
      () => Navigator.of(context).push(
        MaterialPageRoute(builder: (context) {
          return LoginScreen(
            key: null,
          );
        }),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // return MultiProvider(
    //     providers: [
    //       ChangeNotifierProvider(
    //         create: (context) => GoogleSignInController(),
    //         child: LoginScreen(key: key),
    //       )
    //     ],
    return Scaffold(
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
