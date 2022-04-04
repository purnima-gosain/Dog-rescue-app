// ignore_for_file: unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dog_rescue_app/model/user_model.dart';
import 'package:dog_rescue_app/screens/login_register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProfileScreen extends StatefulWidget {
  String? userId;
  ProfileScreen({Key? key, this.userId}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  File? _image;
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

  Future pickImage(ImageSource source) async {
    try {
      final _image = await ImagePicker().pickImage(source: source);
      if (_image == null) return;

      // ignore: unused_local_variable
      final imageTemporary = File(_image.path);
      setState(() => this._image = imageTemporary);
      final postID = DateTime.now().millisecondsSinceEpoch.toString();
      FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
      Reference ref = FirebaseStorage.instance
          .ref()
          .child("${widget.userId}/profile")
          .child("post_$postID");
      await ref.putFile(imageTemporary);
    }

    // ignore: unused_catch_clause
    on PlatformException catch (e) {
      print("Failed to pick image");
    }
  }

  Future uploadFile(_image) async {
    final postID = DateTime.now().millisecondsSinceEpoch.toString();
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    Reference ref = FirebaseStorage.instance
        .ref()
        .child("${widget.userId}/profile")
        .child("post_$postID");
    await ref.putFile(_image);
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
              _image != null
                  ? GestureDetector(
                      onTap: () => showPopUpMenu(),
                      child: ClipOval(
                          child: Image.file(_image!,
                              width: 160, height: 160, fit: BoxFit.cover)),
                    )
                  : GestureDetector(
                      child: Image.asset(
                        'assets/images/profile.png',
                        height: 160,
                        width: 160,
                      ),
                      onTap: () => showPopUpMenu(),
                    ),

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

  showPopUpMenu() {
    showMenu(
        context: this.context,
        position: RelativeRect.fromLTRB(100, 400, 100, 200),
        items: [
          PopupMenuItem(
            child: Text("Pick from gallery"),
            onTap: () => pickImage(ImageSource.gallery),
            value: 1,
          ),
          PopupMenuItem(
            child: Text("Pick from Camera"),
            onTap: () => pickImage(ImageSource.camera),
            value: 1,
          ),
        ]);
  }
}
