import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dog_rescue_app/model/user_model.dart';
import 'package:dog_rescue_app/screens/add_post.dart';
import 'package:dog_rescue_app/screens/helpline.dart';
import 'package:dog_rescue_app/screens/map.dart';
import 'package:dog_rescue_app/screens/profileScreen.dart';
import 'package:dog_rescue_app/screens/tnc.dart';
import 'package:dog_rescue_app/screens/upload/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:dog_rescue_app/screens/upload/pickImage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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

  // late Stream postStream;
  Widget postList() {
    return Container(
        child: StreamBuilder(
            stream: FirebaseFirestore.instance.collection("post").snapshots(),
            builder: (BuildContext context,
                AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
              if (snapshot.hasData && snapshot.data != null) {
                if (snapshot.data!.docs.isNotEmpty) {
                  return ListView.separated(
                    itemBuilder: (context, int index) {
                      Map<String, dynamic> docData =
                          snapshot.data!.docs[index].data();

                      if (docData.isEmpty) {
                        return Text("Document is empty");
                      }

                      String ptitle =
                          snapshot.data!.docs.elementAt(index).get("postTitle");
                      String pdescription = snapshot.data!.docs
                          .elementAt(index)
                          .get("description");
                      String url =
                          snapshot.data!.docs.elementAt(index).get("imageUrl");

                      return Column(
                        children: [
                          ListTile(
                            title: Text(ptitle),
                            subtitle: Text(pdescription),
                          ),
                          Image.network(url, height: 300, fit: BoxFit.cover)
                        ],
                      );
                    },
                    separatorBuilder: (__, ___) {
                      return Divider();
                    },
                    itemCount: snapshot.data!.docs.length,
                  );
                } else {
                  return const Center(child: Text("No document available"));
                }
              } else {
                return const Center(child: Text("Getting error"));
              }
            }));
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
        onTap: () {},
        child: Container(
          child: postList(),
        ),
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
          if (value == 1) MapUtils.openMap(47.628293260721, -122.34263420105);
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

class PostTile extends StatelessWidget {
  final String imgUrl, title, description;
  PostTile(
      {required this.imgUrl, required this.description, required this.title});

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Container(
        child: Stack(
          children: [
            Image.network(imgUrl),
            Container(
              child: Column(
                children: [Text(title), Text(description)],
              ),
            )
          ],
        ),
      ),
    ]);
  }
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
