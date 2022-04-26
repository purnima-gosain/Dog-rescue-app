//importing all the packages

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dog_rescue_app/model/user_model.dart';
import 'package:dog_rescue_app/screens/diet.dart';
import 'package:dog_rescue_app/screens/helpline.dart';
import 'package:dog_rescue_app/screens/profileScreen.dart';
import 'package:dog_rescue_app/screens/tnc.dart';
import 'package:dog_rescue_app/screens/upload/database.dart';
import 'package:dog_rescue_app/screens/vaccination.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:dog_rescue_app/screens/upload/pickImage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

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
  DatabaseModel data = DatabaseModel();

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

  void inState() {
    super.initState();
    FirebaseFirestore.instance.collection("post").doc().get().then((value) {
      this.data = DatabaseModel.fromMap(value.data());
      setState(() {});
    });
  }

// making widget for listing all the documents or post user uploaded.
  Widget postList() {
    FirebaseFirestore.instance.collection("post").snapshots();

    return Container(
        child: StreamBuilder(
            stream: FirebaseFirestore.instance.collection("post").snapshots(),
            builder: (BuildContext context,
                AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
              if (snapshot.hasData && snapshot.data != null) {
                if (snapshot.data!.docs.isNotEmpty) {
                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, int index) {
                      Map<String, dynamic> docData =
                          snapshot.data!.docs[index].data();

                      if (docData.isEmpty) {
                        return Text("Document is empty");
                      }

                      String pid = snapshot.data!.docs.elementAt(index).id;
                      String ptitle =
                          snapshot.data!.docs.elementAt(index).get("postTitle");
                      String uid =
                          snapshot.data!.docs.elementAt(index).get("uid");
                      String pdescription = snapshot.data!.docs
                          .elementAt(index)
                          .get("description");
                      String url =
                          snapshot.data!.docs.elementAt(index).get("imageUrl");

                      return Padding(
                        padding: const EdgeInsets.fromLTRB(10, 8.0, 8.0, 10),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(300, 10, 0, 0),
                                child: GestureDetector(
                                    child: Icon(Icons.delete),
                                    onTap: () {
                                      if (uid == loggedInUser.uid) {
                                        showPopUpMenu(pid);
                                      } else {
                                        showAlertDialog(context);
                                      }
                                    }),
                              ),
                              ListTile(
                                title: Text(ptitle),
                                subtitle: Text(pdescription),
                              ),
                              Image.network(url, height: 250, fit: BoxFit.cover)
                            ],
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(child: Text("No document available"));
                }
              } else {
                return const Center(child: Text("Getting error"));
              }
            }));
  }

  postDel(final dId) async {
    FirebaseFirestore.instance.collection("post").snapshots();

    final _db = FirebaseFirestore.instance;
    await _db.collection("post").doc(dId).delete();
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
      body: GestureDetector(
        child: Container(
            child: postList(),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Color.fromARGB(255, 232, 232, 232),
                  blurRadius: 2,
                  offset: Offset(2, 8))
            ])),
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
            ListTile(
                title: Text("Vaccination"),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: ((context) => VaccinationScreen())));
                }),
            ListTile(
                title: Text("Diet Plan"),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (((context) => DietScreen()))));
                }),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          if (value == 0)
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => HomeScreen()));
          if (value == 1) MapUtils.openMap(27.71226019953982, 85.3306405718298);
          if (value == 2)
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => HelplineScreen()));

          if (value == 3)
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ProfileScreen(userId: loggedInUser.uid)));
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

//this is for popup message
  showPopUpMenu(String pid) {
    showMenu(
        context: this.context,
        position: RelativeRect.fromLTRB(100, 400, 100, 200),
        items: [
          PopupMenuItem(
            child: Text("Are you sure want to delete?"),
            onTap: () {
              postDel(pid);
            },
            value: 1,
          ),
        ]);
  }
}

showAlertDialog(BuildContext context) {
  // set up the button
  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: () {},
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    // title: Text("My title"),
    content: Text("You cannot delete other's post."),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

class MapUtils {
  MapUtils._();

  static Future<void> openMap(double latitude, double longitude) async {
    String googleMapUrl =
        "https://www.google.com/maps/search/?api=1&query=$latitude,$longitude";

    if (await canLaunch(googleMapUrl)) {
      await launch(googleMapUrl);
    } else {
      throw 'Could not open the Map';
    }
  }
}
