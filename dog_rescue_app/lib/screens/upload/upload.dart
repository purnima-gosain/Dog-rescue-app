import 'package:flutter/material.dart';

class UploadScreen extends StatefulWidget {
  UploadScreen({Key? key}) : super(key: key);

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  final descriptionEditingController = new TextEditingController();
  final ageEditingController = new TextEditingController();
  final genderEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final descrptionField = TextFormField(
        autofocus: false,
        controller: descriptionEditingController,
        keyboardType: TextInputType.multiline,
        maxLines: null,
        validator: (value) {
          if (value!.isEmpty) {
            return "Please write the description";
          }
        });
    return Container();
  }
}
