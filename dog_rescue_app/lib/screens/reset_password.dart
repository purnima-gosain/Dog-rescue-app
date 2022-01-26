import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatefulWidget {
  ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final emailField = TextFormField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return "Please Enter your Email.";
        }
        //reg expression for email validation
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return "Please enter a valid email.";
        }
        return null;
      },
      onSaved: (value) {
        emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.mail),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Enter email address",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        iconTheme: IconThemeData(color: Colors.teal),
        title: Text(
          "Reset Password",
          style: TextStyle(
            color: Colors.teal,
            fontSize: 24,
          ),
        ),
      ),
      backgroundColor: Colors.grey[200],
      body: ListView(
        children: [
          Container(
            width: 400,
            height: 400,
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
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(35, 15, 35, 0),
            child: emailField,
          ),
          Padding(
            padding: const EdgeInsets.all(36.0),
            child: Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(10),
              color: Colors.teal,
              child: MaterialButton(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 15),
                  minWidth: MediaQuery.of(context).size.width,
                  onPressed: () {
                    FirebaseAuth.instance
                        .sendPasswordResetEmail(email: emailController.text)
                        .then((value) => Navigator.of(context).pop());
                  },
                  child: Text(
                    "Reset Password",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
