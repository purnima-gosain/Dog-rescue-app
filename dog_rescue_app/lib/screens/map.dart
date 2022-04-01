import 'package:url_launcher/url_launcher.dart';

import 'package:flutter/material.dart';

class MapUtils {
  MapUtils._();

  static Future<void> openMap(double latitude, double longitude) async {
    String googleMapUrl =
        "https://www.google.com/maps/search/?api=1&query=$latitude,$longitude";

    if (await canLaunch(googleMapUrl)) {
      await launch(googleMapUrl);
    } else {
      throw 'Could not open the Map';
    }
  }
}

class GoogleMap extends StatelessWidget {
  const GoogleMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Center(
        child: TextButton(
          child: Text('Open Google map'),
          style: TextButton.styleFrom(backgroundColor: Colors.teal),
          onPressed: () {
            MapUtils.openMap(47.628293260721, -122.34263420105);
          },
        ),
      ),
    ));
  }
}
