import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DietScreen extends StatefulWidget {
  DietScreen({Key? key}) : super(key: key);

  @override
  State<DietScreen> createState() => _DietScreenState();
}

class _DietScreenState extends State<DietScreen> {
  late YoutubePlayerController controller;
  @override
  void initState() {
    super.initState();
    const url = 'https://youtu.be/_1IqUdF3F1c';

    controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(url)!,
        flags: const YoutubePlayerFlags(
          mute: false,
          loop: false,
          autoPlay: false,
        ));
  }

  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: controller,
      ),
      builder: (context, player) => Scaffold(
        appBar: AppBar(
          title: Text("Food for Dogs"),
          backgroundColor: Colors.teal,
        ),
        body: ListView(
          children: [
            Container(child: Image.asset('assets/images/dogeat.jpg')),
            GFAccordion(
                title: 'Foods that are dangerous for dogs',
                content:
                    " 1. Avocado : Avocados contain a substance called persin. It's completely safe for those who aren't allergic to it. Large doses, on the other hand, may be poisonous to dogs. \n 2. Alcohol: Even a small amount can cause vomiting, diarrhea, central nervous system depression, coordination issues, breathing difficulties, coma, and even death. The stronger the effect, the smaller the dog. \n 3. Onions and Garlic: A tiny amount every now and then is probably fine. However, poisoning can occur if a big amount is consumed all at once or if smaller doses are consumed on a regular basis. Weakness, vomiting, a lack of appetite, dullness, and shortness of breath are all symptoms of anemia. \n 4. Grapes and Raisins: In dogs, grapes and raisins can cause renal failure. Even a small bit of it can make a dog sick. Vomiting on a regular basis is a warning indication. The dog will become lethargic and dejected within a day. Keep grapes and raisins off counters and other locations where your dog can reach them for the best protection. \n 5. Candy and Gum: Xylitol is used to sweeten candy, gum, toothpaste, baked goods, and some diet meals. Insulin levels in your dog's body may rise as a result of xylitol consumption. This can lead to a reduction in your dog's blood sugar as well as liver failure. Vomiting, tiredness, and a loss of coordination are among the first signs. Seizures may occur at some point in the dog's life. Liver failure can strike in as little as a few days. \n Besides these food other foods like Milk and Other Dairy Products, Macadamia Nuts, Chocolate, Yeast Dough, Sugary Foods and Drinks, Raw Eggs, Persimmons, Peaches, and Plums etc are risky for dogs to eat",
                collapsedIcon: Icon(Icons.add),
                expandedIcon: Icon(Icons.minimize)),
            player,
          ],
        ),
      ),
    );
  }
}
