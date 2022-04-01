import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dog_rescue_app/model/user_model.dart';
import 'package:dog_rescue_app/screens/add_post.dart';
import 'package:dog_rescue_app/screens/helpline.dart';
import 'package:dog_rescue_app/screens/map.dart';
import 'package:dog_rescue_app/screens/profileScreen.dart';
import 'package:dog_rescue_app/screens/tnc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:dog_rescue_app/screens/upload/pickImage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

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
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        title: Container(
          margin: EdgeInsets.fromLTRB(39, 0, 0, 0),
          child: Text(
            "Let's Rescue",
            style:
                GoogleFonts.montserrat(fontSize: 27, color: Colors.orange[700]),
          ),
        ),
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 180, 0),
                  child: Text(
                    "Hey Hooman",
                    style: GoogleFonts.montserrat(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 180, 10),
                  child: Text(
                    "Let's be a friend.",
                    style: GoogleFonts.montserrat(
                      fontSize: 15,
                      color: Colors.black,
                      //fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Card(
                  child: InkWell(
                    splashColor: Colors.orange,
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => UploadPost()));
                    },
                    child: SizedBox(
                      width: 350,
                      height: 350,
                      child: Column(
                        children: [
                          Container(
                            child: Image(
                              image: AssetImage('assets/images/dog4.jpg'),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 270, 0),
                            child: Text(
                              "Lucy",
                              style: GoogleFonts.montserrat(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Row(
                            children: [
                              Icon(FontAwesomeIcons.venus),
                              Text("Female  "),
                              Icon(FontAwesomeIcons.calendarAlt),
                              Text(" 2 months old"),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 10, 80, 0),
                            child: Text("I am searching for perfect owner."),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
            child: Column(
              children: [
                Card(
                  child: InkWell(
                    splashColor: Colors.orange,
                    onTap: () {},
                    child: SizedBox(
                      width: 350,
                      height: 350,
                      child: Column(
                        children: [
                          Container(
                            child: Image(
                              image: AssetImage('assets/images/dog5.jpg'),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 270, 0),
                            child: Text(
                              "Puntey",
                              style: GoogleFonts.montserrat(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Row(
                            children: [
                              Icon(FontAwesomeIcons.mars),
                              Text("Male  "),
                              Icon(FontAwesomeIcons.calendarAlt),
                              Text(" +7 years old"),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(5, 5, 50, 0),
                            child: Text(
                                "I've been lost anyone who knows me please contact my owner."),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
            child: Column(
              children: [
                Card(
                  child: InkWell(
                    splashColor: Colors.orange,
                    onTap: () {},
                    child: SizedBox(
                      width: 350,
                      height: 350,
                      child: Column(
                        children: [
                          Container(
                            child: Image(
                              image: AssetImage('assets/images/dog6.jpg'),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 250, 0),
                            child: Text(
                              "unknown",
                              style: GoogleFonts.montserrat(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Row(
                            children: [
                              Icon(FontAwesomeIcons.mars),
                              Text("Male  "),
                              Icon(FontAwesomeIcons.calendarAlt),
                              Text(" 3 months old"),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 180, 0),
                            child: Text("Too lazy to find owner."),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
            child: Column(
              children: [
                Card(
                  child: InkWell(
                    splashColor: Colors.orange,
                    onTap: () {},
                    child: SizedBox(
                      width: 350,
                      height: 350,
                      child: Column(
                        children: [
                          Container(
                            child: Image(
                              image: AssetImage('assets/images/dog7.jpg'),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 270, 0),
                            child: Text(
                              "Ben",
                              style: GoogleFonts.montserrat(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Row(
                            children: [
                              Icon(FontAwesomeIcons.mars),
                              Text("Male  "),
                              Icon(FontAwesomeIcons.calendarAlt),
                              Text(" 8 years old"),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 10, 80, 0),
                            child: Text("He has been lost since 1 week."),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
                title: Text("Terms and Conditions"),
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Tnc()));
                }),
            ListTile(title: Text("Vaccination"), onTap: () {}),
            ListTile(title: Text("Diet Plan"), onTap: () {}),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          if (value == 0)
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => HomeScreen()));
          if (value == 1)
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => GoogleMap()));
          if (value == 2)
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => HelplineScreen()));
          // if (value == 0) Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeScreen()));
          if (value == 3)
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => ProfileScreen()));
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_filled,
                //
              ),
              label: "",
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
            icon: Icon(Icons.near_me, color: Colors.grey),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.support_agent_outlined, color: Colors.grey),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outlined, color: Colors.grey),
            label: "",
          )
        ],
        selectedItemColor: Colors.orange,
      ),

      //for floating action button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ImagePick(userId: loggedInUser.uid)));
          //ImagePick(userId: loggedInUser.uid)
        },
        backgroundColor: Colors.teal,
        child: const Icon(Icons.add),
      ),
    );
  }
}
