// ignore_for_file: unused_local_variable, avoid_web_libraries_in_flutter
import 'package:dog_rescue_app/screens/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UploadScreen extends StatefulWidget {
  UploadScreen({Key? key}) : super(key: key);

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  final _formKey = GlobalKey<FormState>();
  String? postImageUrl, postTitle, postDescription;

  @override
  Widget build(BuildContext context) {
    //for firebase storage

    return Scaffold(
      appBar: AppBar(
        title: Text("Upload post"),
        backgroundColor: Colors.teal,
      ),
      body: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              TextFormField(
                validator: (val) => val!.isEmpty ? "Enter image url" : null,
                decoration: InputDecoration(hintText: "Post image url"),
                onChanged: (val) {
                  postImageUrl = val;
                },
              ),
              SizedBox(
                height: 6,
              ),
              TextFormField(
                inputFormatters: [
                  LengthLimitingTextInputFormatter(6),
                ],
                validator: (val) => val!.isEmpty ? "Enter Post title" : null,
                decoration: InputDecoration(
                    hintText: "Post title (Rescue, Lost or Found)"),
                onChanged: (val) {
                  postImageUrl = val;
                },
              ),
              SizedBox(
                height: 6,
              ),
              TextFormField(
                inputFormatters: [
                  LengthLimitingTextInputFormatter(500),
                ],
                validator: (val) =>
                    val!.isEmpty ? "Enter Post description" : null,
                decoration: InputDecoration(hintText: "Description"),
                onChanged: (val) {
                  postImageUrl = val;
                },
              ),
              SizedBox(
                height: 6,
              ),
              Spacer(),
              greenButton(context, "Upload post"),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
