import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class ImagePick extends StatefulWidget {
  ImagePick({Key? key}) : super(key: key);

  @override
  State<ImagePick> createState() => _ImagePickState();
}

class _ImagePickState extends State<ImagePick> {
  File? image;

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      // ignore: unused_local_variable
      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary);
    }

    // ignore: unused_catch_clause
    on PlatformException catch (e) {
      print("Failed to pick image");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Spacer(),
          image != null
              ? ClipOval(
                  child: Image.file(image!,
                      width: 160, height: 160, fit: BoxFit.cover))
              : GestureDetector(
                  child: Image.asset(
                    'assets/images/profile.png',
                    height: 160,
                    width: 160,
                  ),
                  onTap: () => showPopUpMenu(),
                ),
        ],
      ),
    );
  }

  // Widget buildButton({
  //   required String title,
  //   required IconData icon,
  //   required VoidCallback onClicked,
  // }) =>
  //     ElevatedButton(
  //         style: ElevatedButton.styleFrom(
  //           minimumSize: Size.fromHeight(56),
  //           primary: Colors.teal,
  //           onPrimary: Colors.white,
  //           textStyle: TextStyle(fontSize: 20),
  //         ),
  //         onPressed: onClicked,
  //         child: Row(
  //           children: [
  //             Icon(icon, size: 28),
  //             const SizedBox(width: 16),
  //             Text(title)
  //           ],
  //         ));

  // buildButton(
  //                 title: "Pick Gallery",
  //                 icon: Icons.image_outlined,
  //                 onClicked: () => pickImage(ImageSource.gallery)),
  //             buildButton(
  //                 title: "Pick Camera",
  //                 icon: Icons.camera_alt_outlined,
  //                 onClicked: () => pickImage(ImageSource.camera)),

  showPopUpMenu() {
    showMenu(
        context: context,
        position: RelativeRect.fromLTRB(45, 500, 50, 200),
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
