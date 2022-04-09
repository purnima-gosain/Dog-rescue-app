// ignore_for_file: unused_local_variable, must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dog_rescue_app/model/user_model.dart';
import 'package:dog_rescue_app/screens/login_register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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
  String? downloadURL;
  final imagePicker = ImagePicker();
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

  Future pickImage() async {
    final pick = await imagePicker.pickImage(source: ImageSource.gallery);
    // if (_image == null) return;
    // final imageTemporary = File(_image.path);
    setState(() {
      if (pick != null) {
        _image = File(pick.path);
      } else {
        showSnackBar("No file selected", Duration(milliseconds: 600));
      }
    });
  }

  showSnackBar(String snackText, Duration d) {
    final snackBar = SnackBar(
      content: Text(snackText),
      duration: d,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future uploadFile(File _image) async {
    final postID = DateTime.now().millisecondsSinceEpoch.toString();
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    Reference ref = FirebaseStorage.instance
        .ref()
        .child("${widget.userId}/profile")
        .child("post_$postID");
    await ref.putFile(_image);
    downloadURL = await ref.getDownloadURL();
// uploading url of image to firestore
    await firebaseFirestore
        .collection("users")
        .doc(widget.userId)
        .collection("profile")
        .add({'downloadURL': downloadURL}).whenComplete(
            () => showSnackBar("Uploaded successfully", Duration(seconds: 5)));
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
                  onPressed: (() {
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) => const Center(
                                child: SpinKitFadingGrid(
                              size: 50,
                              color: Colors.teal,
                            )));
                    uploadFile(_image!);
                  }),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.teal,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(70, 0, 0, 0),
                    child: Row(
                      children: [Text("Upload profile picture")],
                    ),
                  ),
                ),
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
            child: Text("Select image"),
            onTap: () => pickImage(),
            value: 1,
          ),
        ]);
  }
}
