class UserModel {
  String? uid;
  String? email;
  String? firstName;
  String? secondName;

  UserModel({
    this.uid,
    this.email,
    this.firstName,
    this.secondName,
  });

  //taking data from the server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      firstName: map['firstName'],
      secondName: map['secondName'],
    );
  }

  //sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'firstName': firstName,
      'secondName': secondName,
    };
  }

  // Future<void> addPost(Map postData, String uid) async {
  //   await FirebaseFirestore.instance
  //       .collection("users")
  //       .document(uid)
  //       .collection("Post")
  //       .add(addPost)
  //       .catchError((e) {
  //     print(e);
  //   });
  // }
}
