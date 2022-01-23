// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class Upload extends StatefulWidget {
//   Upload({Key? key}) : super(key: key);

//   @override
//   _UploadState createState() => _UploadState();
// }

// // ignore: camel_case_types
// class _UploadState extends State<Upload> {
//   late String name;
//   late String age;
//   late String gender;
//   // ignore: non_constant_identifier_names
//   late String health_condition;
//   late String description;

//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   Widget _buildName() {
//     return null;
//   }

//   Widget _buildAge() {
//     return null;
//   }

//   Widget _buildGender() {
//     return null;
//   }

//   Widget _buildHealthCondition() {
//     return null;
//   }

//   Widget _buildDescription() {
//     return null;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         bottomOpacity: 0.0,
//         elevation: 0.0,
//         title: Container(
//           margin: EdgeInsets.fromLTRB(39, 0, 0, 0),
//           child: Text(
//             "Upload Post",
//             style:
//                 GoogleFonts.montserrat(fontSize: 27, color: Colors.orange[700]),
//           ),
//         ),
//         leading: IconButton(
//           onPressed: () {},
//           icon: Icon(
//             Icons.menu,
//             color: Colors.black,
//           ),
//         ),
//       ),
//       body: Container(
//         margin: EdgeInsets.all(24),
//         child: Form(
//             child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             _buildName(),
//             _buildAge(),
//             _buildGender(),
//             _buildHealthCondition(),
//             _buildDescription()
//           ],
//         )),
//       ),
//     );
//   }
// }

  //  Container(
  //                 height: 90,
  //                 width: 300,
  //                 padding: EdgeInsets.all(10),
  //                 child: Builder(
  //                   builder: (BuildContext newContext) {
  //                     return ElevatedButton(
  //                       child: Container(
  //                         margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
  //                         child: Row(
  //                           children: [
  //                             Image.asset(
  //                               "assets/images/google_logo.png",
  //                               height: 28,
  //                               width: 40,
  //                               alignment: Alignment(0.09, 0.5),
  //                             ),
  //                             Text('Sign in with Google',
  //                                 style: GoogleFonts.montserrat(
  //                                   fontStyle: FontStyle.normal,
  //                                   fontSize: 20,
  //                                   color: Colors.black,
  //                                 )),
  //                           ],
  //                         ),
  //                       ),
  //                       style: ElevatedButton.styleFrom(
  //                         primary: Colors.white,
  //                         //backgroundColor: Colors.white,
  //                         onSurface: Colors.white,
  //                         shape: (RoundedRectangleBorder(
  //                             borderRadius: BorderRadius.circular(10.0),
  //                             side: BorderSide(color: Colors.white))),
  //                       ),
  //                       onPressed: () {
  //                         final provider = Provider.of<GoogleSignInProvider>(
  //                             context,
  //                             listen: false);
  //                         provider.googleLogin();
  //                       },
  //                     );
  //                   },
  //                 ),
  //               ),
