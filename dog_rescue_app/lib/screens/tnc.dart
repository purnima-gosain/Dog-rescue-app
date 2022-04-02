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
      body: Container(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: ListView(
          children: [
            Text(
                " 1. The ADOPTER assumes full responsibility of the animal, including but not limited to food bills, health care and general well-being."),
            SizedBox(
              height: 20,
            ),
            Text(
                " 2. The ADOPTER agrees that this animal will not be acquired as a surprise gift."),
            SizedBox(
              height: 20,
            ),
            Text(
                " 3. The ADOPTER agrees the animal will not be transported in the back of an open vehicle such as a pick-up truck."),
            SizedBox(
              height: 20,
            ),
            Text(
                " 4. If euthanasia becomes necessary, the ADOPTER agrees to have a licensed veterinarian perform this service in a veterinary clinic, and not at an animal shelter."),
            SizedBox(
              height: 20,
            ),
            Text(
                " 5. Should it be necessary for Dog rescue App to take legal action to recover this adopted animal or otherwise enforce provisions in this agreement, I/we agree to pay all court costs and legal fees."),
            SizedBox(
              height: 20,
            ),
            Text(
                " 6. If any user found misusing the contact number of other user then legal action will be taken."),
            SizedBox(
              height: 20,
            ),
            Text(
                " 7. If any provision of the Agreement is or becomes void or unenforceable by force or operation of law, the other provisions shall remain valid and enforceable."),
            SizedBox(
              height: 20,
            ),
            Text(
                " 8. Dog rescue app and its representatives accept no responsibility for damage or injury caused by any animal adopted."),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
