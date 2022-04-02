// ignore_for_file: unused_field, unused_local_variable, must_be_immutable
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dog_rescue_app/screens/upload/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import '../home.dart';

class ImagePick extends StatefulWidget {
  String? userId;

  ImagePick({Key? key, this.userId}) : super(key: key);

  @override
  State<ImagePick> createState() => _ImagePickState();
}

class _ImagePickState extends State<ImagePick> {
  // String? _userId;
  // _ImagePickState({required String? userid}) : _userId = userid;
  //initializing parameters
  File? _image;
  final _auth = FirebaseAuth.instance;
  final _formkey = GlobalKey<FormState>();
  final postTitleController = new TextEditingController();
  final descriptionController = new TextEditingController();
  final contactNumController = new TextEditingController();
  final imagePicker = ImagePicker();
  String? downloadURL, postTitle, description, contactNum;

  Future imagePickerMethod() async {
    //picking the image
    final pick = await imagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pick != null) {
        _image = File(pick.path);
      } else {
        showSnackBar("No file selected", Duration(milliseconds: 600));
      }
    });
  }

  //snackbar for showing error
  showSnackBar(String snackText, Duration d) {
    final snackBar = SnackBar(
      content: Text(snackText),
      duration: d,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  //uploading image to firebase storage
  Future uploadPost(File _image) async {
    final postID = DateTime.now().millisecondsSinceEpoch.toString();
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    Reference ref = FirebaseStorage.instance
        .ref()
        .child("${widget.userId}/images")
        .child("post_$postID");
    await ref.putFile(_image);
    downloadURL = await ref.getDownloadURL();
//cloud firestore

    User? user = _auth.currentUser;

    DatabaseModel databaseModel = DatabaseModel();
    databaseModel.uid = widget.userId;
    // databaseModel.contactNum = contactNumController.text;
    databaseModel.postTitle = postTitleController.text;
    databaseModel.description = descriptionController.text;
    databaseModel.imageUrl = downloadURL;

    await firebaseFirestore.collection("post").doc().set(databaseModel.toMap());

    Fluttertoast.showToast(msg: "Uploaded successfully )");

    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => HomeScreen()),
        (route) => false);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Upload'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          //for rounded rectangular clip
          child: ClipRRect(
            child: Column(
              children: [
                Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: postTitleController,
                          autofocus: false,
                          maxLength: 6,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Post title(Rescue, Lost or Found)"),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please Enter Post Title";
                            }
                            return null;
                          },
                          onSaved: (value) {
                            postTitle = value;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: descriptionController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Post Description"),
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please Enter Post Description";
                            }
                            return null;
                          },
                          onSaved: (value) {
                            description = value;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        // TextFormField(
                        //   controller: contactNumController,
                        //   decoration: InputDecoration(
                        //       border: OutlineInputBorder(),
                        //       hintText: "Contact number"),
                        //   keyboardType: TextInputType.number,
                        //   maxLength: 10,
                        //   validator: (value) {
                        //     if (value == null || value.isEmpty) {
                        //       return "Please Enter contact number";
                        //     }
                        //     return value.length < 10
                        //         ? 'Minimum length should be 10'
                        //         : null;
                        //   },
                        //   onSaved: (value) {
                        //     contactNum = value;
                        //   },
                        // ),
                        // SizedBox(
                        //   height: 20,
                        // ),
                      ],
                    )),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                    // flex: 4,
                    child: Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.teal),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: _image == null
                                ? const Center(
                                    child: Text("No image selected"),
                                  )
                                : Image.file(_image!)),
                        ElevatedButton(
                            style:
                                ElevatedButton.styleFrom(primary: Colors.teal),
                            onPressed: () {
                              imagePickerMethod();
                            },
                            child: Text(
                              "Select Image",
                            )),
                      ],
                    ),
                  ),
                )),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.teal),
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        uploadPost(_image!);
                      } else {
                        showSnackBar("Please fill the form first",
                            Duration(milliseconds: 700));
                      }
                    },
                    child: Text("Post")),
              ],
            ),
          ),
        ),
      ),
    );
    // ));
  }
}
