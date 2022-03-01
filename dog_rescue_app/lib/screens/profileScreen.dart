import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dog_rescue_app/model/user_model.dart';
import 'package:dog_rescue_app/screens/login_register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("Profile"),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 220, 0),
                child: Text(
                  "First name",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Container(
                height: 50,
                width: 300,
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(15),
                child: Text(
                  " ${loggedInUser.firstName} ",
                  style: TextStyle(
                      color: Colors.teal, fontWeight: FontWeight.bold),
                ),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(50)),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 220, 0),
                child: Text(
                  "Last name",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Container(
                height: 50,
                width: 300,
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(15),
                child: Text(
                  "${loggedInUser.secondName}",
                  style: TextStyle(
                      color: Colors.teal, fontWeight: FontWeight.bold),
                ),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(50)),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 250, 0),
                child: Text(
                  "Email",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Container(
                height: 50,
                width: 300,
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(15),
                child: Text(
                  " ${loggedInUser.email}",
                  style: TextStyle(
                      color: Colors.teal, fontWeight: FontWeight.bold),
                ),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(50)),
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 50,
                width: 300,
                child: ElevatedButton(
                  onPressed: (() => logout(context)),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.teal,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(95, 0, 0, 0),
                    child: Row(
                      children: [Icon(Icons.logout), Text("Logout")],
                    ),
                  ),
                ),
              ),
              // ActionChip(
              //     backgroundColor: Colors.teal,
              //     label: Text("Logout"),
              //     onPressed: () {
              //       logout(context);
              //     })
            ],
          ),
        ),
      ),
    );
  }

  Future logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen(key: null)));
  }
}
