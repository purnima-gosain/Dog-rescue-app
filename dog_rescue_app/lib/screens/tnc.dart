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
                " 1. The ADOPTER is fully responsible for the animal's well-being, including but not limited to food costs, medical care, and overall well-being."),
            SizedBox(
              height: 20,
            ),
            Text(
                " 2. The ADOPTER acknowledges that this animal will not be given as a gift."),
            SizedBox(
              height: 20,
            ),
            Text(
                " 3. The ADOPTER agrees that the animal will not be transported in the back of a pickup truck."),
            SizedBox(
              height: 20,
            ),
            Text(
                " 4. If euthanasia is required, the ADOPTER agrees to have it performed by a licensed veterinarian in a veterinary clinic rather than an animal shelter."),
            SizedBox(
              height: 20,
            ),
            Text(
                " 5. I/we agree to pay any court expenses and legal fees if Dog Rescue App needs to take legal action to recover this adopted animal or otherwise enforce the terms of this agreement."),
            SizedBox(
              height: 20,
            ),
            Text(
                " 6. If any user found misusing the contact number of other user then Dog Rescue App will not be responsible."),
            SizedBox(
              height: 20,
            ),
            Text(
                " 7. The remaining sections of the Agreement will remain valid and enforceable if any provision of the Agreement is or becomes void or unenforceable due to force or operation of law."),
            SizedBox(
              height: 20,
            ),
            Text(
                " 8. Any damage or injury caused by any animal adopted is not the responsibility of the dog rescue app or its employees."),
            SizedBox(
              height: 20,
            ),
            Text(
                " 9. The ADOPTER consents to Dog Rescue App checking the animal's acceptance of the new surroundings and family on a regular basis in order to ensure compliance with all Adoption Agreement terms. This could entail a visit to your home. At any time, Dog Rescue App retains the right to visit and evaluate the animal. Dog Rescue App also reserves the right to retrieve an animal if it is deemed necessary due to neglect, abuse, insufficient housing or veterinary care, or a breach of contract. Without a legal writ or order, the ADOPTER undertakes to transfer custody of an animal to Dog Rescue App immediately upon request until the scenario warranting the reclamation is resolved."),
            SizedBox(
              height: 20,
            ),
            Text(
                " 10. The ADOPTER agrees to keep the animal as a house pet instead of a kennel animal. Although a fenced yard is not essential, when a dog is left alone at home, it will be placed in a secure area. Tie-outs do not take the place of a fenced yard or run. Invisible fence is not recommended by Dog Rescue App."),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
