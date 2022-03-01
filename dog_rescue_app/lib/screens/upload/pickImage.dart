// // ignore_for_file: unused_import, unused_local_variable, unused_element
// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:camera/camera.dart';

// class PickImage extends StatefulWidget {
//   PickImage({Key? key}) : super(key: key);

//   @override
//   State<PickImage> createState() => _PickImageState();
// }

// class _PickImageState extends State<PickImage> {
//   XFile? file;
//   takePhoto(context) async {
//     Navigator.pop(context);
//     XFile? file = await ImagePicker().pickImage(
//       source: ImageSource.camera,
//     );
//     setState(() {
//       this.file = file;
//     });
//   }

//   Future fromGallery() async {
//     Navigator.pop(context);
//     XFile? file = await ImagePicker().pickImage(
//       source: ImageSource.gallery,
//     );
//     setState(() {
//       this.file = file;
//     });

//     selectImage(parentContext) {
//       return showDialog(
//           context: parentContext,
//           builder: (context) {
//             return SimpleDialog(
//               title: Text("Create Post"),
//               children: [
//                 SimpleDialogOption(
//                   child: Text("Photo with Camera"),
//                   //onPressed: () => takePhoto(context),
//                 ),
//                 SimpleDialogOption(
//                   child: Text("Image from Gallery"),
//                   onPressed: () => fromGallery(),
//                 ),
//                 SimpleDialogOption(
//                   child: Text("Cancel"),
//                   onPressed: () => Navigator.pop(context),
//                 ),
//               ],
//             );
//           });
//     }

//     Container buildSplashScreen() {
//       return Container(
//         color: Colors.white,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset("assets/images/upload_icon.jpg"),
//             Padding(
//               padding: EdgeInsets.only(top: 20.0),
//               child: ElevatedButton(
//                 style: ButtonStyle(
//                     backgroundColor:
//                         MaterialStateProperty.all<Color>(Colors.orange),
//                     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                         RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8.0)))),
//                 onPressed: () => selectImage(context),
//                 child: Text(
//                   'Upload Image',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 22.0,
//                   ),
//                 ),
//               ),
//             )
//           ],
//         ),
//       );
//     }

//     @override
//     Widget build(BuildContext context) {
//       return file == null ? buildSplashScreen() : Text("File loaded");
//     }
//   }

//   @override
//   noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
// }
