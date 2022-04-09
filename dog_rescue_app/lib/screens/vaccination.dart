import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class VaccinationScreen extends StatefulWidget {
  VaccinationScreen({Key? key}) : super(key: key);

  @override
  State<VaccinationScreen> createState() => _VaccinationScreenState();
}

class _VaccinationScreenState extends State<VaccinationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vaccination"),
        backgroundColor: Colors.teal,
      ),
      body: ListView(children: [
        Container(child: Image.asset('assets/images/docv.png')),
        GFAccordion(
            title: 'Puppy booster shots',
            content:
                "Booster shots help your puppy's immune system develop or 'boost'. Puppies typically receive their first round of vaccines between the ages of 6 and 8, and then every 3 to 4 weeks until they reach the age of 20 weeks. Vaccines given to your puppy at each checkup will vary according on his or her size, local legislation, and risk factors based on location and lifestyle.",
            collapsedIcon: Icon(Icons.add),
            expandedIcon: Icon(Icons.minimize)),
        GFAccordion(
            title: 'Puppy vaccine schedule',
            content:
                "1. Distemper, Hepatitis (Adenovirus), and Parvovirus are the most important vaccine components. The DHP or DAP in a vaccine's initials is represented by this. \n 2. Between 6 and 8 weeks of age, pups begin their vaccine series, with boosters every 3 to 4 weeks until they reach the age of 20 weeks. A rabies vaccine is given at some point, usually around the age of 12 weeks or older. \n 3. Older puppies (over 16 weeks old) who have not yet had their first vaccine will require that vaccine as well as a booster in 3 to 4 weeks. At one of these appointments, the rabies vaccine is also administered. \n 4. Depending on your dog's risk factors, lyme, bordetella, and the canine flu vaccine may be suggested. The canine flu and Lyme vaccines, if administered, are boostered in 3–4 weeks to achieve protection, regardless of age. \n 5. The immunizations provided at each appointment will differ depending on the size of your dog, local legislation, and risk factors based on location and lifestyle. To decide your dog's yearly and lifelong immunization program, we recommend consulting with your veterinarian.",
            collapsedIcon: Icon(Icons.add),
            expandedIcon: Icon(Icons.minimize)),
        GFAccordion(
            title: 'Canine Parvo virus',
            content:
                "Canine parvovirus (CPV) is a highly contagious viral disease that affects puppies and causes acute gastrointestinal sickness. Puppies between the ages of six and twenty weeks are most commonly impacted, however older animals can also be affected. Myocarditis is an uncommon type of the disease that can affect puppies when they are extremely young (neonatal) (an inflammation of the heart muscle).",
            collapsedIcon: Icon(Icons.add),
            expandedIcon: Icon(Icons.minimize)),
        GFAccordion(
            title: 'Symptoms of Canine Parvo virus',
            content:
                "Lethargy, depression, and a loss or lack of appetite are common CPV symptoms, which are followed by a high temperature, vomiting, and diarrhea. CPV is just one of numerous possible causes of bloody diarrhea and/or vomiting in your dog. Several tests can be performed by your veterinarian to detect whether or not your dog is infected with CPV.",
            collapsedIcon: Icon(Icons.add),
            expandedIcon: Icon(Icons.minimize)),
        GFAccordion(
            title: 'Preventive measures of Canine Parvo virus',
            content:
                "This infectious disease has become much less of a hazard to dogs since the introduction of a variety of efficient canine vaccines for CPV. However, this does not negate the fact that CPV is still a significant issue, and vaccination of your dog should not be regarded an option - it is a requirement. The CPV vaccination is frequently given as part of a combination shot that contains the distemper, canine adenovirus, and parainfluenza vaccines, among others. From the time a puppy is 6 weeks old until he is at least 16 weeks old, these injections are given every 3 to 4 weeks. One year later, a booster immunization is advised, followed by one every three years after that.",
            collapsedIcon: Icon(Icons.add),
            expandedIcon: Icon(Icons.minimize)),
      ]),
    );
  }
}
