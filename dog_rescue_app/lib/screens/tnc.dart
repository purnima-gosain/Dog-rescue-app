import 'package:flutter/material.dart';

class Tnc extends StatefulWidget {
  Tnc({Key? key}) : super(key: key);

  @override
  State<Tnc> createState() => _TncState();
}

class _TncState extends State<Tnc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Terms and conditions"),
        backgroundColor: Colors.teal,
      ),
      body: ListView(
        children: [
          Text(
              " 1. The ADOPTER assumes full responsibility of the animal, including but not limited to food bills, health care and general well-being."),
        ],
      ),
    );
  }
}
