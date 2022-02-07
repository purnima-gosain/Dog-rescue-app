// ignore_for_file: unused_local_variable, avoid_web_libraries_in_flutter
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:dog_rescue_app/screens/upload/storage_service.dart';
import 'package:file_picker/file_picker.dart';
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
    //for firebase storage
    final Storage storage = Storage();

    //description field
    final descrptionField = TextFormField(
      autofocus: false,
      controller: descriptionEditingController,
      keyboardType: TextInputType.multiline,
      maxLines: null,
      validator: (value) {
        if (value!.isEmpty) {
          return "Please write the description";
        }
      },
      onSaved: (value) {
        descriptionEditingController.text = value!;
      },
    );
//agefield
    final ageField = TextFormField(
      autofocus: false,
      controller: ageEditingController,
      keyboardType: TextInputType.number,
      maxLength: 100,
    );
//gender field
    // final genderField = RadioButtonInputElement();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("Upload Post"),
      ),
      body: ListView(
        children: [
          Center(
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.teal),
                onPressed: () async {
                  final results = await FilePicker.platform.pickFiles(
                    allowMultiple: false,
                    type: FileType.custom,
                    allowedExtensions: ['png', 'jpg'],
                  );
                  if (results == null) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("No file selected"),
                    ));
                    return null;
                  }
                  final path = results.files.single.path;
                  final filename = results.files.single.name;

                  storage
                      .uploadFile(path!, filename)
                      .then((value) => print('Done!!'));
                },
                child: Text("Upload Image")),
          ),
          FutureBuilder(
              future: storage.listFiles(),
              builder: (BuildContext context,
                  AsyncSnapshot<firebase_storage.ListResult> snapshot) {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData) {
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    height: 50,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: snapshot.data!.items.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ElevatedButton(
                            onPressed: () {},
                            child: Text(snapshot.data!.items[index].name),
                          );
                        }),
                  );
                }
                if (snapshot.connectionState == ConnectionState.waiting ||
                    !snapshot.hasData) {
                  return CircularProgressIndicator();
                }
                return Container();
              }),
        ],
      ),
    );
  }
}
