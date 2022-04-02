import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

class DatabaseModel {
  String? postTitle;
  String? description;
  String? uid;
  String? imageUrl;
  String? postId;

  DatabaseModel(
      {this.postTitle, this.description, this.uid, this.imageUrl, this.postId});

  //taking data from the server
  factory DatabaseModel.fromMap(map) {
    return DatabaseModel(
        postTitle: map['postTitle'],
        description: map['description'],
        uid: map['uid'],
        imageUrl: map['imageUrl'],
        postId: map['postId']);
  }

  //sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'postTitle': postTitle,
      'description': description,
      'uid': uid,
      'imageUrl': imageUrl,
      'postId': postId
    };
  }
}

getPostData() async {
  return await firebaseFirestore.collection("post").snapshots();
}
